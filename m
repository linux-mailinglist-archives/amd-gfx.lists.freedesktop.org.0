Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B030A5E53
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 02:01:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B46FB89930;
	Tue,  3 Sep 2019 00:01:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800042.outbound.protection.outlook.com [40.107.80.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA7189930
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Sep 2019 00:01:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZK9RHPoYKtrXhs4b9kFSbl8fhANgvL03T9E110ItXM7eUEYtMH+T8NZX8PvkqAIvB9EnRhbkVfOYOtbU5rDacIJOmeEA96ua+uHhtTkqWUsSSuxD+uBRCqUYTB5+wu1bHifHFKRgaU8XWYBzK+rTRaU57xDiPvRR0SQr0souerqiFhPvIXcOXnabvl0a6iX3RDzKXVqj9eBN0JD1Ka0hS+9yn020xjMurcVObf6h/nOX3VeV0DskF9hiZbyx/14PBxDbtUgjnVv1/HAVT8Ke4r36S7vfz9AQJvwP/wwOLi7TUkmU3ZxZoUY+mB/HFpKHsHnICWwLkyRqQarHSGWxew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJJFJTIU7yJ4ke5tt+o9QM+NgcfF2eP7Pyx9S7G7U5g=;
 b=fAM5mtj8bqPDlzNbnmsADhMVhqTSe6Vw4woBNBcTFg9gHkKm7pYePq5PmOAsC72nNC4HfYJl0V1eCEIsC22ES3DSYKXgyGjoowW8xhWhpficeLV6KcAIAUChUbukCEd5kmdEBp0o2kOWiyXd7J6HPnyjdLbaI2MMUEswaRKzJIK2d8hZugooDHz6nSN965iWylHDuY47AS36ocYd9qZi47ezO62G7byJpZifwH6EH5ZpzVsp6Sv0UfFU7XA/Uv1TbBoDENjRkudhuumCnCkeXAB2RHGqNyR0GyRUKtRluTejDqq2EKOGsHuGSn79VCQ3z9QCMfJTzaaicfYGgQynXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1818.namprd12.prod.outlook.com (10.175.92.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Tue, 3 Sep 2019 00:01:51 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d%7]) with mapi id 15.20.2220.021; Tue, 3 Sep 2019
 00:01:51 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhou1,
 Tao" <Tao.Zhou1@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH 02/10] drm/amdgpu/gmc: switch to amdgpu_gmc_ras_late_init
 helper function
Thread-Topic: [PATCH 02/10] drm/amdgpu/gmc: switch to amdgpu_gmc_ras_late_init
 helper function
Thread-Index: AQHVYerKI365ZWfFwUqJXRTjDy/ScQ==
Date: Tue, 3 Sep 2019 00:01:51 +0000
Message-ID: <1567468894-11852-2-git-send-email-Hawking.Zhang@amd.com>
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
x-ms-office365-filtering-correlation-id: c5f024cf-c240-4d9f-8692-08d73001ec59
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1818; 
x-ms-traffictypediagnostic: DM5PR12MB1818:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1818BE09157827754E42ECAEFCB90@DM5PR12MB1818.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(199004)(189003)(99286004)(66446008)(36756003)(2501003)(478600001)(316002)(256004)(66946007)(5660300002)(66476007)(53936002)(81166006)(26005)(8676002)(71200400001)(102836004)(81156014)(71190400001)(6486002)(66556008)(50226002)(186003)(8936002)(66066001)(25786009)(3846002)(6116002)(76176011)(6512007)(6506007)(386003)(4326008)(86362001)(486006)(446003)(2616005)(305945005)(52116002)(7736002)(11346002)(476003)(110136005)(2906002)(14454004)(6636002)(64756008)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1818;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4LVRNO/BpIVp8SxiikhyjAn01J9S0tAX5mRYVjnYDvk09K30R7CoqhjMVcA+wHvr83PfA9dQA8nYLDQD44OaFi7U+GlgdmD3+NQ85KMrIOhXJxRkQyT6M26dr2sFLESJxy5+pDrf66/Z+YXhI93R+i+SgEqltbiJkGoFAEblDG/6gad6YM6vniUlsOMhEWJl/vgOdkqq8yjl6X0/9sN4pTkctzU3Kz0SfgYoY0Qv/eQtR9E5kYIJH87NAvImArPeT2Jd0PbnQxcJhnrzI1DA92VxBAHZVUki+HVdXwazLVvMoQpcRsbXTcr1OGphcfgn50xViuherbYeD/wjzSZ/4iO40uTlYanSPNHwdlm5+XUR7T+Wh9zh7Rcw2IekzNwsXnGeGeBx/hcnXc/k+sUzLrwYUcX2LcwL5t2j+9I97vI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5f024cf-c240-4d9f-8692-08d73001ec59
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 00:01:51.7443 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0tasXECZGh3YdY/+J7gvJ5d3E9nCYj7nb3UespUTmNznFsAICy7gwhj3AwEOIT5L3qA4Fk94hCY/Ec7sfF8pkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1818
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJJFJTIU7yJ4ke5tt+o9QM+NgcfF2eP7Pyx9S7G7U5g=;
 b=2PmwCcDzEUYXrf+pd5OuKuzo8ToILtHqeBB4+ZPLvzhJVUvyQzZENkk/ky9hImRq4NtgtS8Vyys32FjsOfT6LxCvOt8DT6rrd5G/S6cLUfLFkj9ZiDNakvxtY42F2oJglxj75vehztkEztjcXF1BesZ2Jj5tCdr/2kRniC/TM+k=
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

