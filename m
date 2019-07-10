Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E3E6495D
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jul 2019 17:11:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6635B6E0FD;
	Wed, 10 Jul 2019 15:11:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770058.outbound.protection.outlook.com [40.107.77.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CECEA6E0FE
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jul 2019 15:11:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VUy9OIOTF+I0k1wE3Lpet/5GI8/Ig2mvmVdg4nKmbBiwJy2V+p+xm2hsXwSBtnXvESjS/t+5bMNJQ5u2ZkPZRL75WJf6gIqjXg78eub6Vdc8Mvl11q7OCpwZi6TZdvesGlflRiBF8rnMoSruY7NmJ/PuOOtupmrMA43C+Y7b8eepyrdWFXsXhOz4FHN+CHczx7m7zXJTwNh33NGf91er7QDapEPgM2nIT7e5oL8coNydukoLGQGkYQIy/kbWqxE9nheJKj7ZSGH5+//kGFLKwvm9PVjBH+c1XnHbXE6yUvZ+PC0EbMfrQGgr1yDkCeNuay85r3sSyLys9avvM4wRCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lk6cPd8D13RUMI/GNRBkhn3NZOk+txCkUHcihwC3mLE=;
 b=PJDMRoaM3Ra0aJMGoxn3mm4i8BzyByfg4AMct40L47dMDxdEc+PEE9/OyNKZpXxICnrlikZ7cbWhvLyBkGs5/s7Ve3YJXd2pSY0hUvFfIoM3EkLO7y/78ytRvHx3F+MmEhddA+9UvU+rGnvXUsF0eKtqiFfbqsy/ZZ9/EHSvzxFggBOPMhDPHsFitc8aeHhX4q+Mr1byjxhMB6teLRPWAEpZaH/qMKL/FK8L5JEEn6qgb0Ih4ndcVAyR2GE0T+sb5Es+/V5XWxe3Kv6wRtSm+ATp4GSz643DcVtUW6tyIoAEP6UDwf5e3jOohfVgoGsx+HbNtlyd/jKdPEZnKItHSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB2504.namprd12.prod.outlook.com (52.132.141.147) by
 DM5PR12MB1786.namprd12.prod.outlook.com (10.175.91.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Wed, 10 Jul 2019 15:11:13 +0000
Received: from DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::900b:8d66:43ba:8b3d]) by DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::900b:8d66:43ba:8b3d%4]) with mapi id 15.20.2073.008; Wed, 10 Jul 2019
 15:11:13 +0000
