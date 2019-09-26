Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F01DBEB01
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 05:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4166ECDC;
	Thu, 26 Sep 2019 03:50:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750052.outbound.protection.outlook.com [40.107.75.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A0E6ECDC
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 03:50:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZsR6yZ3DalAjsuxs/i1d0jw+8ll8HbDibRZsxjhY2fFdhCaCj7guehaL/F9bi4LSwkiAIJKu8bhTmhVnksz3+pEmOooqng2cL7w89BQ3U+RM0Djfc/rBDdT17EIacF33PjjkgruFYqRg6Igpo6GcmQnE3732Asa/Sx8076TyHiujsQz10jZxt833AbUXvp+InI7G03kwbuNMMmoFP4h5IHC9nDglXvUHz+gAUALXGCTaGbDXTlCfN9zMVhT1FBW35+Z25IyD11Lnp03A7wKbobo8PB3HMEfU+m0DXjoZN9RlXn1wuurnThK+7qaW/+OvibIBxDNqZRjp5SBWwKGeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWAN8TUO26OwXy9tCTM8W88BuJ1MAFSpfjKsfV28L48=;
 b=HhR2T6JRasaACBCp1YyflyJw1iulvFGcsZQT5keM5nksnwHtrhtfzTNk/iSE1/1kDPikPIHGm3dg4rCOmqZ8UfdXDPRiDSsSEw480/74ZToqkcZZefrdgOZEmwL91mmKUa9DjLIHaEE2kvD4B2oxeqzduWkXT+TA9+2orAtaq4HW4Sjhh696q92Q32Wg7pC5dzRCrZHkJTkEYKFrgj8TtIZYMbr6iMtthJqAluw+RavpjEwZ8NAkwNTdpE9kzCgOFiMxFXIXlkWK78MdMJ1sherDwMTOGTnb6pjd3k8f21lETxFsompX4g7PCEPdQlbfY2odsTzEf/eNtpwixL4B6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) by
 MN2PR12MB3469.namprd12.prod.outlook.com (20.178.242.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Thu, 26 Sep 2019 03:50:16 +0000
Received: from MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41]) by MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41%7]) with mapi id 15.20.2305.017; Thu, 26 Sep 2019
 03:50:16 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 7/8] drm/amd/powerplay: implement the interface for setting
 sclk/uclk profile_peak level
Thread-Topic: [PATCH 7/8] drm/amd/powerplay: implement the interface for
 setting sclk/uclk profile_peak level
Thread-Index: AQHVdB2C3p1Ai+NvFkmR8yWJOoIQWQ==
Date: Thu, 26 Sep 2019 03:50:16 +0000
Message-ID: <1569469774-16813-7-git-send-email-Prike.Liang@amd.com>
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
x-ms-office365-filtering-correlation-id: 03ecd913-8332-4cad-a57f-08d74234a495
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3469; 
x-ms-traffictypediagnostic: MN2PR12MB3469:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB34692B3579AEC8769748F9BDFB860@MN2PR12MB3469.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1265;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(199004)(189003)(316002)(256004)(2351001)(476003)(7736002)(386003)(66556008)(64756008)(66946007)(305945005)(66476007)(478600001)(6486002)(86362001)(76176011)(5640700003)(2906002)(6436002)(52116002)(5660300002)(8936002)(26005)(54906003)(81156014)(11346002)(50226002)(486006)(8676002)(81166006)(66446008)(6506007)(102836004)(66066001)(71200400001)(6916009)(71190400001)(99286004)(3846002)(2616005)(446003)(4326008)(2501003)(6116002)(186003)(36756003)(14454004)(6512007)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3469;
 H:MN2PR12MB3536.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6hE6Y/AdxN3r9dBFT1u1Sbs/xzF54Ykp18jUCrlCA8t9Iya336sHS5tGkWRlqWEwxKA5fVtAPiD/Cp+Fr44O+OR7RHj9vHh4OGXFWKhFAykz7gvhSWqr5IWO5lmALfTwcDgtlKFp6B23res7eCzS6brrr1QpFHDW3Y5dudNujpApfn9mhW3PukgCHXQnkbxjG1pLkuUpJfIN2fmhqQw340+r6QzdjU87JJTdhj6xQjbwFVFo4KLzPj92gO9qmBel5V3eoirrAyRm56TxJWhjtQ9pJkZ/HhncSTOdiNOGNmg1/MgcSSeogSFnbNgmchDID/SWTPzOqy4r8wa0E8R9ogVkNo9+tViIceYLJ3cSALqn1lnNCZNPZTiNj9bS5xakk5wupuwuMHh9HWxMD0/uJgCGKUlMu/MauvEshBwjiFM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ecd913-8332-4cad-a57f-08d74234a495
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 03:50:16.5246 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jRMSm0CsdKctvA9KuTlAlp3i1n+bkcBzfyCm5x/isxhxzFy4zT64GSUDuFdEr+BN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3469
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWAN8TUO26OwXy9tCTM8W88BuJ1MAFSpfjKsfV28L48=;
 b=224nN2gMoDrQwEA7TjbbF7dIMbS4Kq6edagVolHkFOYNFDPXSZ/P0uw9DJw1zkIKESLwMU4IzmBPicAyvfQQD9l7njKCePvB2rr1spqDBUqn0TviFHwSLMUEfV4rfIarMd+2pWBtmJBcyWWSWv1JznxJdb6wn9Q1heA2CWciaOY=
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

