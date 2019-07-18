Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC1C6CAD1
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jul 2019 10:20:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A470E6E34B;
	Thu, 18 Jul 2019 08:20:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740048.outbound.protection.outlook.com [40.107.74.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51376E34B
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 08:20:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fWhRUn1JLEUBLQHg4efoPSTMW+EFCttIiehZwd0c1mrAQl0E9WK4aA5PXKW4Nv9B4MvMdwDXDWuVPFqEVuWqT+0YYtMlxu12K86YspBosEWQAKDQ38iSOMvKASvb+Ysx6qqouT4c/KW+yQb08miS82EpkUl+sd78D2NFcbKI8omlDcUrw28dRXEj2waSZzO1U2FbpO/wVOA0c2z3HLiQMJQXgIqKmuhlxISvh3UPvLXGjthl9lJDx7VYG8cBIFlAvtZRXaOr6gzuFy/DPzgjtM+WPnA6qYrQq+3q8Y2dTfiQgB2BmwUl4F3pBIedbK4HUm7od40IP1GRyDTmqnveZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJRBUgMZsjgqx8SG7Ug4x682A9wiEh5L+7lPXksZSg4=;
 b=Mzr8vk3R3kNGluuK30fIy3VlWhNuklusePNRtX41pz3XJP57I/r8CCEg4g7nfO14QHHCDPk9miSZn4AG0ioRYICD7MbBjgA125AVHW5Ug+rBfnTdSdKh2qFrNX8D7EaRk1HJ8E013i42ta+/RsFlOPpfCOrjSGzysekBwmoFquSOkpWejBe2teaOxrOwDJyReDD7AyQ5KsQYi7boLpHEpOmexAZhVmOD9oOivVhu5HQ6c3ygCl9vKgXzqDiyDPkg/UkM0ZG3cjtsWnCdnzsq7LDrHIQD5LB2cc+T0tF9EhfcWW+KudG5zJfqHkb2OzcY059bmtUZWb+G7EryPavcog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3598.namprd12.prod.outlook.com (20.178.244.84) by
 MN2PR12MB4158.namprd12.prod.outlook.com (10.255.224.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 08:20:14 +0000
Received: from MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::40cc:2c68:41f3:c5b5]) by MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::40cc:2c68:41f3:c5b5%7]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 08:20:14 +0000
From: "Feng, Kenneth" <Kenneth.Feng@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: change sysfs pp_dpm_xxx format for
 navi10
Thread-Topic: [PATCH] drm/amd/powerplay: change sysfs pp_dpm_xxx format for
 navi10
Thread-Index: AQHVPT8WKhf+ENuPuUabqlRp0Ta+YqbQBbxA
Date: Thu, 18 Jul 2019 08:20:14 +0000
Message-ID: <MN2PR12MB35981386A5F5653CDDC0E9F68EC80@MN2PR12MB3598.namprd12.prod.outlook.com>
References: <20190718080142.26040-1-kevin1.wang@amd.com>
In-Reply-To: <20190718080142.26040-1-kevin1.wang@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df216499-4f92-4a48-617d-08d70b58c2a9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4158; 
x-ms-traffictypediagnostic: MN2PR12MB4158:
x-microsoft-antispam-prvs: <MN2PR12MB415863CC42D18174A4D6C4F48EC80@MN2PR12MB4158.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:262;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(396003)(39850400004)(366004)(199004)(189003)(13464003)(7736002)(2501003)(66446008)(229853002)(4326008)(53936002)(256004)(316002)(71190400001)(305945005)(33656002)(9686003)(52536014)(55016002)(110136005)(99286004)(66476007)(66556008)(64756008)(486006)(5660300002)(66946007)(8936002)(26005)(7696005)(66066001)(68736007)(6246003)(86362001)(81156014)(14454004)(3846002)(6116002)(6436002)(478600001)(25786009)(81166006)(71200400001)(2906002)(446003)(76176011)(54906003)(6506007)(102836004)(186003)(53546011)(74316002)(476003)(8676002)(11346002)(76116006)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4158;
 H:MN2PR12MB3598.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: edc247IORkmIXhI4DRcBV1HN87bBN4GgOdoioXDPq59GBk9h2eA8X7DCJJdF2IgR+oGfF8GKMQTCXM6BX3nKK68OLGol6PtvXAyHNQdnhhB4MGXIF5fuf9vYaQmF1FQMhbE3j1nbn4mDfNMUkeoEBR0+IUEBxbAPorWqp1WnjmPaoV7aOSoJ77lJ466lQ0EILFVeedheugrcuowHtSU826bGFpgjXoLYDZsW8pFVN225XGpciN7EwXPAk27SclRGyGf7Vh1wa0o4V/+5KXCvRCYA6dedHzSUVDwCjPmD+jED59+VzaTSQSjUiuCGads/FrTrKwa/bgDgB7SFU0XO+Mgd/J432IMmyhj1GEMnD89TDqoGfRPqkf8ddzehFjxQFQVAMZlGbJv8+zoHrdOEycUYbtgdt/d8Wccb7XkFEAE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df216499-4f92-4a48-617d-08d70b58c2a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 08:20:14.6093 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qyfeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4158
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJRBUgMZsjgqx8SG7Ug4x682A9wiEh5L+7lPXksZSg4=;
 b=kVyjqjrF4KIIqaeZ64NplNNd8z+0KBeRJHCvG/SYU/L/zZRfzhRQ+lGoXMOVlb+tW8J4+/OTMEq7u0whXc6Q5PDBbo0XoZasXFfe+ANTnjCk78Rr8T8j5p7/M0EWmRqamv9TLPARuHIZIKBRXeZAciVDLr6DxFCaZNVCmDdRjd8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kenneth.Feng@amd.com; 
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
Cc: "Xu, Feifei" <Feifei.Xu@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>, "Huang,
 Ray" <Ray.Huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEtlbm5ldGggRmVuZyA8a2VubmV0aC5mZW5nQGFtZC5jb20+CgoKLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0KRnJvbTogV2FuZywgS2V2aW4oWWFuZykgClNlbnQ6IFRodXJz
