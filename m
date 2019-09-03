Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED400A5E54
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 02:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 702A989948;
	Tue,  3 Sep 2019 00:02:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800058.outbound.protection.outlook.com [40.107.80.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 656A789935
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Sep 2019 00:01:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZllsYX9U6mtnnfaX52gtGVwZ1ZMQNPkCF2eyp7dD+S0DmOuIIL7jFyhh2vXxhob2k31rvN9d/IiwvEc0dQNrrMcSvIpRonUMK7pnp83VekZXQ15HgFOGLaqfaH2MdTmXlQUpQyjV0rhkZD4+Kkg4lm5y9+UH8LpHFBiUHq2TQDdtPlPqWX+ad126wgwEBkUH5IUheCavkg+tnvC1eoBPDxWU1f72L9ludcqxNSbl0s1t14FzKD7+ZwNGqcqlpsXPZ2JXzoXPLcw54ESUpuzqh1j4gY+Mgy4ebMrRndOlt+Bqmo9cXjLw1u3KRTl1W2Wm8/Ln+MjRbVv2gLJirNuQtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWAsaLfEwoyEEiS3oYZGM4XxTP0D2CLoEaCEzLf6thk=;
 b=E83sXAS1g2akOdU756S4vDCdQAvVaQSmzLV5kxY2QWrglUZdfDclRiFxgoj1mhlfHhEXm8TcoVySzhi2flGKbWNU4tebrEUsvynNnRI2xKhjIX2n/dlZjkzLn0caYuvJc3Ayvqms5N7GW5S2zcKJqAZZ/2seg981E9sZC97deaVT1jL6vbqw4YpoMP5IyCl4SUMa+RRF+iy+Bo9s7D6FXttxEYvgNM0mhQ1gfY/2tgXo3vq+I9+Cx9pI1cv9NDXkyPAQp2J/kIwxvHKRfNUIbqDB+2DzQjlkhHNBcB/NiYH6hEXyNPjIl3cZpu9rwK/m1br78ga6YEUrHoVejof73g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1818.namprd12.prod.outlook.com (10.175.92.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Tue, 3 Sep 2019 00:01:57 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d%7]) with mapi id 15.20.2220.021; Tue, 3 Sep 2019
 00:01:57 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhou1,
 Tao" <Tao.Zhou1@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH 03/10] drm/amdgpu/gfx: switch to amdgpu_gfx_ras_late_init
 helper function
Thread-Topic: [PATCH 03/10] drm/amdgpu/gfx: switch to amdgpu_gfx_ras_late_init
 helper function
Thread-Index: AQHVYerNKk5TSMiwpEKJjSWPjJDnFg==
Date: Tue, 3 Sep 2019 00:01:57 +0000
Message-ID: <1567468894-11852-3-git-send-email-Hawking.Zhang@amd.com>
References: <1567468894-11852-1-git-send-email-Hawking.Zhang@amd.com>
In-Reply-To: <1567468894-11852-1-git-send-email-Hawking.Zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0022.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::34) To DM5PR12MB1418.namprd12.prod.outlook.com
 (2603:10b6:3:7a::15)