QWRkIHRoZSBpbnRlcmZhY2UgZm9yIHNldHRpbmcgc2NsayBhbmQgdWNsayBwZWFrIGZyZXF1ZW5j
eS4KClNpZ25lZC1vZmYtYnk6IFByaWtlIExpYW5nIDxQcmlrZS5MaWFuZ0BhbWQuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Jlbm9pcl9wcHQuYyB8IDQwICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0LmMKaW5kZXggMTUxZDc4
ZS4uYzYzNTE4YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvcmVu
b2lyX3BwdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Jlbm9pcl9wcHQu
YwpAQCAtNTEwLDYgKzUxMCw0NSBAQCBzdGF0aWMgaW50IHJlbm9pcl9zZXRfcG93ZXJfcHJvZmls
ZV9tb2RlKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBsb25nICppbnB1dCwgdQogCXJldHVybiAw
OwogfQogCitzdGF0aWMgaW50IHJlbm9pcl9zZXRfcGVha19jbG9ja19ieV9kZXZpY2Uoc3RydWN0
IHNtdV9jb250ZXh0ICpzbXUpCit7CisJaW50IHJldCA9IDA7CisJdWludDMyX3Qgc2Nsa19mcmVx
ID0gMCwgdWNsa19mcmVxID0gMDsKKworCXJldCA9IHNtdV9nZXRfZHBtX2ZyZXFfcmFuZ2Uoc211
LCBTTVVfU0NMSywgTlVMTCwgJnNjbGtfZnJlcSk7CisJaWYgKHJldCkKKwkJcmV0dXJuIHJldDsK
KworCXJldCA9IHNtdV9zZXRfc29mdF9mcmVxX3JhbmdlKHNtdSwgU01VX1NDTEssIHNjbGtfZnJl
cSwgc2Nsa19mcmVxKTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OworCisJcmV0ID0gc211X2dl
dF9kcG1fZnJlcV9yYW5nZShzbXUsIFNNVV9VQ0xLLCBOVUxMLCAmdWNsa19mcmVxKTsKKwlpZiAo
cmV0KQorCQlyZXR1cm4gcmV0OworCisJcmV0ID0gc211X3NldF9zb2Z0X2ZyZXFfcmFuZ2Uoc211
LCBTTVVfVUNMSywgdWNsa19mcmVxLCB1Y2xrX2ZyZXEpOworCWlmIChyZXQpCisJCXJldHVybiBy
ZXQ7CisKKwlyZXR1cm4gcmV0OworfQorCitzdGF0aWMgaW50IHJlbm9pcl9zZXRfcGVyZm9ybWFu
Y2VfbGV2ZWwoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGVudW0gYW1kX2RwbV9mb3JjZWRfbGV2
ZWwgbGV2ZWwpCit7CisJaW50IHJldCA9IDA7CisKKwlzd2l0Y2ggKGxldmVsKSB7CisJY2FzZSBB
TURfRFBNX0ZPUkNFRF9MRVZFTF9QUk9GSUxFX1BFQUs6CisJCXJldCA9IHJlbm9pcl9zZXRfcGVh
a19jbG9ja19ieV9kZXZpY2Uoc211KTsKKwkJYnJlYWs7CisJZGVmYXVsdDoKKwkJcmV0ID0gLUVJ
TlZBTDsKKwkJYnJlYWs7CisJfQorCisJcmV0dXJuIHJldDsKK30KIAogc3RhdGljIGNvbnN0IHN0
cnVjdCBwcHRhYmxlX2Z1bmNzIHJlbm9pcl9wcHRfZnVuY3MgPSB7CiAJLmdldF9zbXVfbXNnX2lu
ZGV4ID0gcmVub2lyX2dldF9zbXVfbXNnX2luZGV4LApAQCAtNTI2LDYgKzU2NSw3IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgcHB0YWJsZV9mdW5jcyByZW5vaXJfcHB0X2Z1bmNzID0gewogCS5nZXRf
cHJvZmlsaW5nX2Nsa19tYXNrID0gcmVub2lyX2dldF9wcm9maWxpbmdfY2xrX21hc2ssCiAJLmZv
cmNlX2Nsa19sZXZlbHMgPSByZW5vaXJfZm9yY2VfY2xrX2xldmVscywKIAkuc2V0X3Bvd2VyX3By
b2ZpbGVfbW9kZSA9IHJlbm9pcl9zZXRfcG93ZXJfcHJvZmlsZV9tb2RlLAorCS5zZXRfcGVyZm9y
bWFuY2VfbGV2ZWwgPSByZW5vaXJfc2V0X3BlcmZvcm1hbmNlX2xldmVsLAogfTsKIAogdm9pZCBy
ZW5vaXJfc2V0X3BwdF9mdW5jcyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKLS0gCjIuNy40Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
