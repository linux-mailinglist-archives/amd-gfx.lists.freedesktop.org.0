Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E38BEAFE
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 05:50:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9EAE6EC8F;
	Thu, 26 Sep 2019 03:50:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750079.outbound.protection.outlook.com [40.107.75.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465056ECBF
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 03:50:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmcPZkqOjG1vkvtpk0ULBl1E54+rETAKcenqDvM0jRa5wycgwhIxNLzIArgvjZmZ3PZ4hYcheVrPM4WujKP4aknzfJL5HOcuPff+eyFJVB8LM8tS9Bgzr7tb+rp1KdQhA79ldxf84M2fyLqkh1F28HGMAO5bBYuNdPk0EXSfuloEivwqX8/4k94tINil1PIqEt/JbrtoLu/iz60CTB8+NkrqbFIUsqm+e0bfxBfaX9vNRZ/PK8+ueN1vb3zVhR8iU/I6jtdtdlt8ESfWH9oyr2/GkBgtAO+qTY11KmTEsXNk8qIj3bpRsUvCMm/50v2cPFX2G7xsNxQHqQxzrjsd9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STqpuy3kq6gFEUrA7oph70Pi0bll8QnXFjLA7CVf8Eo=;
 b=LQs8j5X79vNMWjc9ZB0JEgRmsm5KIBslZeKAZ9XMX0RHH2IGFGcee9MsgWmq3BY2XpicTH12svUUb5HvGItQaY8rvIkKUr1I1Z05V1DPdAJuQipcjt5e09TGlH9C41BT9ygLt9+j6mKIlEX+QXNdHHLhHdhF9AKru+VXBbNueqOEEdsH6jwVHRA+XngE9FETGR1jMxgi1d7v1DUEVNBWWWcjBucNeVa3EYStVg0QpGXwPsWJqSxBzx3deZWVeUHnehd9xgthjG30wPqnIvP1wZa/KKxNwVO4Y7d6/rwZ5/0Nki5CFKyXT5G3zul7hsItmMT9j/JWXxutwRH7dY0WzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) by
 MN2PR12MB3469.namprd12.prod.outlook.com (20.178.242.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Thu, 26 Sep 2019 03:50:09 +0000
Received: from MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41]) by MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41%7]) with mapi id 15.20.2305.017; Thu, 26 Sep 2019
 03:50:09 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 4/8] drm/amd/powerplay: add interface for getting workload type
Thread-Topic: [PATCH 4/8] drm/amd/powerplay: add interface for getting
 workload type
Thread-Index: AQHVdB19RUvx3tqku0ixCMRcusaRpA==
Date: Thu, 26 Sep 2019 03:50:09 +0000
Message-ID: <1569469774-16813-4-git-send-email-Prike.Liang@amd.com>
References: <1569469774-16813-1-git-send-email-Prike.Liang@amd.com>
In-Reply-To: <1569469774-16813-1-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR03CA0048.apcprd03.prod.outlook.com
 (2603:1096:202:17::18) To MN2PR12MB3536.namprd12.prod.outlook.com
 (2603:10b6:208:104::19)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e6c3bf9-93ec-419a-4de8-08d74234a01b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3469; 