ZGF5LCBKdWx5IDE4LCAyMDE5IDQ6MDIgUE0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCkNjOiBGZW5nLCBLZW5uZXRoIDxLZW5uZXRoLkZlbmdAYW1kLmNvbT47IFF1YW4sIEV2YW4g
PEV2YW4uUXVhbkBhbWQuY29tPjsgSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBYdSwg
RmVpZmVpIDxGZWlmZWkuWHVAYW1kLmNvbT47IFdhbmcsIEtldmluKFlhbmcpIDxLZXZpbjEuV2Fu
Z0BhbWQuY29tPgpTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWQvcG93ZXJwbGF5OiBjaGFuZ2Ugc3lz
ZnMgcHBfZHBtX3h4eCBmb3JtYXQgZm9yIG5hdmkxMAoKdGhlIG5hdmkxMCBnZnhjbGsgKHNjbGsp
IHN1cHBvcnQgZmluZSBncmFpbmVkIERQTSwgc28gdXNlIGxldmVsIDEgdG8gc2hvdyBjdXJyZW50
IGRwbSBmcmVxIGluIHN5c2ZzIHBwX2RwbV94eHgKCkNoYW5nZS1JZDogSWRhZTI0MjRmOGNjOTFm
ZTk0Y2ViZTdmMzEwM2UxMTJiNGY5MTJmYmMKU2lnbmVkLW9mZi1ieTogS2V2aW4gV2FuZyA8a2V2
aW4xLndhbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZp
MTBfcHB0LmMgfCA0MSArKysrKysrKysrKysrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMzMg
aW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9uYXZpMTBfcHB0LmMKaW5kZXggODk1YTRlNTkyZDVhLi5lZjYwYjkyZmVmNmMgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKQEAgLTYzMiw2ICs2MzIs
MTAgQEAgc3RhdGljIGludCBuYXZpMTBfcHJpbnRfY2xrX2xldmVscyhzdHJ1Y3Qgc211X2NvbnRl
eHQgKnNtdSwgIHsKIAlpbnQgaSwgc2l6ZSA9IDAsIHJldCA9IDA7CiAJdWludDMyX3QgY3VyX3Zh
bHVlID0gMCwgdmFsdWUgPSAwLCBjb3VudCA9IDA7CisJdWludDMyX3QgZnJlcV92YWx1ZXNbM10g
PSB7MH07CisJdWludDMyX3QgY2xrX2luZGV4ID0gMCwgbWFya19pbmRleCA9IDA7CisJUFBUYWJs
ZV90ICpwcHRhYmxlID0gc211LT5zbXVfdGFibGUuZHJpdmVyX3BwdGFibGU7CisJRHBtRGVzY3Jp
cHRvcl90ICpkcG1fZGVzYyA9IE5VTEw7CiAKIAlzd2l0Y2ggKGNsa190eXBlKSB7CiAJY2FzZSBT
TVVfR0ZYQ0xLOgpAQCAtNjQxLDI1ICs2NDUsNDYgQEAgc3RhdGljIGludCBuYXZpMTBfcHJpbnRf
Y2xrX2xldmVscyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIAljYXNlIFNNVV9VQ0xLOgogCWNh
c2UgU01VX0ZDTEs6CiAJY2FzZSBTTVVfRENFRkNMSzoKKwkJY2xrX2luZGV4ID0gc211X2Nsa19n
ZXRfaW5kZXgoc211LCBjbGtfdHlwZSk7CisJCWRwbV9kZXNjID0gJnBwdGFibGUtPkRwbURlc2Ny
aXB0b3JbY2xrX2luZGV4XTsKKwogCQlyZXQgPSBzbXVfZ2V0X2N1cnJlbnRfY2xrX2ZyZXEoc211
LCBjbGtfdHlwZSwgJmN1cl92YWx1ZSk7CiAJCWlmIChyZXQpCiAJCQlyZXR1cm4gc2l6ZTsKLQkJ
LyogMTBLSHogLT4gTUh6ICovCi0JCWN1cl92YWx1ZSA9IGN1cl92YWx1ZSAvIDEwMDsKLQotCQlz
aXplICs9IHNwcmludGYoYnVmLCAiY3VycmVudCBjbGs6ICV1TWh6XG4iLCBjdXJfdmFsdWUpOwog
CiAJCXJldCA9IHNtdV9nZXRfZHBtX2xldmVsX2NvdW50KHNtdSwgY2xrX3R5cGUsICZjb3VudCk7
CiAJCWlmIChyZXQpCiAJCQlyZXR1cm4gc2l6ZTsKIAotCQlmb3IgKGkgPSAwOyBpIDwgY291bnQ7
IGkrKykgewotCQkJcmV0ID0gc211X2dldF9kcG1fZnJlcV9ieV9pbmRleChzbXUsIGNsa190eXBl
LCBpLCAmdmFsdWUpOworCQkvKiAwIC0gRmluZSBncmFpbmVkIERQTSwgMSAtIERpc2NyZXRlIERQ
TSAqLworCQlpZiAoZHBtX2Rlc2MtPlNuYXBUb0Rpc2NyZXRlID09IDEpIHsKKwkJCS8qIDEwS0h6
IC0+IE1IeiAqLworCQkJY3VyX3ZhbHVlID0gY3VyX3ZhbHVlIC8gMTAwOworCQkJZm9yIChpID0g
MDsgaSA8IGNvdW50OyBpKyspIHsKKwkJCQlyZXQgPSBzbXVfZ2V0X2RwbV9mcmVxX2J5X2luZGV4
KHNtdSwgY2xrX3R5cGUsIGksICZ2YWx1ZSk7CisJCQkJaWYgKHJldCkKKwkJCQkJcmV0dXJuIHNp
emU7CisKKwkJCQlzaXplICs9IHNwcmludGYoYnVmICsgc2l6ZSwgIiVkOiAldU1oeiAlc1xuIiwg
aSwgdmFsdWUsCisJCQkJCQljdXJfdmFsdWUgPT0gdmFsdWUgPyAiKiIgOiAiIik7CisJCQl9CisJ
CX0gZWxzZSB7CisJCQlyZXQgPSBzbXVfZ2V0X2RwbV9mcmVxX2J5X2luZGV4KHNtdSwgY2xrX3R5
cGUsIDAsICZmcmVxX3ZhbHVlc1swXSk7CisJCQlpZiAocmV0KQorCQkJCXJldHVybiBzaXplOwor
CQkJcmV0ID0gc211X2dldF9kcG1fZnJlcV9ieV9pbmRleChzbXUsIGNsa190eXBlLCBjb3VudCAt
IDEsIAorJmZyZXFfdmFsdWVzWzJdKTsKIAkJCWlmIChyZXQpCiAJCQkJcmV0dXJuIHNpemU7CiAK
LQkJCXNpemUgKz0gc3ByaW50ZihidWYgKyBzaXplLCAiJWQ6ICV1TWh6ICVzXG4iLCBpLCB2YWx1
ZSwKLQkJCQkJY3VyX3ZhbHVlID09IHZhbHVlID8gIioiIDogIiIpOworCQkJZnJlcV92YWx1ZXNb
MV0gPSBjdXJfdmFsdWUgLyAxMDA7CisJCQltYXJrX2luZGV4ID0gY3VyX3ZhbHVlID09IGZyZXFf
dmFsdWVzWzBdID8gMCA6CisJCQkJICAgICBjdXJfdmFsdWUgPT0gZnJlcV92YWx1ZXNbMl0gPyAy
IDogMTsKKworCQkJZm9yIChpID0gMDsgaSA8IDM7IGkrKykgeworCQkJCXNpemUgKz0gc3ByaW50
ZihidWYgKyBzaXplLCAiJWQ6ICV1TWh6ICVzXG4iLCBpLCBmcmVxX3ZhbHVlc1tpXSwKKwkJCQkJ
CWkgPT0gbWFya19pbmRleCA/ICIqIiA6ICIiKTsKKwkJCX0KKwogCQl9CiAJCWJyZWFrOwogCWRl
ZmF1bHQ6Ci0tCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
