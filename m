Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6090EBF94B
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 20:38:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC3066EDBC;
	Thu, 26 Sep 2019 18:38:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730050.outbound.protection.outlook.com [40.107.73.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8516EDBC
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 18:38:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iEXfzwpaccwc5XTIg/i934aYF/07wlNsIi+zwYcKEK/Xnchoj2qY4OouaEDIUiQGKrGUZp21osxK9UXpN/55Cu9yWSErZaelfzJ9RBDU5b0gR/MUo7UqRAnLuokZJcAUIKMbmWOL0keoQUJhYbhA5zSYXKYSf2nOy2Oyj4lMU8FFeb4MZ7fDJcAedcNAiiwYZH2yyqFYKEXgMQIGc2qhX72KdaolL0w883QAEdn4kNx8+fPTwdPcm1Qup67ha814P6kDWPfgo2eVGLTBf37enIGe7OX1PqNvKz/rp2AY6a9ZB/tSR5Z96amTZptZ70auaa9RqUGB9mkE9T2qc23L7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgFn0TTKb5QpTVrWlS3i97aV7C4g+juLNibVsLC1Axs=;
 b=QIaX1ytTgODoO3todo0Zz6IFHy44Y660j6zLcUrlGc3bbq8Ex3KNFmYiTgAv1G0d3tZsJEGlyJFEa1vQErcTNhVeTWxVfUtPczGzPtKMqBak55Cx5+FjxDz5a6btxjMZHh7nvpmdpIcmHgx59DULlEfM6k01nLHlXi5Dxab2AkrVyhVDPj038S70yy32FPzfP+6pdRPZM20tnG1NMq3jZ9US8mwM+P8yw5TzF+9StnVOCbPQqMia7dv1Pb31VZgcBFc/nXd/ZPzW7oYtueltrpZeVWDvR+JbBtM4PIOWAZ4/69W1JdM8LWzA+wJylOGdOqp2kfuMJjrOpqYV4Kgbfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB3466.namprd12.prod.outlook.com (20.178.198.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Thu, 26 Sep 2019 18:38:44 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa%4]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 18:38:44 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/6] drm/amdkfd: Move the control stack on GFX10 to userspace
 buffer
Thread-Topic: [PATCH 1/6] drm/amdkfd: Move the control stack on GFX10 to
 userspace buffer
