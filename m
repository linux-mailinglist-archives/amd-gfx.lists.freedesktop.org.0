Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4692AA6A4
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Sep 2019 17:01:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 682C3899B5;
	Thu,  5 Sep 2019 15:01:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780054.outbound.protection.outlook.com [40.107.78.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 517F4899B5
 for <amd-gfx@lists.freedesktop.org>; Thu,  5 Sep 2019 15:01:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MbYa3WoklE9cELg/qNuq38N125tn/QXRjPtxaLsTiHKZGt6mmXf9e5YdKUmOFYZ6pAa3uT8rrPkkk+xPg5bMpkzGL7Lp2r/jXBv11EcanF2JmqJFFprdpZj1vMzTUCStUBkCuYNNEF3KK9VuU6ojk9aGzDIE8q8KZxVAPhNV/4n5Ce3A5dpu2b1IpxjZalQCX1UcSm/T20oRl3kPUs7JT6bpuoUurXQO7AiQwzLUZJ2EU0f51AZy4FrWCaXd1+Kh6Tn4fSRx88XNfJoiF3nHFkKLTmTZ7pwa7s7n2wOMd1F0O9rarHJnQN6wNVDSphRFHrcUdHCjnfVE8AJD7BQPLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2csifu37fVVHTIg/40o9in/bg9C1mgga3WSQP/JAZuM=;
 b=LodI75Fnd2jeXXDJzMF3ZMGfckTfE7/G4HgUhQ4+LX+WZM5xndmX3zsX3fiiM/DBgN0/a/9yEn3myO82Q7EGKRov0if7F6gcwtkrbx8FCiAHxtQtA5vhGzIqPEUU13a4hMI2bJtDesREhqJlVcJh7HvMCwzu7DDBt6e9pSwWyoYCySuSQwiYEXvGRl2hovap/r1WFnEMtpXM16Nc+HdEFII/rQSDbSfPuJ+/BGRa3Scs2Vn1OpO9KYVfyrY319L9tIj5+Oh1lB8BVt2ARhe/qiyg6K5h9NLncqRrI2oqfr5PFJPuQBYaSs0UcoMCicr2dIXZ6F8avQ/T9ph2ofvxxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB3306.namprd12.prod.outlook.com (20.179.106.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.21; Thu, 5 Sep 2019 15:01:09 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa%4]) with mapi id 15.20.2220.022; Thu, 5 Sep 2019
 15:01:09 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdkfd: Fix a building error when KFD_SUPPORT_IOMMU_V2 is
 turned off
Thread-Topic: [PATCH] drm/amdkfd: Fix a building error when
 KFD_SUPPORT_IOMMU_V2 is turned off