x-originating-ip: [180.167.199.189]
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab13259c-14bc-4aee-4b39-08d73001efe0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1818; 
x-ms-traffictypediagnostic: DM5PR12MB1818:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB18184C72A2AA6A1354BB3317FCB90@DM5PR12MB1818.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:217;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(199004)(189003)(99286004)(66446008)(36756003)(2501003)(478600001)(316002)(256004)(66946007)(5660300002)(66476007)(53936002)(81166006)(26005)(8676002)(71200400001)(102836004)(81156014)(71190400001)(6486002)(66556008)(50226002)(186003)(8936002)(66066001)(25786009)(3846002)(6116002)(76176011)(6512007)(6506007)(386003)(4326008)(86362001)(486006)(446003)(2616005)(305945005)(52116002)(7736002)(11346002)(476003)(110136005)(2906002)(14454004)(6636002)(64756008)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1818;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0ixNr2g2SSZt/mK6nsXHuR1KcFp40pZHen9ULs1Wt7HzHGOeqSJEOpYZa10KBKpRn174ftdHKkw4LOUgRY4XN4G2dWXT/OCv4TGbdlNUQVly+7I4UEGzukVB/j19wETzf10omkC5GUbl05BYn6nBmTmaRDIAnagG2rLt49YWFh9l7gkUXaxa6nP+Uv9171wNxQTYRhVslfrveDdyG6b5xKlMIP5PMpVY37lNhI5JeE54dVdRuPHT6LLvvxgQkL++vXv/L6v6ZmYk/QS+ND/7DUlIuwzkdcMrO8qF6KuWv0fjw48ibu/cglkzBSQNna/D9RGynWkfzwYJkZ0ku5/kCnYxmoQa/bOudoKAsxLhSxEhtb0eXi7qyQzYsIr7H1+R45DBoCX0f2zAHSSR0ZLsjEk45zhMQTCwPzVAsO+awsE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab13259c-14bc-4aee-4b39-08d73001efe0
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 00:01:57.6707 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FNWq6wIud6ZbgW/mHEv9At05DfSm57DlMjj6PfJ7tkV9ovveqKFhInBrxonbq3Iu5D8h/YxlY9VY92jAab8AvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1818
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWAsaLfEwoyEEiS3oYZGM4XxTP0D2CLoEaCEzLf6thk=;
 b=aouOabsFrV7xFdeNSz2BVFK65liBPzB2bunrHM31STPxiqIUMzKhO71zN/ZvK+kZoY84jr/ChMS/5YtO78+zyVwbVtuxBcLKmu87FN7yPn330Pw9vmGaKOPGskTBCQRWp6O9RXW8ZHMQmw5x42/DKDYvdY2BW4M10oU626HRdaU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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
Cc: "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