From: "Huang, JinHuiEric" <JinHuiEric.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdkfd: fix cp hang in eviction
Thread-Topic: [PATCH] drm/amdkfd: fix cp hang in eviction
Thread-Index: AQHVNzG2m1wN7ONOrEOL9e+6GiOjnw==
Date: Wed, 10 Jul 2019 15:11:13 +0000
Message-ID: <1562771444-7490-1-git-send-email-JinhuiEric.Huang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YT1PR01CA0025.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::38)
 To DM5PR12MB2504.namprd12.prod.outlook.com
 (2603:10b6:4:b5::19)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: daee9a77-4241-4bb0-4080-08d70548d907
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1786; 
x-ms-traffictypediagnostic: DM5PR12MB1786:
x-microsoft-antispam-prvs: <DM5PR12MB1786179E4FF8C3EA23E94A0B82F00@DM5PR12MB1786.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0094E3478A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(39860400002)(346002)(396003)(189003)(199004)(6116002)(68736007)(3846002)(86362001)(8676002)(53936002)(2616005)(71190400001)(81156014)(81166006)(25786009)(486006)(64756008)(66556008)(66476007)(5640700003)(66446008)(6512007)(14454004)(71200400001)(66946007)(6916009)(476003)(36756003)(14444005)(66066001)(2351001)(6436002)(4326008)(7736002)(478600001)(99286004)(5660300002)(386003)(50226002)(2906002)(6486002)(316002)(305945005)(102836004)(2501003)(26005)(54906003)(8936002)(186003)(52116002)(6506007)(256004)(309714004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1786;
 H:DM5PR12MB2504.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5jLeZlgTIzK6c0ty78422y3+p9bjk4ibWPZakHytrVf5H0cA2lkg7+51XRIyeOTs8WdRiv+KHJp3A9em08XAzUnaOTA5hTqHOFE44TV8FUhFD5fpRcXB5NNvOlo2aLelKvugcevxeYLELrPm75O3cQuJZtW1PXBiFk9gvBqTqfzDLlmEd1CsW9fiMKliLappchvitF9Zfq+qcyfeJybMvtrlUrYLUVXRe/qsLvNZub91ntMMjCcorI2xqpKilehwNhE04JLHCzPHL7FHK5U2FBefxtT0wFxanwd7pHjVjk2X3mL+Fko1I+NuVbgG17NoiEN2bnSl97MXaHAu6TgzRUi3gJM0nt0WwYgC/Vz0/A5Gk/1UXYOQZIbeYKm6C1uBhkad33Fp4g7M1PnZ7Bjb7mVAO1VyfSc1EGlWBt2Q3cA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daee9a77-4241-4bb0-4080-08d70548d907
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2019 15:11:13.4659 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jinhuang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1786
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lk6cPd8D13RUMI/GNRBkhn3NZOk+txCkUHcihwC3mLE=;
 b=vHcHwTfmfxx6jPmM7jcrtNaVmin8q2C3UAzpJmjN7qGgvLeJreIbLaCGTCGvsFhZhYJRgmnn23HNpKGiLkf9Q+AUrtx4PWlul6H2w0cRBGqZ1gpsUU1e67A2n265bd/lCV6QU+pb/+yr6fFLND1OjbRYZPcGYk5duU5Z2texw0E=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=JinHuiEric.Huang@amd.com; 
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: "Huang, JinHuiEric" <JinHuiEric.Huang@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIGNwIGhhbmcgb2NjdXJzIGluIE9DTCBjb25mb3JtYW5jZSB0ZXN0IG9ubHkgb24gc3VwZXJt
aWNybwpwbGF0Zm9ybSB3aGljaCBoYXMgNDAgY29yZXMgYW5kIHRoZSB0ZXN0IGdlbmVyYXRlcyA0
MCB0aHJlYWRzLgpUaGUgcm9vdCBjYXVzZSBpcyByYWNlIGNvbmRpdGlvbiBpbiBub24tcHJvdGVj
dGVkIGZsYWdzLgoKVGhlIGZpeCBpcyB0byBhZGQgZmxhZ3Mgb2YgaXNfZXZpY3RlZCBhbmQgaXNf
YWN0aXZlKGluaXRfbXFkKCkpCmludG8gcHJvdGVjdGVkIGFyZWEuCgpTaWduZWQtb2ZmLWJ5OiBF
cmljIEh1YW5nIDxKaW5odWlFcmljLkh1YW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMgfCAxNyArKysrKysrKysrLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9t
YW5hZ2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21h
bmFnZXIuYwppbmRleCA5ZmZkZGE1Li41MzVjOTgxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYwpAQCAtMTE1NywxMiAr
MTE1Nyw3IEBAIHN0YXRpYyBpbnQgY3JlYXRlX3F1ZXVlX2Nwc2NoKHN0cnVjdCBkZXZpY2VfcXVl
dWVfbWFuYWdlciAqZHFtLCBzdHJ1Y3QgcXVldWUgKnEsCiAKIAltcWRfbWdyID0gZHFtLT5tcWRf
bWdyc1tnZXRfbXFkX3R5cGVfZnJvbV9xdWV1ZV90eXBlKAogCQkJcS0+cHJvcGVydGllcy50eXBl
KV07Ci0JLyoKLQkgKiBFdmljdGlvbiBzdGF0ZSBsb2dpYzogbWFyayBhbGwgcXVldWVzIGFzIGV2
aWN0ZWQsIGV2ZW4gb25lcwotCSAqIG5vdCBjdXJyZW50bHkgYWN0aXZlLiBSZXN0b3JpbmcgaW5h
Y3RpdmUgcXVldWVzIGxhdGVyIG9ubHkKLQkgKiB1cGRhdGVzIHRoZSBpc19ldmljdGVkIGZsYWcg
YnV0IGlzIGEgbm8tb3Agb3RoZXJ3aXNlLgotCSAqLwotCXEtPnByb3BlcnRpZXMuaXNfZXZpY3Rl
ZCA9ICEhcXBkLT5ldmljdGVkOworCiAJaWYgKHEtPnByb3BlcnRpZXMudHlwZSA9PSBLRkRfUVVF
VUVfVFlQRV9TRE1BIHx8CiAJCXEtPnByb3BlcnRpZXMudHlwZSA9PSBLRkRfUVVFVUVfVFlQRV9T
RE1BX1hHTUkpCiAJCWRxbS0+YXNpY19vcHMuaW5pdF9zZG1hX3ZtKGRxbSwgcSwgcXBkKTsKQEAg
LTExNzMsOSArMTE2OCwxNyBAQCBzdGF0aWMgaW50IGNyZWF0ZV9xdWV1ZV9jcHNjaChzdHJ1Y3Qg
ZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwgc3RydWN0IHF1ZXVlICpxLAogCQlyZXR2YWwgPSAt
RU5PTUVNOwogCQlnb3RvIG91dF9kZWFsbG9jYXRlX2Rvb3JiZWxsOwogCX0KKworCWRxbV9sb2Nr
KGRxbSk7CisJLyoKKwkgKiBFdmljdGlvbiBzdGF0ZSBsb2dpYzogbWFyayBhbGwgcXVldWVzIGFz
IGV2aWN0ZWQsIGV2ZW4gb25lcworCSAqIG5vdCBjdXJyZW50bHkgYWN0aXZlLiBSZXN0b3Jpbmcg
aW5hY3RpdmUgcXVldWVzIGxhdGVyIG9ubHkKKwkgKiB1cGRhdGVzIHRoZSBpc19ldmljdGVkIGZs
YWcgYnV0IGlzIGEgbm8tb3Agb3RoZXJ3aXNlLgorCSAqLworCXEtPnByb3BlcnRpZXMuaXNfZXZp
Y3RlZCA9ICEhcXBkLT5ldmljdGVkOworCXEtPnByb3BlcnRpZXMuaXNfc3VzcGVuZGVkID0gZmFs
c2U7CiAJbXFkX21nci0+aW5pdF9tcWQobXFkX21nciwgJnEtPm1xZCwgcS0+bXFkX21lbV9vYmos
CiAJCQkJJnEtPmdhcnRfbXFkX2FkZHIsICZxLT5wcm9wZXJ0aWVzKTsKLQlkcW1fbG9jayhkcW0p
OwogCiAJbGlzdF9hZGQoJnEtPmxpc3QsICZxcGQtPnF1ZXVlc19saXN0KTsKIAlxcGQtPnF1ZXVl
X2NvdW50Kys7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