Thread-Index: AQHVY/q/UqDhTpoHg0CPjQ9UdOIUgg==
Date: Thu, 5 Sep 2019 15:01:09 +0000
Message-ID: <20190905150056.10329-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0068.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::45) To DM6PR12MB2778.namprd12.prod.outlook.com
 (2603:10b6:5:50::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3aa4d3b3-220c-4afe-1848-08d73211e256
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3306; 
x-ms-traffictypediagnostic: DM6PR12MB3306:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3306007C06D761B4BB2FD659F0BB0@DM6PR12MB3306.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:418;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(396003)(366004)(346002)(189003)(199004)(102836004)(71200400001)(71190400001)(4326008)(8936002)(6116002)(86362001)(66066001)(316002)(5640700003)(14454004)(3846002)(386003)(8676002)(478600001)(99286004)(53936002)(1076003)(25786009)(486006)(186003)(2616005)(2351001)(2501003)(52116002)(26005)(6486002)(5660300002)(476003)(66446008)(305945005)(6506007)(6436002)(2906002)(66476007)(7736002)(6916009)(66946007)(256004)(64756008)(66556008)(36756003)(6512007)(81156014)(50226002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3306;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3+dr6daNbgvsOUL0Qv4g0xumNlGrEbWrUnnIiPmSQRkWB4IGrfY7ExGuoXj3Llf5tCK5RJvbFs5Oa64K9lhdXRKD58axlSmzAso2RfDiqWj/RXCIbNNXB0JbA6If+8ScIkI4HYcEcBz2Q89SxW25gX/qnyihoQ1oVGObbL8OwLxzCVVmb8fkvxiCoSbE5s0hvc1K4k3RwKCyT/Q5lexoRBa+iE25iCx7P0Ekz86bp4GVoLIgT3aLg6Wndf5zBtRmE2mF6D859ByYNQvwYnjdtbG5rmwpKlDZSiWlJ/V2ucRN2nwtUXbN3t34DIhfYwnbI4q+N2m6MLkFDWo7IjBmgeSQDS2zV1BwGLJXcZNjLJ7EVy/LUBY528dbPpc+l6QyyMUbMG92w2ylOdAqT2dj6Y1qLA6Y82ufF8Yxem/kdSA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aa4d3b3-220c-4afe-1848-08d73211e256
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 15:01:09.0579 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: knPTVhNgDObt5sB+urIolEulDkqsbZR759cpnuZkkpzYDV3jl8d1pspkzz+nWLS2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3306
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2csifu37fVVHTIg/40o9in/bg9C1mgga3WSQP/JAZuM=;
 b=bhKJ/M+RvTbRpmcfybMnJPypkLuV862lDiOxaz9KU6qgEdiKogdD94jX3jjVV0PynD2uc5EvzjIlV5rUKjMgCllWuMLQj9oHvU52HloZE7h04vNFuPreQ/4iLlBRJJB/qD32zSSPKiIWfHdmEp1Q8IbH/x4lehqVfUE+TRhenSc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yong.Zhao@amd.com; 
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
Cc: "Zhao, Yong" <Yong.Zhao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIGlzc3VlIHdhcyBhY2NpZGVudGFsbHkgaW50cm9kdWNlZCByZWNlbnRseS4KCkNoYW5nZS1J
ZDogSTNiMjFjYWExNTk2ZDRmN2RlMTg2NmJlZDFjYjVkOGZlMWI1MTUwNGMKU2lnbmVkLW9mZi1i
eTogWW9uZyBaaGFvIDxZb25nLlpoYW9AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfZGV2aWNlLmMgfCA2ICsrKystLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2
aWNlLmMKaW5kZXggMjY3ZWIyZTAxYmVjLi4yMWY1YzU5N2U2OTkgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMKQEAgLTM3MSwxMSArMzcxLDE0IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3Qga2ZkX2RldmljZV9pbmZvIG5hdmkxMF9kZXZpY2VfaW5mbyA9IHsKIAogLyogRm9y
IGVhY2ggZW50cnksIFswXSBpcyByZWd1bGFyIGFuZCBbMV0gaXMgdmlydHVhbGlzYXRpb24gZGV2
aWNlLiAqLwogc3RhdGljIGNvbnN0IHN0cnVjdCBrZmRfZGV2aWNlX2luZm8gKmtmZF9zdXBwb3J0
ZWRfZGV2aWNlc1tdWzJdID0geworI2lmZGVmIEtGRF9TVVBQT1JUX0lPTU1VX1YyCiAJW0NISVBf
S0FWRVJJXSA9IHsma2F2ZXJpX2RldmljZV9pbmZvLCBOVUxMfSwKKwlbQ0hJUF9DQVJSSVpPXSA9
IHsmY2Fycml6b19kZXZpY2VfaW5mbywgTlVMTH0sCisJW0NISVBfUkFWRU5dID0geyZyYXZlbl9k
ZXZpY2VfaW5mbywgTlVMTH0sCisjZW5kaWYKIAlbQ0hJUF9IQVdBSUldID0geyZoYXdhaWlfZGV2
aWNlX2luZm8sIE5VTEx9LAogCVtDSElQX1RPTkdBXSA9IHsmdG9uZ2FfZGV2aWNlX2luZm8sIE5V
TEx9LAogCVtDSElQX0ZJSkldID0geyZmaWppX2RldmljZV9pbmZvLCAmZmlqaV92Zl9kZXZpY2Vf
aW5mb30sCi0JW0NISVBfQ0FSUklaT10gPSB7JmNhcnJpem9fZGV2aWNlX2luZm8sIE5VTEx9LAog
CVtDSElQX1BPTEFSSVMxMF0gPSB7JnBvbGFyaXMxMF9kZXZpY2VfaW5mbywgJnBvbGFyaXMxMF92
Zl9kZXZpY2VfaW5mb30sCiAJW0NISVBfUE9MQVJJUzExXSA9IHsmcG9sYXJpczExX2RldmljZV9p
bmZvLCBOVUxMfSwKIAlbQ0hJUF9QT0xBUklTMTJdID0geyZwb2xhcmlzMTJfZGV2aWNlX2luZm8s
IE5VTEx9LApAQCAtMzgzLDcgKzM4Niw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qga2ZkX2Rldmlj
ZV9pbmZvICprZmRfc3VwcG9ydGVkX2RldmljZXNbXVsyXSA9IHsKIAlbQ0hJUF9WRUdBMTBdID0g
eyZ2ZWdhMTBfZGV2aWNlX2luZm8sICZ2ZWdhMTBfdmZfZGV2aWNlX2luZm99LAogCVtDSElQX1ZF
R0ExMl0gPSB7JnZlZ2ExMl9kZXZpY2VfaW5mbywgTlVMTH0sCiAJW0NISVBfVkVHQTIwXSA9IHsm
dmVnYTIwX2RldmljZV9pbmZvLCBOVUxMfSwKLQlbQ0hJUF9SQVZFTl0gPSB7JnJhdmVuX2Rldmlj
ZV9pbmZvLCBOVUxMfSwKIAlbQ0hJUF9BUkNUVVJVU10gPSB7JmFyY3R1cnVzX2RldmljZV9pbmZv
LCAmYXJjdHVydXNfZGV2aWNlX2luZm99LAogCVtDSElQX05BVkkxMF0gPSB7Jm5hdmkxMF9kZXZp
Y2VfaW5mbywgTlVMTH0sCiB9OwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