Thread-Index: AQHVdJmfl/AON9ofHUyHILchJs7hyw==
Date: Thu, 26 Sep 2019 18:38:43 +0000
Message-ID: <20190926183826.18813-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0031.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::44)
 To DM6PR12MB2778.namprd12.prod.outlook.com
 (2603:10b6:5:50::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d039ff87-f023-409a-30b6-08d742b0c24e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3466; 
x-ms-traffictypediagnostic: DM6PR12MB3466:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB346631B14433903F5AC9B6F7F0860@DM6PR12MB3466.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(189003)(199004)(476003)(6436002)(305945005)(7736002)(50226002)(14454004)(8936002)(81156014)(81166006)(8676002)(256004)(5660300002)(14444005)(2351001)(6512007)(4326008)(86362001)(316002)(2501003)(2906002)(186003)(3846002)(6116002)(99286004)(52116002)(71200400001)(71190400001)(102836004)(25786009)(1076003)(26005)(36756003)(66066001)(6916009)(6506007)(386003)(478600001)(64756008)(66556008)(5640700003)(486006)(66446008)(66946007)(2616005)(6486002)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3466;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DJluh9Kphyj2iJuoknfyf7/UajRkD/gL+kPNDFojfkM/jp9hEq3evKbyn5UqQ167rmWVwQfGK2k+lVknEgeKa3tN0pIhmn0/EOZ2E8UYWcYNDpqyCFTFPBLlCv9GP8Z+MsScJAaD7zJHn1HTOpPlVIDYUQCJTdEyEZNA0XxxxCsbjJMvxM3hOOUTUG3GkwoqJTqljta9jewfSsFyA6595NatFLiiq1WCf1ZeK23MW5rMhVdBdsFKVTJVUsVod4Ij+OF0XrHLMoaT80v61nXjGjREyy96L8TE6mQicliA+H1F+WXxRUULmbs0/ZDMUF9z3Ir992v7dDR63rghf5/o6VQu9pQU3lAxyJzM6MVkmIBs7IWRR0g/r0VwhuTeX7l4uLD8e3ebReg6A+PqjzmI+C8oBqbOD+dNX8an4sS0UEs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d039ff87-f023-409a-30b6-08d742b0c24e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 18:38:44.0274 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 04cn5S7ueRSYlp4rRZthRErZ1NhE90bDMIQlOhMoom1Ua5eQrTx0zGLR64xK+oVo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3466
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgFn0TTKb5QpTVrWlS3i97aV7C4g+juLNibVsLC1Axs=;
 b=sSiXvTj/+b2vh6gofRlIUwoCNngVGaEKtNWqkGf5xRNop7MzDpOsv9EfBg8cu5Bf/cgF/rTyM6tsMlyagzu15LHV64DvU2kQOkSGWTDw6dfmtc6LkeYtHuJXGG1Mq2n2GiMNhlwKVIT1jdXNsgmPo6sUpVOUghvFcFp4loCyxyM=
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

VGhlIEdGWDEwIGRvZXMgbm90IHJlcXVpcmUgdGhlIGNvbnRyb2wgc3RhY2sgdG8gYmUgcmlnaHQg
YWZ0ZXIgbXFkCmJ1ZmZlciBhbnkgbW9yZSwgc28gbW92ZSBpdCBiYWNrIHRvIHVzZXJzYXBjZSBh
bGxvY2F0ZWQgQ1NXUiBidWZmZXIuCgpDaGFuZ2UtSWQ6IEk0NDZjOTY4NTU0OWEwOWFjODg0NmE0
MmVlMjJkODZjZmI5M2ZkOThjClNpZ25lZC1vZmYtYnk6IFlvbmcgWmhhbyA8WW9uZy5aaGFvQGFt
ZC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfbXFkX21hbmFnZXJfdjEwLmMg
IHwgMzcgKystLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgMzMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX21xZF9tYW5hZ2VyX3YxMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X21xZF9tYW5hZ2VyX3YxMC5jCmluZGV4IDI5ZDUwZDZhZjlkNy4uZTJmYjc2MjQ3ZjQ3IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfbXFkX21hbmFnZXJfdjEwLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX21xZF9tYW5hZ2VyX3YxMC5jCkBA
IC02OSwzNSArNjksMTMgQEAgc3RhdGljIHZvaWQgdXBkYXRlX2N1X21hc2soc3RydWN0IG1xZF9t
YW5hZ2VyICptbSwgdm9pZCAqbXFkLAogc3RhdGljIHN0cnVjdCBrZmRfbWVtX29iaiAqYWxsb2Nh
dGVfbXFkKHN0cnVjdCBrZmRfZGV2ICprZmQsCiAJCXN0cnVjdCBxdWV1ZV9wcm9wZXJ0aWVzICpx
KQogewotCWludCByZXR2YWw7Ci0Jc3RydWN0IGtmZF9tZW1fb2JqICptcWRfbWVtX29iaiA9IE5V
TEw7CisJc3RydWN0IGtmZF9tZW1fb2JqICptcWRfbWVtX29iajsKIAotCS8qIEZyb20gVjksICBm
b3IgQ1dTUiwgdGhlIGNvbnRyb2wgc3RhY2sgaXMgbG9jYXRlZCBvbiB0aGUgbmV4dCBwYWdlCi0J
ICogYm91bmRhcnkgYWZ0ZXIgdGhlIG1xZCwgd2Ugd2lsbCB1c2UgdGhlIGd0dCBhbGxvY2F0aW9u
IGZ1bmN0aW9uCi0JICogaW5zdGVhZCBvZiBzdWItYWxsb2NhdGlvbiBmdW5jdGlvbi4KLQkgKi8K
LQlpZiAoa2ZkLT5jd3NyX2VuYWJsZWQgJiYgKHEtPnR5cGUgPT0gS0ZEX1FVRVVFX1RZUEVfQ09N
UFVURSkpIHsKLQkJbXFkX21lbV9vYmogPSBremFsbG9jKHNpemVvZihzdHJ1Y3Qga2ZkX21lbV9v
YmopLCBHRlBfTk9JTyk7Ci0JCWlmICghbXFkX21lbV9vYmopCi0JCQlyZXR1cm4gTlVMTDsKLQkJ
cmV0dmFsID0gYW1kZ3B1X2FtZGtmZF9hbGxvY19ndHRfbWVtKGtmZC0+a2dkLAotCQkJQUxJR04o
cS0+Y3RsX3N0YWNrX3NpemUsIFBBR0VfU0laRSkgKwotCQkJCUFMSUdOKHNpemVvZihzdHJ1Y3Qg
djEwX2NvbXB1dGVfbXFkKSwgUEFHRV9TSVpFKSwKLQkJCSYobXFkX21lbV9vYmotPmd0dF9tZW0p
LAotCQkJJihtcWRfbWVtX29iai0+Z3B1X2FkZHIpLAotCQkJKHZvaWQgKikmKG1xZF9tZW1fb2Jq
LT5jcHVfcHRyKSwgdHJ1ZSk7Ci0JfSBlbHNlIHsKLQkJcmV0dmFsID0ga2ZkX2d0dF9zYV9hbGxv
Y2F0ZShrZmQsIHNpemVvZihzdHJ1Y3QgdjEwX2NvbXB1dGVfbXFkKSwKLQkJCQkmbXFkX21lbV9v
YmopOwotCX0KLQotCWlmIChyZXR2YWwpIHsKLQkJa2ZyZWUobXFkX21lbV9vYmopOworCWlmIChr
ZmRfZ3R0X3NhX2FsbG9jYXRlKGtmZCwgc2l6ZW9mKHN0cnVjdCB2MTBfY29tcHV0ZV9tcWQpLAor
CQkJJm1xZF9tZW1fb2JqKSkKIAkJcmV0dXJuIE5VTEw7Ci0JfQogCiAJcmV0dXJuIG1xZF9tZW1f
b2JqOwotCiB9CiAKIHN0YXRpYyB2b2lkIGluaXRfbXFkKHN0cnVjdCBtcWRfbWFuYWdlciAqbW0s
IHZvaWQgKiptcWQsCkBAIC0yNTAsMTQgKzIyOCw3IEBAIHN0YXRpYyBpbnQgZGVzdHJveV9tcWQo
c3RydWN0IG1xZF9tYW5hZ2VyICptbSwgdm9pZCAqbXFkLAogc3RhdGljIHZvaWQgZnJlZV9tcWQo
c3RydWN0IG1xZF9tYW5hZ2VyICptbSwgdm9pZCAqbXFkLAogCQkJc3RydWN0IGtmZF9tZW1fb2Jq
ICptcWRfbWVtX29iaikKIHsKLQlzdHJ1Y3Qga2ZkX2RldiAqa2ZkID0gbW0tPmRldjsKLQotCWlm
IChtcWRfbWVtX29iai0+Z3R0X21lbSkgewotCQlhbWRncHVfYW1ka2ZkX2ZyZWVfZ3R0X21lbShr
ZmQtPmtnZCwgbXFkX21lbV9vYmotPmd0dF9tZW0pOwotCQlrZnJlZShtcWRfbWVtX29iaik7Ci0J
fSBlbHNlIHsKLQkJa2ZkX2d0dF9zYV9mcmVlKG1tLT5kZXYsIG1xZF9tZW1fb2JqKTsKLQl9CisJ
a2ZkX2d0dF9zYV9mcmVlKG1tLT5kZXYsIG1xZF9tZW1fb2JqKTsKIH0KIAogc3RhdGljIGJvb2wg
aXNfb2NjdXBpZWQoc3RydWN0IG1xZF9tYW5hZ2VyICptbSwgdm9pZCAqbXFkLAotLSAKMi4xNy4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