YW1kZ3B1X2dtY19yYXNfbGF0ZV9pbml0IGlzIHVzZWQgdG8gaW5pdCBnbWMgc3BlY2ZpYwpyYXMg
ZGVidWdmcy9zeXNmcyBub2RlIGFuZCBnbWMgc3BlY2lmaWMgaW50ZXJydXB0IGhhbmRsZXIuCkl0
IGNhbiBiZSBzaGFyZWQgYW1vbmcgZ21jIGdlbmVyYXRpb25zLgoKU2lnbmVkLW9mZi1ieTogSGF3
a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9nbWMuYyB8IDQ5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5oIHwgIDIgKysKIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgICB8IDM2ICsrLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspLCAzNCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21j
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmMKaW5kZXggNjA5NDk5
MC4uNTE4OTBiMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2dtYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuYwpAQCAt
MjUsNiArMjUsNyBAQAogICovCiAKICNpbmNsdWRlICJhbWRncHUuaCIKKyNpbmNsdWRlICJhbWRn
cHVfcmFzLmgiCiAKIC8qKgogICogYW1kZ3B1X2dtY19nZXRfcGRlX2Zvcl9ibyAtIGdldCB0aGUg
UERFIGZvciBhIEJPCkBAIC0zMDMsMyArMzA0LDUxIEBAIGJvb2wgYW1kZ3B1X2dtY19maWx0ZXJf
ZmF1bHRzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50NjRfdCBhZGRyLAogCWdtYy0+
ZmF1bHRfaGFzaFtoYXNoXS5pZHggPSBnbWMtPmxhc3RfZmF1bHQrKzsKIAlyZXR1cm4gZmFsc2U7
CiB9CisKK2ludCBhbWRncHVfZ21jX3Jhc19sYXRlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsCisJCQkgICAgIHZvaWQgKnJhc19paF9pbmZvKQoreworCWludCByOworCXN0cnVjdCBy
YXNfaWhfaWYgKmloX2luZm8gPSAoc3RydWN0IHJhc19paF9pZiAqKXJhc19paF9pbmZvOworCXN0
cnVjdCByYXNfZnNfaWYgZnNfaW5mbyA9IHsKKwkJLnN5c2ZzX25hbWUgPSAidW1jX2Vycl9jb3Vu
dCIsCisJCS5kZWJ1Z2ZzX25hbWUgPSAidW1jX2Vycl9pbmplY3QiLAorCX07CisKKwlpZiAoIWlo
X2luZm8pCisJCXJldHVybiAtRUlOVkFMOworCisJaWYgKCFhZGV2LT5nbWMudW1jX3Jhc19pZikg
eworCQlhZGV2LT5nbWMudW1jX3Jhc19pZiA9IGttYWxsb2Moc2l6ZW9mKHN0cnVjdCByYXNfY29t
bW9uX2lmKSwgR0ZQX0tFUk5FTCk7CisJCWlmICghYWRldi0+Z21jLnVtY19yYXNfaWYpCisJCQly
ZXR1cm4gLUVOT01FTTsKKwkJYWRldi0+Z21jLnVtY19yYXNfaWYtPmJsb2NrID0gQU1ER1BVX1JB
U19CTE9DS19fVU1DOworCQlhZGV2LT5nbWMudW1jX3Jhc19pZi0+dHlwZSA9IEFNREdQVV9SQVNf
RVJST1JfX01VTFRJX1VOQ09SUkVDVEFCTEU7CisJCWFkZXYtPmdtYy51bWNfcmFzX2lmLT5zdWJf
YmxvY2tfaW5kZXggPSAwOworCQlzdHJjcHkoYWRldi0+Z21jLnVtY19yYXNfaWYtPm5hbWUsICJ1
bWMiKTsKKwl9CisJaWhfaW5mby0+aGVhZCA9IGZzX2luZm8uaGVhZCA9ICphZGV2LT5nbWMudW1j
X3Jhc19pZjsKKworCXIgPSBhbWRncHVfcmFzX2xhdGVfaW5pdChhZGV2LCBhZGV2LT5nbWMudW1j
X3Jhc19pZiwKKwkJCQkgJmZzX2luZm8sIGloX2luZm8pOworCWlmIChyKQorCQlnb3RvIGZyZWU7
CisKKwlpZiAoYW1kZ3B1X3Jhc19pc19zdXBwb3J0ZWQoYWRldiwgYWRldi0+Z21jLnVtY19yYXNf
aWYtPmJsb2NrKSkgeworCQlyID0gYW1kZ3B1X2lycV9nZXQoYWRldiwgJmFkZXYtPmdtYy5lY2Nf
aXJxLCAwKTsKKwkJaWYgKHIpCisJCQlnb3RvIGxhdGVfZmluaTsKKwl9IGVsc2UgeworCQlyID0g
MDsKKwkJZ290byBmcmVlOworCX0KKworCXJldHVybiAwOworCitsYXRlX2Zpbmk6CisJYW1kZ3B1
X3Jhc19sYXRlX2ZpbmkoYWRldiwgYWRldi0+Z21jLnVtY19yYXNfaWYsIGloX2luZm8pOworZnJl
ZToKKwlrZnJlZShhZGV2LT5nbWMudW1jX3Jhc19pZik7CisJYWRldi0+Z21jLnVtY19yYXNfaWYg
PSBOVUxMOworCXJldHVybiByOworfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2dtYy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dt
Yy5oCmluZGV4IGI2ZTFkOTguLjMzMWNlNTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9nbWMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZ21jLmgKQEAgLTIzMCw1ICsyMzAsNyBAQCB2b2lkIGFtZGdwdV9nbWNfYWdwX2xvY2F0
aW9uKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQkJICAgICBzdHJ1Y3QgYW1kZ3B1X2dt
YyAqbWMpOwogYm9vbCBhbWRncHVfZ21jX2ZpbHRlcl9mYXVsdHMoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsIHVpbnQ2NF90IGFkZHIsCiAJCQkgICAgICB1aW50MTZfdCBwYXNpZCwgdWludDY0
X3QgdGltZXN0YW1wKTsKK2ludCBhbWRncHVfZ21jX3Jhc19sYXRlX2luaXQoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYsCisJCQkgICAgIHZvaWQgKmloX2luZm8pOwogCiAjZW5kaWYKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCmluZGV4IDc0NDgzYTcuLjY1MWVjNWQgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwpAQCAtNzY1LDM5ICs3NjUsMTMgQEAgc3Rh
dGljIGludCBnbWNfdjlfMF9lY2NfbGF0ZV9pbml0KHZvaWQgKmhhbmRsZSkKIHsKIAlpbnQgcjsK
IAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWhh
bmRsZTsKLQlzdHJ1Y3QgcmFzX2ZzX2lmIHVtY19mc19pbmZvID0gewotCQkuc3lzZnNfbmFtZSA9
ICJ1bWNfZXJyX2NvdW50IiwKLQkJLmRlYnVnZnNfbmFtZSA9ICJ1bWNfZXJyX2luamVjdCIsCi0J
fTsKIAlzdHJ1Y3QgcmFzX2loX2lmIHVtY19paF9pbmZvID0gewogCQkuY2IgPSBnbWNfdjlfMF9w
cm9jZXNzX3Jhc19kYXRhX2NiLAogCX07CiAKLQlpZiAoIWFkZXYtPmdtYy51bWNfcmFzX2lmKSB7
Ci0JCWFkZXYtPmdtYy51bWNfcmFzX2lmID0ga21hbGxvYyhzaXplb2Yoc3RydWN0IHJhc19jb21t
b25faWYpLCBHRlBfS0VSTkVMKTsKLQkJaWYgKCFhZGV2LT5nbWMudW1jX3Jhc19pZikKLQkJCXJl
dHVybiAtRU5PTUVNOwotCQlhZGV2LT5nbWMudW1jX3Jhc19pZi0+YmxvY2sgPSBBTURHUFVfUkFT
X0JMT0NLX19VTUM7Ci0JCWFkZXYtPmdtYy51bWNfcmFzX2lmLT50eXBlID0gQU1ER1BVX1JBU19F
UlJPUl9fTVVMVElfVU5DT1JSRUNUQUJMRTsKLQkJYWRldi0+Z21jLnVtY19yYXNfaWYtPnN1Yl9i
bG9ja19pbmRleCA9IDA7Ci0JCXN0cmNweShhZGV2LT5nbWMudW1jX3Jhc19pZi0+bmFtZSwgInVt
YyIpOwotCX0KLQl1bWNfaWhfaW5mby5oZWFkID0gdW1jX2ZzX2luZm8uaGVhZCA9ICphZGV2LT5n
bWMudW1jX3Jhc19pZjsKLQotCXIgPSBhbWRncHVfcmFzX2xhdGVfaW5pdChhZGV2LCBhZGV2LT5n
bWMudW1jX3Jhc19pZiwKLQkJCQkgJnVtY19mc19pbmZvLCAmdW1jX2loX2luZm8pOworCXIgPSBh
bWRncHVfZ21jX3Jhc19sYXRlX2luaXQoYWRldiwgJnVtY19paF9pbmZvKTsKIAlpZiAocikKLQkJ
Z290byBmcmVlOwotCi0JaWYgKGFtZGdwdV9yYXNfaXNfc3VwcG9ydGVkKGFkZXYsIGFkZXYtPmdt
Yy51bWNfcmFzX2lmLT5ibG9jaykpIHsKLQkJciA9IGFtZGdwdV9pcnFfZ2V0KGFkZXYsICZhZGV2
LT5nbWMuZWNjX2lycSwgMCk7Ci0JCWlmIChyKQotCQkJZ290byB1bWNfbGF0ZV9maW5pOwotCX0g
ZWxzZSB7Ci0JCS8qIGZyZWUgdW1jIHJhc19pZiBpZiB1bWMgcmFzIGlzIG5vdCBzdXBwb3J0ZWQg
Ki8KLQkJciA9IDA7Ci0JCWdvdG8gZnJlZTsKLQl9CisJCXJldHVybiByOwogCiAJaWYgKGFkZXYt
Pm1taHViX2Z1bmNzICYmIGFkZXYtPm1taHViX2Z1bmNzLT5yYXNfbGF0ZV9pbml0KSB7CiAJCXIg
PSBhZGV2LT5tbWh1Yl9mdW5jcy0+cmFzX2xhdGVfaW5pdChhZGV2KTsKQEAgLTgwNSwxMiArNzc5
LDYgQEAgc3RhdGljIGludCBnbWNfdjlfMF9lY2NfbGF0ZV9pbml0KHZvaWQgKmhhbmRsZSkKIAkJ
CXJldHVybiByOwogCX0KIAlyZXR1cm4gMDsKLXVtY19sYXRlX2Zpbmk6Ci0JYW1kZ3B1X3Jhc19s
YXRlX2ZpbmkoYWRldiwgYWRldi0+Z21jLnVtY19yYXNfaWYsICZ1bWNfaWhfaW5mbyk7Ci1mcmVl
OgotCWtmcmVlKGFkZXYtPmdtYy51bWNfcmFzX2lmKTsKLQlhZGV2LT5nbWMudW1jX3Jhc19pZiA9
IE5VTEw7Ci0JcmV0dXJuIHI7CiB9CiAKIHN0YXRpYyBpbnQgZ21jX3Y5XzBfbGF0ZV9pbml0KHZv
aWQgKmhhbmRsZSkKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