x-ms-traffictypediagnostic: MN2PR12MB3469:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3469FB50A7EBB49D5C3394FEFB860@MN2PR12MB3469.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(199004)(189003)(316002)(256004)(2351001)(14444005)(476003)(7736002)(386003)(66556008)(64756008)(66946007)(305945005)(66476007)(478600001)(6486002)(86362001)(76176011)(5640700003)(2906002)(6436002)(52116002)(5660300002)(8936002)(26005)(54906003)(81156014)(11346002)(50226002)(486006)(8676002)(81166006)(66446008)(6506007)(102836004)(66066001)(71200400001)(6916009)(71190400001)(99286004)(3846002)(2616005)(446003)(4326008)(2501003)(6116002)(186003)(36756003)(14454004)(6512007)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3469;
 H:MN2PR12MB3536.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ElqUqHoQs74wTa4ynFzdQm7POXgV1/nJUu1Zcx6ZM1tEDM7oEFz784v9wxAtXrg9+AZM+39iiAUfWVUp3BzWAdp033NrjWjK+8xI1A7gAnV4fmHowgYTtriqYj/rWcQw/tCZb7E44o/oNJD/JXkkNlM8RxacQ90s5ZFvZIHvlDFN1gPhZxjUcSRZZNKpPhYu+Ky+UikpsfidKTLknkce6XOqepgR42s2hDZJu9NZoyWFXhhuqNbsQh1KFYknQYkTB33BwuZN7ohSIOl6LN5pb6sYHsSXBPn3Dg+GcIEzXVw9IcR+2xZgMK0pEfFrrzPp0KjKgJoj9RH//++lXeCuCi3RH3jmRSCvDNzaEK66vyeujiQTYOUrbcNVnawMwY8vbCdMRErFlziyFe08qioU/E9JjvHF1JDPhZHBy3fLKiI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e6c3bf9-93ec-419a-4de8-08d74234a01b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 03:50:09.0369 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QsK7bbHcjK1bue1an4PRmr0DPrdezadoAqmdIbYicvQzUb7OHOTvDmc1uPfNMSO7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3469
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STqpuy3kq6gFEUrA7oph70Pi0bll8QnXFjLA7CVf8Eo=;
 b=DxWeMtwGcNXWT4dPmFX9JAZHFkShs5BIlPERi79SFk0sRjobxyuCz/n908aA/oiGC/ipBY44CSlk02B5zFmzEC6DYFJ6lecKg1+rpLw8nhciWdrNd/evG9NCne7zdQMGXm1/UxGF/Dgy0o5nRjwIMK/M6awpABbFS5OpRdU9xv0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Prike.Liang@amd.com; 
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
Cc: "Liang, Prike" <Prike.Liang@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>, "keneth.feng@amd.com" <keneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIHdvcmtsb2FkIHR5cGUgd2FzIGdvdCBmcm9tIHRoZSBpbnB1dCBvZiBwb3dlciBwcm9maWxl
IG1vZGUuCgpTaWduZWQtb2ZmLWJ5OiBQcmlrZSBMaWFuZyA8UHJpa2UuTGlhbmdAYW1kLmNvbT4K
UmV2aWV3ZWQtYnk6IEtldmluIFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5
OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L3Jlbm9pcl9wcHQuYyB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L3Jlbm9pcl9wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L3Jlbm9pcl9wcHQuYwppbmRleCA4ZWMzNjYzLi5kYzk0NWI4IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvcmVub2lyX3BwdC5jCkBAIC0zNjUsNiArMzY1LDM0IEBA
IHN0YXRpYyBpbnQgcmVub2lyX3VuZm9yY2VfZHBtX2xldmVscyhzdHJ1Y3Qgc211X2NvbnRleHQg
KnNtdSkgewogCXJldHVybiByZXQ7CiB9CiAKK3N0YXRpYyBpbnQgcmVub2lyX2dldF93b3JrbG9h
ZF90eXBlKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCB1aW50MzJfdCBwcm9maWxlKQoreworCisJ
dWludDMyX3QgIHBwbGliX3dvcmtsb2FkID0gMDsKKworCXN3aXRjaCAocHJvZmlsZSkgeworCWNh
c2UgUFBfU01DX1BPV0VSX1BST0ZJTEVfRlVMTFNDUkVFTjNEOgorCQlwcGxpYl93b3JrbG9hZCA9
IFdPUktMT0FEX1BQTElCX0ZVTExfU0NSRUVOXzNEX0JJVDsKKwkJYnJlYWs7CisJY2FzZSBQUF9T
TUNfUE9XRVJfUFJPRklMRV9DVVNUT006CisJCXBwbGliX3dvcmtsb2FkID0gV09SS0xPQURfUFBM
SUJfQ09VTlQ7CisJCWJyZWFrOworCWNhc2UgUFBfU01DX1BPV0VSX1BST0ZJTEVfVklERU86CisJ
CXBwbGliX3dvcmtsb2FkID0gV09SS0xPQURfUFBMSUJfVklERU9fQklUOworCQlicmVhazsKKwlj
YXNlIFBQX1NNQ19QT1dFUl9QUk9GSUxFX1ZSOgorCQlwcGxpYl93b3JrbG9hZCA9IFdPUktMT0FE
X1BQTElCX1ZSX0JJVDsKKwkJYnJlYWs7CisJY2FzZSBQUF9TTUNfUE9XRVJfUFJPRklMRV9DT01Q
VVRFOgorCQlwcGxpYl93b3JrbG9hZCA9IFdPUktMT0FEX1BQTElCX0NPTVBVVEVfQklUOworCQli
cmVhazsKKwlkZWZhdWx0OgorCQlyZXR1cm4gLUVJTlZBTDsKKwl9CisKKwlyZXR1cm4gcHBsaWJf
d29ya2xvYWQ7Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHB0YWJsZV9mdW5jcyByZW5vaXJf
cHB0X2Z1bmNzID0gewogCS5nZXRfc211X21zZ19pbmRleCA9IHJlbm9pcl9nZXRfc211X21zZ19p
bmRleCwKIAkuZ2V0X3NtdV90YWJsZV9pbmRleCA9IHJlbm9pcl9nZXRfc211X3RhYmxlX2luZGV4
LApAQCAtMzc2LDYgKzQwNCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHB0YWJsZV9mdW5jcyBy
ZW5vaXJfcHB0X2Z1bmNzID0gewogCS5kcG1fc2V0X3V2ZF9lbmFibGUgPSByZW5vaXJfZHBtX3Nl
dF91dmRfZW5hYmxlLAogCS5mb3JjZV9kcG1fbGltaXRfdmFsdWUgPSByZW5vaXJfZm9yY2VfZHBt
X2xpbWl0X3ZhbHVlLAogCS51bmZvcmNlX2RwbV9sZXZlbHMgPSByZW5vaXJfdW5mb3JjZV9kcG1f
bGV2ZWxzLAorCS5nZXRfd29ya2xvYWRfdHlwZSA9IHJlbm9pcl9nZXRfd29ya2xvYWRfdHlwZSwK
IH07CiAKIHZvaWQgcmVub2lyX3NldF9wcHRfZnVuY3Moc3RydWN0IHNtdV9jb250ZXh0ICpzbXUp
Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
