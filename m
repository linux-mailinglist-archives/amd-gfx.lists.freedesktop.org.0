Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4606CA8E
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jul 2019 10:02:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 736536E32F;
	Thu, 18 Jul 2019 08:02:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680049.outbound.protection.outlook.com [40.107.68.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1B36E32F
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 08:02:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hiso/o8TNbZs0ETMRjFYqHM4fOs8M3VL25UlZUJh7ysYlrF0Qb2VQ8wXIPYIld/ueIzGd0VmVFlCVN296I10+RlfAGRbVtAppSUjCry0cOzEHOekGK+EqwNXnLU5SEJgtXZLx5hXo6CaoKmS7PnazMQOHfdpxCyUjXCP/0I2cbpcB7Fd+JSausTcdDdz+dHLDBYyE4hYRAVDUs7WKo51fc4MX6Ha9b5zvmyp9ul9QXYQ3+6qoAzRo2j8k0loQ7rEROMGaysUORol9wtejimktpACGRyGjMyiJhP8v5L8gMQelNKurk6qzVQwS5cdR1zqATHDc1AhUfe4kFS9iC4j8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7ePeUk6Bp7kfoPImyCcZScP6Mc2MMx9/rUWtWmhyrw=;
 b=T8r4/fJsfOIXhtzEGiAhyzx/SoDS92lpDdTgbpmBk4cfYQIQm0rsk3V5Hv64O3PT/ECvllddxdRQoMcqzGOYZMzsN4heINMQ6K6dzXIb97US6GuhCWgyd4phKcJq6+9sPiFI/g7/wTi7MIWLDXtS37/Jq/SnYl1TLa+0wi6hXcv7XyUcj9C57MzBcsqkqXCh3AG/ddWun5RQv7FKGQga8islZEGSWwUtIRL1Jf2yjI5fnz81ngm0+PsK/leJC+/EWMRn2dua8zI/1wIqNDWQX4OorVNL0ajlnPDW2W6E3iWhMkPXDPl1Wbw9EVJXIXvrog/fJQ8kBM34dGxk7vyETw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN8PR12MB3283.namprd12.prod.outlook.com (20.179.67.152) by
 BN8PR12MB3570.namprd12.prod.outlook.com (20.178.212.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.11; Thu, 18 Jul 2019 08:02:05 +0000
Received: from BN8PR12MB3283.namprd12.prod.outlook.com
 ([fe80::3892:6912:f663:6236]) by BN8PR12MB3283.namprd12.prod.outlook.com
 ([fe80::3892:6912:f663:6236%7]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 08:02:05 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: change sysfs pp_dpm_xxx format for navi10
Thread-Topic: [PATCH] drm/amd/powerplay: change sysfs pp_dpm_xxx format for
 navi10
Thread-Index: AQHVPT8WKhf+ENuPuUabqlRp0Ta+Yg==
Date: Thu, 18 Jul 2019 08:02:05 +0000
Message-ID: <20190718080142.26040-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR04CA0057.apcprd04.prod.outlook.com
 (2603:1096:202:14::25) To BN8PR12MB3283.namprd12.prod.outlook.com
 (2603:10b6:408:6e::24)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.0
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 91277ccf-346b-4398-ec27-08d70b563940
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3570; 
x-ms-traffictypediagnostic: BN8PR12MB3570:
x-microsoft-antispam-prvs: <BN8PR12MB3570740D9E5480ECAE8B72C5A2C80@BN8PR12MB3570.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:262;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(199004)(189003)(14454004)(54906003)(66066001)(53936002)(26005)(186003)(64756008)(66556008)(66446008)(7736002)(6116002)(50226002)(25786009)(99286004)(81156014)(52116002)(5660300002)(2501003)(102836004)(3846002)(36756003)(68736007)(305945005)(81166006)(8936002)(8676002)(1076003)(478600001)(71200400001)(71190400001)(486006)(4326008)(386003)(316002)(6506007)(476003)(2616005)(6486002)(86362001)(256004)(6436002)(66946007)(2351001)(2906002)(6916009)(5640700003)(6512007)(66476007)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3570;
 H:BN8PR12MB3283.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KVDWwwwVmG3vOPiM/OQGXepQrlSW5VqH3a1wFrVneqq/Z7qNsB55R8Ov7DsbvB32EYzgoCSW+zhJ1JSNuRQ6fLdgdmbv8bwMM3O8BMh0/kBxdqwc8Wpo+S+Z9hX3QjloA0DRBAesq8YWaj4EJxjaGuQHJue4JzCi1ccrqz8eET7jLutvZrUNOp3rPawly/ndRO9L+sF+37jFcUyuUhNvMrSxYqikWhfPJH6ivBYYDnim2C96AtH/31ER8k/YiIFI8Y9y+/RotFDr3V6EZiVuroLsWthJzUQqENcim79OQS34kkg1wQb7FJ4BzyvSBleXTlOHx0h1J56PSh4sYMBH6VvhAGysXgeswJcU6MxbYjS+G4/RzsU+bA/YYvD/KAKEfQGnW8aPSvpwYjAxLN94xPUjEcroT4Ywo5AfHaEh7d8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91277ccf-346b-4398-ec27-08d70b563940
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 08:02:05.6960 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3570
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7ePeUk6Bp7kfoPImyCcZScP6Mc2MMx9/rUWtWmhyrw=;
 b=O/0jLAkKfPubxslKlpTwkN/AfzKDBEv22ZQWl9VCm4VFk0qV3lIzqPiGK8zZZCxSWd0RJcRiN+l1xZVXx2zrw9tRYHbt74LBunnOd4ZTwEqVJ+DN2ZphvZ5t3vwNUKnqy7C8GZrnYFAiQZwTNRbAOZscH4P9PMbWZhzYAG87ph4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>, "Feng,
 Kenneth" <Kenneth.Feng@amd.com>, "Wang, 
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>, "Xu, Feifei" <Feifei.Xu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

dGhlIG5hdmkxMCBnZnhjbGsgKHNjbGspIHN1cHBvcnQgZmluZSBncmFpbmVkIERQTSwKc28gdXNl
IGxldmVsIDEgdG8gc2hvdyBjdXJyZW50IGRwbSBmcmVxIGluIHN5c2ZzIHBwX2RwbV94eHgKCkNo
YW5nZS1JZDogSWRhZTI0MjRmOGNjOTFmZTk0Y2ViZTdmMzEwM2UxMTJiNGY5MTJmYmMKU2lnbmVk
LW9mZi1ieTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgfCA0MSArKysrKysrKysrKysrKysrKy0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKaW5kZXggODk1YTRlNTky
ZDVhLi5lZjYwYjkyZmVmNmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L25hdmkxMF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZp
MTBfcHB0LmMKQEAgLTYzMiw2ICs2MzIsMTAgQEAgc3RhdGljIGludCBuYXZpMTBfcHJpbnRfY2xr
X2xldmVscyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIHsKIAlpbnQgaSwgc2l6ZSA9IDAsIHJl
dCA9IDA7CiAJdWludDMyX3QgY3VyX3ZhbHVlID0gMCwgdmFsdWUgPSAwLCBjb3VudCA9IDA7CisJ
dWludDMyX3QgZnJlcV92YWx1ZXNbM10gPSB7MH07CisJdWludDMyX3QgY2xrX2luZGV4ID0gMCwg
bWFya19pbmRleCA9IDA7CisJUFBUYWJsZV90ICpwcHRhYmxlID0gc211LT5zbXVfdGFibGUuZHJp
dmVyX3BwdGFibGU7CisJRHBtRGVzY3JpcHRvcl90ICpkcG1fZGVzYyA9IE5VTEw7CiAKIAlzd2l0
Y2ggKGNsa190eXBlKSB7CiAJY2FzZSBTTVVfR0ZYQ0xLOgpAQCAtNjQxLDI1ICs2NDUsNDYgQEAg
c3RhdGljIGludCBuYXZpMTBfcHJpbnRfY2xrX2xldmVscyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNt
dSwKIAljYXNlIFNNVV9VQ0xLOgogCWNhc2UgU01VX0ZDTEs6CiAJY2FzZSBTTVVfRENFRkNMSzoK
KwkJY2xrX2luZGV4ID0gc211X2Nsa19nZXRfaW5kZXgoc211LCBjbGtfdHlwZSk7CisJCWRwbV9k
ZXNjID0gJnBwdGFibGUtPkRwbURlc2NyaXB0b3JbY2xrX2luZGV4XTsKKwogCQlyZXQgPSBzbXVf
Z2V0X2N1cnJlbnRfY2xrX2ZyZXEoc211LCBjbGtfdHlwZSwgJmN1cl92YWx1ZSk7CiAJCWlmIChy
ZXQpCiAJCQlyZXR1cm4gc2l6ZTsKLQkJLyogMTBLSHogLT4gTUh6ICovCi0JCWN1cl92YWx1ZSA9
IGN1cl92YWx1ZSAvIDEwMDsKLQotCQlzaXplICs9IHNwcmludGYoYnVmLCAiY3VycmVudCBjbGs6
ICV1TWh6XG4iLCBjdXJfdmFsdWUpOwogCiAJCXJldCA9IHNtdV9nZXRfZHBtX2xldmVsX2NvdW50
KHNtdSwgY2xrX3R5cGUsICZjb3VudCk7CiAJCWlmIChyZXQpCiAJCQlyZXR1cm4gc2l6ZTsKIAot
CQlmb3IgKGkgPSAwOyBpIDwgY291bnQ7IGkrKykgewotCQkJcmV0ID0gc211X2dldF9kcG1fZnJl
cV9ieV9pbmRleChzbXUsIGNsa190eXBlLCBpLCAmdmFsdWUpOworCQkvKiAwIC0gRmluZSBncmFp
bmVkIERQTSwgMSAtIERpc2NyZXRlIERQTSAqLworCQlpZiAoZHBtX2Rlc2MtPlNuYXBUb0Rpc2Ny
ZXRlID09IDEpIHsKKwkJCS8qIDEwS0h6IC0+IE1IeiAqLworCQkJY3VyX3ZhbHVlID0gY3VyX3Zh
bHVlIC8gMTAwOworCQkJZm9yIChpID0gMDsgaSA8IGNvdW50OyBpKyspIHsKKwkJCQlyZXQgPSBz
bXVfZ2V0X2RwbV9mcmVxX2J5X2luZGV4KHNtdSwgY2xrX3R5cGUsIGksICZ2YWx1ZSk7CisJCQkJ
aWYgKHJldCkKKwkJCQkJcmV0dXJuIHNpemU7CisKKwkJCQlzaXplICs9IHNwcmludGYoYnVmICsg
c2l6ZSwgIiVkOiAldU1oeiAlc1xuIiwgaSwgdmFsdWUsCisJCQkJCQljdXJfdmFsdWUgPT0gdmFs
dWUgPyAiKiIgOiAiIik7CisJCQl9CisJCX0gZWxzZSB7CisJCQlyZXQgPSBzbXVfZ2V0X2RwbV9m
cmVxX2J5X2luZGV4KHNtdSwgY2xrX3R5cGUsIDAsICZmcmVxX3ZhbHVlc1swXSk7CisJCQlpZiAo
cmV0KQorCQkJCXJldHVybiBzaXplOworCQkJcmV0ID0gc211X2dldF9kcG1fZnJlcV9ieV9pbmRl
eChzbXUsIGNsa190eXBlLCBjb3VudCAtIDEsICZmcmVxX3ZhbHVlc1syXSk7CiAJCQlpZiAocmV0
KQogCQkJCXJldHVybiBzaXplOwogCi0JCQlzaXplICs9IHNwcmludGYoYnVmICsgc2l6ZSwgIiVk
OiAldU1oeiAlc1xuIiwgaSwgdmFsdWUsCi0JCQkJCWN1cl92YWx1ZSA9PSB2YWx1ZSA/ICIqIiA6
ICIiKTsKKwkJCWZyZXFfdmFsdWVzWzFdID0gY3VyX3ZhbHVlIC8gMTAwOworCQkJbWFya19pbmRl
eCA9IGN1cl92YWx1ZSA9PSBmcmVxX3ZhbHVlc1swXSA/IDAgOgorCQkJCSAgICAgY3VyX3ZhbHVl
ID09IGZyZXFfdmFsdWVzWzJdID8gMiA6IDE7CisKKwkJCWZvciAoaSA9IDA7IGkgPCAzOyBpKysp
IHsKKwkJCQlzaXplICs9IHNwcmludGYoYnVmICsgc2l6ZSwgIiVkOiAldU1oeiAlc1xuIiwgaSwg
ZnJlcV92YWx1ZXNbaV0sCisJCQkJCQlpID09IG1hcmtfaW5kZXggPyAiKiIgOiAiIik7CisJCQl9
CisKIAkJfQogCQlicmVhazsKIAlkZWZhdWx0OgotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
