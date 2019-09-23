Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AC7BAFD7
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 10:43:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931076E248;
	Mon, 23 Sep 2019 08:43:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750083.outbound.protection.outlook.com [40.107.75.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 167736E248
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 08:43:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TgYnuGAIQ99GfPeXvYtl1uycM0qdyseSAvQmut5xzQrtIiXPp/Rirp52owustwW2ZFpn2uBuXT/tOli2O+z2fq7GQXQn6PwZ3NYCxvFuco5I74bu7S8W6H+toQj+OoTk99gDVP2lRYDg+cP8a3Wiqp1MPtim52FcXykenLFKpRrT53TeIPoCoJaiH2F14SNlkUfPZ0xaSiXINmoJG9OdnpSFNCf5tLNny2hAi7ihh1b072GWCuWDsjiM5NSY1bR/WKH/+CugMIsn05npk7FT3EQbaCLQCP75bIg4iZJNIh0SNDqWEEAxysOVX2Cg4YNYSADx3wsUAyUwJ/EqHqz4UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ply5wkyXU9o13PRqz9W/6jqFPejadnsaMKrhl6GZd94=;
 b=VgGffsRyxhlugJCglC39gkJu/aL+tfODERSybQuWovN9YIrOMVY+DewsUwelC21IyiS82zr5we814D0cSzFeB8ECsYzcIO5bYdLo979RG6t1w3XuWN6Kc/sF1pkErx9NoPLh/qpyiiaLMVy03e3J1OZWehsfN1wBqNbTA0cPSKbQGzLsirNT4q78twp1VDxjp2d5TrxK23kG16/w/m0db3rtZCbJAOJJpEnI19MBvcPah6+riEM/v9sWatmZ+zhGBjTdItbKAzX2e0opX6BHrdeCgLV1Wj5ULsr2SuakqhLw5RjrRJ0eoWVV+2P/vRpMIFpr+iaK1S9LlZlyMZBp1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) by
 MN2PR12MB4078.namprd12.prod.outlook.com (52.135.51.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Mon, 23 Sep 2019 08:43:14 +0000
Received: from MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41]) by MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41%7]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 08:43:14 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 4/5] drm/amd/powerplay: add the interfaces for getting and
 setting profiling dpm clock level
Thread-Topic: [PATCH 4/5] drm/amd/powerplay: add the interfaces for getting
 and setting profiling dpm clock level
Thread-Index: AQHVcerwCWCcIVAOT0O0i3oLSqOV2g==
Date: Mon, 23 Sep 2019 08:43:14 +0000
Message-ID: <1569228167-3120-4-git-send-email-Prike.Liang@amd.com>
References: <1569228167-3120-1-git-send-email-Prike.Liang@amd.com>
In-Reply-To: <1569228167-3120-1-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR03CA0050.apcprd03.prod.outlook.com
 (2603:1096:202:17::20) To MN2PR12MB3536.namprd12.prod.outlook.com
 (2603:10b6:208:104::19)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 91543639-8c30-4310-0842-08d74002126e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4078; 