YW1kZ3B1X2dmeF9yYXNfbGF0ZV9pbml0IGlzIHVzZWQgdG8gaW5pdCBnZnggc3BlY2ZpYwpyYXMg
ZGVidWdmcy9zeXNmcyBub2RlIGFuZCBnZnggc3BlY2lmaWMgaW50ZXJydXB0IGhhbmRsZXIuCkl0
IGNhbiBiZSBzaGFyZWQgYW1vbmcgZ2Z4IGdlbmVyYXRpb25zCgpTaWduZWQtb2ZmLWJ5OiBIYXdr
aW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2dmeC5jIHwgNDkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmggfCAgMyArLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyAgIHwgMzcgKystLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCspLCAzNSBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmMKaW5kZXggZTFmZGNi
NC4uNTA4ZDUyMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2dmeC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguYwpAQCAt
MjYsNiArMjYsNyBAQAogI2luY2x1ZGUgImFtZGdwdS5oIgogI2luY2x1ZGUgImFtZGdwdV9nZngu
aCIKICNpbmNsdWRlICJhbWRncHVfcmxjLmgiCisjaW5jbHVkZSAiYW1kZ3B1X3Jhcy5oIgogCiAv
KiBkZWxheSAwLjEgc2Vjb25kIHRvIGVuYWJsZSBnZnggb2ZmIGZlYXR1cmUgKi8KICNkZWZpbmUg
R0ZYX09GRl9ERUxBWV9FTkFCTEUgICAgICAgICBtc2Vjc190b19qaWZmaWVzKDEwMCkKQEAgLTU2
OSwzICs1NzAsNTEgQEAgdm9pZCBhbWRncHVfZ2Z4X29mZl9jdHJsKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LCBib29sIGVuYWJsZSkKIAogCW11dGV4X3VubG9jaygmYWRldi0+Z2Z4LmdmeF9v
ZmZfbXV0ZXgpOwogfQorCitpbnQgYW1kZ3B1X2dmeF9yYXNfbGF0ZV9pbml0KHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LAorCQkJICAgICB2b2lkICpyYXNfaWhfaW5mbykKK3sKKwlpbnQgcjsK
KwlzdHJ1Y3QgcmFzX2loX2lmICppaF9pbmZvID0gKHN0cnVjdCByYXNfaWhfaWYgKilyYXNfaWhf
aW5mbzsKKwlzdHJ1Y3QgcmFzX2ZzX2lmIGZzX2luZm8gPSB7CisJCS5zeXNmc19uYW1lID0gImdm
eF9lcnJfY291bnQiLAorCQkuZGVidWdmc19uYW1lID0gImdmeF9lcnJfaW5qZWN0IiwKKwl9Owor
CisJaWYgKCFpaF9pbmZvKQorCQlyZXR1cm4gLUVJTlZBTDsKKworCWlmICghYWRldi0+Z2Z4LnJh
c19pZikgeworCQlhZGV2LT5nZngucmFzX2lmID0ga21hbGxvYyhzaXplb2Yoc3RydWN0IHJhc19j
b21tb25faWYpLCBHRlBfS0VSTkVMKTsKKwkJaWYgKCFhZGV2LT5nZngucmFzX2lmKQorCQkJcmV0
dXJuIC1FTk9NRU07CisJCWFkZXYtPmdmeC5yYXNfaWYtPmJsb2NrID0gQU1ER1BVX1JBU19CTE9D
S19fR0ZYOworCQlhZGV2LT5nZngucmFzX2lmLT50eXBlID0gQU1ER1BVX1JBU19FUlJPUl9fTVVM
VElfVU5DT1JSRUNUQUJMRTsKKwkJYWRldi0+Z2Z4LnJhc19pZi0+c3ViX2Jsb2NrX2luZGV4ID0g
MDsKKwkJc3RyY3B5KGFkZXYtPmdmeC5yYXNfaWYtPm5hbWUsICJnZngiKTsKKwl9CisJZnNfaW5m
by5oZWFkID0gaWhfaW5mby0+aGVhZCA9ICphZGV2LT5nZngucmFzX2lmOworCisJciA9IGFtZGdw
dV9yYXNfbGF0ZV9pbml0KGFkZXYsIGFkZXYtPmdmeC5yYXNfaWYsCisJCQkJICZmc19pbmZvLCBp
aF9pbmZvKTsKKwlpZiAocikKKwkJZ290byBmcmVlOworCisJaWYgKGFtZGdwdV9yYXNfaXNfc3Vw
cG9ydGVkKGFkZXYsIGFkZXYtPmdmeC5yYXNfaWYtPmJsb2NrKSkgeworCQlyID0gYW1kZ3B1X2ly
cV9nZXQoYWRldiwgJmFkZXYtPmdmeC5jcF9lY2NfZXJyb3JfaXJxLCAwKTsKKwkJaWYgKHIpCisJ
CQlnb3RvIGxhdGVfZmluaTsKKwl9IGVsc2UgeworCQkvKiBmcmVlIGdmeCByYXNfaWYgaWYgcmFz
IGlzIG5vdCBzdXBwb3J0ZWQgKi8KKwkJciA9IDA7CisJCWdvdG8gZnJlZTsKKwl9CisKKwlyZXR1
cm4gMDsKK2xhdGVfZmluaToKKwlhbWRncHVfcmFzX2xhdGVfZmluaShhZGV2LCBhZGV2LT5nZngu
cmFzX2lmLCBpaF9pbmZvKTsKK2ZyZWU6CisJa2ZyZWUoYWRldi0+Z2Z4LnJhc19pZik7CisJYWRl
di0+Z2Z4LnJhc19pZiA9IE5VTEw7CisJcmV0dXJuIHI7Cit9CmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZ2Z4LmgKaW5kZXggNTU0YTU5Yi4uNmVkMDU2MCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5oCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguaApAQCAtMzgzLDUgKzM4Myw2IEBAIHZvaWQgYW1kZ3B1
X2dmeF9iaXRfdG9fbWVfcXVldWUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGludCBiaXQs
CiBib29sIGFtZGdwdV9nZnhfaXNfbWVfcXVldWVfZW5hYmxlZChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwgaW50IG1lLAogCQkJCSAgICBpbnQgcGlwZSwgaW50IHF1ZXVlKTsKIHZvaWQgYW1k
Z3B1X2dmeF9vZmZfY3RybChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgYm9vbCBlbmFibGUp
OwotCitpbnQgYW1kZ3B1X2dmeF9yYXNfbGF0ZV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LAorCQkJICAgICB2b2lkICpyYXNfaWhfaW5mbyk7CiAjZW5kaWYKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nZnhfdjlfMC5jCmluZGV4IGM5MDI4ODUuLmE0ODBjNGQgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwpAQCAtNDM5NiwyMiArNDM5NiwxMSBAQCBzdGF0aWMgaW50
IGdmeF92OV8wX2VjY19sYXRlX2luaXQodm9pZCAqaGFuZGxlKQogCXN0cnVjdCByYXNfaWhfaWYg
aWhfaW5mbyA9IHsKIAkJLmNiID0gZ2Z4X3Y5XzBfcHJvY2Vzc19yYXNfZGF0YV9jYiwKIAl9Owot
CXN0cnVjdCByYXNfZnNfaWYgZnNfaW5mbyA9IHsKLQkJLnN5c2ZzX25hbWUgPSAiZ2Z4X2Vycl9j
b3VudCIsCi0JCS5kZWJ1Z2ZzX25hbWUgPSAiZ2Z4X2Vycl9pbmplY3QiLAotCX07CiAJaW50IHI7
CiAKLQlpZiAoIWFkZXYtPmdmeC5yYXNfaWYpIHsKLQkJYWRldi0+Z2Z4LnJhc19pZiA9IGttYWxs
b2Moc2l6ZW9mKHN0cnVjdCByYXNfY29tbW9uX2lmKSwgR0ZQX0tFUk5FTCk7Ci0JCWlmICghYWRl
di0+Z2Z4LnJhc19pZikKLQkJCXJldHVybiAtRU5PTUVNOwotCQlhZGV2LT5nZngucmFzX2lmLT5i
bG9jayA9IEFNREdQVV9SQVNfQkxPQ0tfX0dGWDsKLQkJYWRldi0+Z2Z4LnJhc19pZi0+dHlwZSA9
IEFNREdQVV9SQVNfRVJST1JfX01VTFRJX1VOQ09SUkVDVEFCTEU7Ci0JCWFkZXYtPmdmeC5yYXNf
aWYtPnN1Yl9ibG9ja19pbmRleCA9IDA7Ci0JCXN0cmNweShhZGV2LT5nZngucmFzX2lmLT5uYW1l
LCAiZ2Z4Iik7Ci0JfQotCWZzX2luZm8uaGVhZCA9IGloX2luZm8uaGVhZCA9ICphZGV2LT5nZngu
cmFzX2lmOworCXIgPSBhbWRncHVfZ2Z4X3Jhc19sYXRlX2luaXQoYWRldiwgJmloX2luZm8pOwor
CWlmIChyKQorCQlyZXR1cm4gcjsKIAogCXIgPSBnZnhfdjlfMF9kb19lZGNfZ2RzX3dvcmthcm91
bmRzKGFkZXYpOwogCWlmIChyKQpAQCAtNDQyMiwyNyArNDQxMSw3IEBAIHN0YXRpYyBpbnQgZ2Z4
X3Y5XzBfZWNjX2xhdGVfaW5pdCh2b2lkICpoYW5kbGUpCiAJaWYgKHIpCiAJCXJldHVybiByOwog
Ci0JciA9IGFtZGdwdV9yYXNfbGF0ZV9pbml0KGFkZXYsIGFkZXYtPmdmeC5yYXNfaWYsCi0JCQkJ
ICZmc19pbmZvLCAmaWhfaW5mbyk7Ci0JaWYgKHIpCi0JCWdvdG8gZnJlZTsKLQotCWlmIChhbWRn
cHVfcmFzX2lzX3N1cHBvcnRlZChhZGV2LCBhZGV2LT5nZngucmFzX2lmLT5ibG9jaykpIHsKLQkJ
ciA9IGFtZGdwdV9pcnFfZ2V0KGFkZXYsICZhZGV2LT5nZnguY3BfZWNjX2Vycm9yX2lycSwgMCk7
Ci0JCWlmIChyKQotCQkJZ290byBsYXRlX2Zpbmk7Ci0JfSBlbHNlIHsKLQkJciA9IDA7Ci0JCWdv
dG8gZnJlZTsKLQl9Ci0KIAlyZXR1cm4gMDsKLWxhdGVfZmluaToKLQlhbWRncHVfcmFzX2xhdGVf
ZmluaShhZGV2LCBhZGV2LT5nZngucmFzX2lmLCAmaWhfaW5mbyk7Ci1mcmVlOgotCWtmcmVlKGFk
ZXYtPmdmeC5yYXNfaWYpOwotCWFkZXYtPmdmeC5yYXNfaWYgPSBOVUxMOwotCXJldHVybiByOwog
fQogCiBzdGF0aWMgaW50IGdmeF92OV8wX2xhdGVfaW5pdCh2b2lkICpoYW5kbGUpCi0tIAoyLjcu
NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