x-ms-traffictypediagnostic: MN2PR12MB4078:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4078427A59921B8EDC3C4F09FB850@MN2PR12MB4078.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1332;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(189003)(199004)(6436002)(36756003)(478600001)(316002)(14454004)(86362001)(66946007)(66476007)(71200400001)(71190400001)(66066001)(64756008)(66446008)(26005)(7736002)(305945005)(3846002)(6116002)(5640700003)(256004)(14444005)(66556008)(6512007)(6916009)(486006)(186003)(76176011)(6486002)(2501003)(2906002)(386003)(6506007)(99286004)(4326008)(2616005)(8676002)(8936002)(102836004)(54906003)(11346002)(476003)(52116002)(446003)(50226002)(81166006)(81156014)(5660300002)(2351001)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4078;
 H:MN2PR12MB3536.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ++nVefypeZTnvMPsGtj6jGFL7W5qmBzOCND78eD5yQjYEe+R47eW08Os0PvOT8iHOjkQ6vZ0USJijoU5zrc+p9o+GYePszpaWphGguE7OtaEQpX41wFyfCaBLgZF+dj3uDeP7Crd7q9oFTrzbFICN00ytu3ZAaFxhwLxrL6AwrW6eY6Z0Eeyq3UtGQxsWyaIw0vPnhW1SP/0JTjWGhP0OkPS3e5u5yzbl0wLiTlGldFCA81s31JZAXqpsl3ttt0KKFZXycpxe+s+316HUkUyNbhJRUiqqBEHUltSQJHwiUhLeBgAa32BcnPdCj2Jk+kxxNoxRb+yWEziz+HYkEuBKmEXVw7YD1B5zos9scFdR90wmI1rm3nZb/emcgZ0SIxejw4h0v77kqH9H7opcHTcdlad/ERxXKMU7sv9PaCf6DY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91543639-8c30-4310-0842-08d74002126e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 08:43:14.1966 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D8sE16TKwjpXjyfp1i2Hn+B3n9ibES7UABCfwnTW2XkFWN38nhXBvp9CKWT9gctU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4078
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ply5wkyXU9o13PRqz9W/6jqFPejadnsaMKrhl6GZd94=;
 b=E66aKWppqqUFwDYc2I+p2d226zYOCDprTfDvTXoXPQdgl/KE44ZzFtuEaZSsB9JVJVO9IrvjjADpzd2qSvsjfXGphLpKJBEARVrDgv4VN+eC+V/zVvZCQBoosZ2bTWJMwqb5zLlby7AC2QntGI83iHR1iAUSGx+4FwKMsM/q7XU=
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
Cc: "arron.liu@amd.com" <arron.liu@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "Liang, Prike" <Prike.Liang@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>, "Feng,
 Kenneth" <Kenneth.Feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

aW1wbGVtZW50IGdldF9wcm9maWxpbmdfY2xrX21hc2sgYW5kIGZvcmNlX2Nsa19sZXZlbHMgZm9y
IGZvcmNpbmcgZHBtIGNsayB0byBsaW1pdCB2YWx1ZS4KClNpZ25lZC1vZmYtYnk6IFByaWtlIExp
YW5nIDxQcmlrZS5MaWFuZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L3Jlbm9pcl9wcHQuYyB8IDgzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDgzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9yZW5vaXJfcHB0LmMKaW5kZXggZjg3YWE1Ni4uYzZhYWUxYyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvcmVub2lyX3BwdC5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L3Jlbm9pcl9wcHQuYwpAQCAtMzkyLDYgKzM5Miw4NyBAQCBzdGF0
aWMgaW50IHJlbm9pcl9nZXRfd29ya2xvYWRfdHlwZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwg
dWludDMyX3QgcHJvZmlsZSkKIAlyZXR1cm4gcHBsaWJfd29ya2xvYWQ7CiB9CiAKK3N0YXRpYyBp
bnQgcmVub2lyX2dldF9wcm9maWxpbmdfY2xrX21hc2soc3RydWN0IHNtdV9jb250ZXh0ICpzbXUs
CisJCQkJCSBlbnVtIGFtZF9kcG1fZm9yY2VkX2xldmVsIGxldmVsLAorCQkJCQkgdWludDMyX3Qg
KnNjbGtfbWFzaywKKwkJCQkJIHVpbnQzMl90ICptY2xrX21hc2ssCisJCQkJCSB1aW50MzJfdCAq
c29jX21hc2spCit7CisKKwlpZiAobGV2ZWwgPT0gQU1EX0RQTV9GT1JDRURfTEVWRUxfUFJPRklM
RV9NSU5fU0NMSykgeworCQlpZiAoc2Nsa19tYXNrKQorCQkJKnNjbGtfbWFzayA9IDA7CisJfSBl
bHNlIGlmIChsZXZlbCA9PSBBTURfRFBNX0ZPUkNFRF9MRVZFTF9QUk9GSUxFX01JTl9NQ0xLKSB7
CisJCWlmIChtY2xrX21hc2spCisJCQkqbWNsa19tYXNrID0gMDsKKwl9IGVsc2UgaWYgKGxldmVs
ID09IEFNRF9EUE1fRk9SQ0VEX0xFVkVMX1BST0ZJTEVfUEVBSykgeworCQlpZihzY2xrX21hc2sp
CisJCQkvKiBUaGUgc2NsayBhcyBnZnhjbGsgYW5kIGhhcyB0aHJlZSBsZXZlbCBhYm91dCBtYXgv
bWluL2N1cnJlbnQgKi8KKwkJCSpzY2xrX21hc2sgPSAzIC0gMTsKKworCQlpZihtY2xrX21hc2sp
CisJCQkqbWNsa19tYXNrID0gTlVNX01FTUNMS19EUE1fTEVWRUxTIC0gMTsKKworCQlpZihzb2Nf
bWFzaykKKwkJCSpzb2NfbWFzayA9IE5VTV9TT0NDTEtfRFBNX0xFVkVMUyAtIDE7CisJfQorCisJ
cmV0dXJuIDA7Cit9CisKK3N0YXRpYyBpbnQgcmVub2lyX2ZvcmNlX2Nsa19sZXZlbHMoc3RydWN0
IHNtdV9jb250ZXh0ICpzbXUsCisJCQkJICAgZW51bSBzbXVfY2xrX3R5cGUgY2xrX3R5cGUsIHVp
bnQzMl90IG1hc2spCit7CisKKwlpbnQgcmV0ID0gMCA7CisJdWludDMyX3Qgc29mdF9taW5fbGV2
ZWwgPSAwLCBzb2Z0X21heF9sZXZlbCA9IDAsIG1pbl9mcmVxID0gMCwgbWF4X2ZyZXEgPSAwOwor
CURwbUNsb2Nrc190ICpjbGtfdGFibGUgPSBzbXUtPnNtdV90YWJsZS5jbG9ja3NfdGFibGU7CisK
Kwlzb2Z0X21pbl9sZXZlbCA9IG1hc2sgPyAoZmZzKG1hc2spIC0gMSkgOiAwOworCXNvZnRfbWF4
X2xldmVsID0gbWFzayA/IChmbHMobWFzaykgLSAxKSA6IDA7CisKKwlzd2l0Y2ggKGNsa190eXBl
KSB7CisJY2FzZSBTTVVfR0ZYQ0xLOgorCWNhc2UgU01VX1NDTEs6CisJCXJldCA9IHNtdV9nZXRf
ZHBtX2ZyZXFfcmFuZ2Uoc211LCBTTVVfR0ZYQ0xLLCAmbWluX2ZyZXEsICZtYXhfZnJlcSk7CisJ
CWlmIChyZXQpCisJCQlyZXR1cm4gcmV0OworCQlyZXQgPSBzbXVfc2VuZF9zbWNfbXNnX3dpdGhf
cGFyYW0oc211LCBTTVVfTVNHX1NldFNvZnRNYXhHZnhDbGssIG1heF9mcmVxKTsKKwkJaWYgKHJl
dCkKKwkJCXJldHVybiByZXQ7CisJCXJldCA9IHNtdV9zZW5kX3NtY19tc2dfd2l0aF9wYXJhbShz
bXUsIFNNVV9NU0dfU2V0SGFyZE1pbkdmeENsaywgbWluX2ZyZXEpOworCQlpZiAocmV0KQorCQkJ
cmV0dXJuIHJldDsKKwkJYnJlYWs7CisJY2FzZSBTTVVfU09DQ0xLOgorCQlHRVRfRFBNX0NVUl9G
UkVRKGNsa190YWJsZSwgY2xrX3R5cGUsIHNvZnRfbWluX2xldmVsLCBtaW5fZnJlcSk7CisJCUdF
VF9EUE1fQ1VSX0ZSRVEoY2xrX3RhYmxlLCBjbGtfdHlwZSwgc29mdF9tYXhfbGV2ZWwsIG1heF9m
cmVxKTsKKwkJcmV0ID0gc211X3NlbmRfc21jX21zZ193aXRoX3BhcmFtKHNtdSwgU01VX01TR19T
ZXRTb2Z0TWF4U29jY2xrQnlGcmVxLCBtYXhfZnJlcSk7CisJCWlmIChyZXQpCisJCQlyZXR1cm4g
cmV0OworCQlyZXQgPSBzbXVfc2VuZF9zbWNfbXNnX3dpdGhfcGFyYW0oc211LCBTTVVfTVNHX1Nl
dEhhcmRNaW5Tb2NjbGtCeUZyZXEsIG1pbl9mcmVxKTsKKwkJaWYgKHJldCkKKwkJCXJldHVybiBy
ZXQ7CisJCWJyZWFrOworCWNhc2UgU01VX01DTEs6CisJY2FzZSBTTVVfRkNMSzoKKwkJR0VUX0RQ
TV9DVVJfRlJFUShjbGtfdGFibGUsIGNsa190eXBlLCBzb2Z0X21pbl9sZXZlbCwgbWluX2ZyZXEp
OworCQlHRVRfRFBNX0NVUl9GUkVRKGNsa190YWJsZSwgY2xrX3R5cGUsIHNvZnRfbWF4X2xldmVs
LCBtYXhfZnJlcSk7CisJCXJldCA9IHNtdV9zZW5kX3NtY19tc2dfd2l0aF9wYXJhbShzbXUsIFNN
VV9NU0dfU2V0U29mdE1heEZjbGtCeUZyZXEsIG1heF9mcmVxKTsKKwkJaWYgKHJldCkKKwkJCXJl
dHVybiByZXQ7CisJCXJldCA9IHNtdV9zZW5kX3NtY19tc2dfd2l0aF9wYXJhbShzbXUsIFNNVV9N
U0dfU2V0SGFyZE1pbkZjbGtCeUZyZXEsIG1pbl9mcmVxKTsKKwkJaWYgKHJldCkKKwkJCXJldHVy
biByZXQ7CisKKwkJYnJlYWs7CisJZGVmYXVsdDoKKwkJYnJlYWs7CisJfQorCisJcmV0dXJuIHJl
dDsKK30KKwogc3RhdGljIGNvbnN0IHN0cnVjdCBwcHRhYmxlX2Z1bmNzIHJlbm9pcl9wcHRfZnVu
Y3MgPSB7CiAJLmdldF9zbXVfbXNnX2luZGV4ID0gcmVub2lyX2dldF9zbXVfbXNnX2luZGV4LAog
CS5nZXRfc211X3RhYmxlX2luZGV4ID0gcmVub2lyX2dldF9zbXVfdGFibGVfaW5kZXgsCkBAIC00
MDQsNiArNDg1LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwcHRhYmxlX2Z1bmNzIHJlbm9pcl9w
cHRfZnVuY3MgPSB7CiAJLmZvcmNlX2RwbV9saW1pdF92YWx1ZSA9IHJlbm9pcl9mb3JjZV9kcG1f
bGltaXRfdmFsdWUsCiAJLnVuZm9yY2VfZHBtX2xldmVscyA9IHJlbm9pcl91bmZvcmNlX2RwbV9s
ZXZlbHMsCiAJLmdldF93b3JrbG9hZF90eXBlID0gcmVub2lyX2dldF93b3JrbG9hZF90eXBlLAor
CS5nZXRfcHJvZmlsaW5nX2Nsa19tYXNrID0gcmVub2lyX2dldF9wcm9maWxpbmdfY2xrX21hc2ss
CisJLmZvcmNlX2Nsa19sZXZlbHMgPSByZW5vaXJfZm9yY2VfY2xrX2xldmVscywKIH07CiAKIHZv
aWQgcmVub2lyX3NldF9wcHRfZnVuY3Moc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCi0tIAoyLjcu
NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
