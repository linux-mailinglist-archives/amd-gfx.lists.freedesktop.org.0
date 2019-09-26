Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79ABABEAFF
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 05:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE6B16ECBF;
	Thu, 26 Sep 2019 03:50:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790055.outbound.protection.outlook.com [40.107.79.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 679BC6EC8F
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 03:50:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BhR/RkFy9FKb5wtQPUt6K3hvIsbqBsCUIXq7fahd4v/VDi18aXZcANMEA34gU1vUuV/zF0oyz/GhPkA4/EKguNFmZHlV2Xi7DerrNozrmHDi4q5ale1lmXBrVkKw6xgMU05vD/SAsIC2jaSMP+EJsjUkBypuFqHmS/TOI+KNscOBxfMuzyJgTeyDhWC+71Bjpq6cM41CAcdsbJgwkWdljlEs8HkjlG56BQAqpJrGB17zTfC+6ZVzM2E5+aU9fuvLTJyVdEJB69WpYvGN/DdDTEemg49ajXmHFE18LIcsLXsVdO2vYvXsO+n2feCL9YXSxqTiS/PjccyRzkl6ETan5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+op66RMZFFDt7qsRop63F574wxr8IC2CKcRJTdUobao=;
 b=K9waqfFaLSJWVPUd4NiFd+if8rM7/6khAUZ8gv4jvryK8lbjeYyesE7BymI6G68piITmjfZGpuaIVPCz5aerhJrqrQ5Ki59YsnM3xSHBKDgF08LysVAnDrN/PVjA/bsQ9JANDjUICR+xSE0s3EXn2i1QptdrCGU4XOLjMHm7TpUCyDTwis0i3/dGyfLooR/9mznNrWU/Y7MRTM9g5nFUITcmo9DiC+u3JwH5GIp9uXUOPL2F74pn+sUVpcMK+oXe2/IKOTmLDsX2fgh3B0WGAVRKbGJi2KUobDnuXmcjdTiUhl9z5yT+H7bonifN3VmDauJnPEp2wBDnfw8kTcSiWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) by
 MN2PR12MB3261.namprd12.prod.outlook.com (20.179.84.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Thu, 26 Sep 2019 03:50:11 +0000
Received: from MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41]) by MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41%7]) with mapi id 15.20.2305.017; Thu, 26 Sep 2019
 03:50:11 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 5/8] drm/amd/powerplay: add the interfaces for getting and
 setting profiling dpm clock level
Thread-Topic: [PATCH 5/8] drm/amd/powerplay: add the interfaces for getting
 and setting profiling dpm clock level
Thread-Index: AQHVdB1/W+z5K4dVOkm40MyqvM59bQ==
Date: Thu, 26 Sep 2019 03:50:11 +0000
Message-ID: <1569469774-16813-5-git-send-email-Prike.Liang@amd.com>
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
x-ms-office365-filtering-correlation-id: 852f902f-a374-4f6a-7819-08d74234a199
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3261; 
x-ms-traffictypediagnostic: MN2PR12MB3261:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3261696514D15B331D010B5EFB860@MN2PR12MB3261.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(346002)(396003)(39860400002)(199004)(189003)(2616005)(476003)(26005)(81166006)(81156014)(36756003)(54906003)(8676002)(6916009)(2906002)(316002)(2501003)(305945005)(7736002)(8936002)(6116002)(50226002)(3846002)(5640700003)(52116002)(14454004)(478600001)(6512007)(99286004)(71200400001)(25786009)(71190400001)(6486002)(6436002)(5660300002)(86362001)(66066001)(76176011)(66446008)(64756008)(66556008)(66476007)(66946007)(2351001)(4326008)(102836004)(446003)(11346002)(256004)(14444005)(486006)(186003)(386003)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3261;
 H:MN2PR12MB3536.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dFE1yD1FKwfE3hGdsmg4+xyQVE1EKmkdVnteBAzHCSGHvFmB7B6cthkaYjp3qEw5hkVkRYH6KUHSf8AekBbhj1qEU3STVN2hPyOJQ1eEgzseszUGa4vmLzzmqU/kYC6mTLE06Xejh3+2kSTejt2L+mAWqFDDx0jFAYyrKUsC3isd06HgncHXd3U6IjqGsiHTvdt7y+CTLSygc3Jinu6CNOyArd/Dw2P6rd/YcLaCI/K4xJfLNT1lm/PjDvUFtqTR8s1kKjbmk1CAxZgHfqtxACYtpwLQRlmV5YLo5tD7L7pb8LVZ6TAbJ4REQF5Vw3TFheIawQWvCTY5VjSvR7RsbgPQpQNmr2mQpH/ABUXQnM+A/oDLT5opg8NkjcqvQEacL3g7N3O/B3nIQxxHRXfPSyTvx7ekXnXh6xYJaWDkl1E=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 852f902f-a374-4f6a-7819-08d74234a199
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 03:50:11.5215 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OVsgCVSjhxSnTqkJZhqZCCyFy89QPJgM4ezMIwEkcwurVP4yfeVVuucor+uCftay
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3261
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+op66RMZFFDt7qsRop63F574wxr8IC2CKcRJTdUobao=;
 b=C5lfGVuqjAX6eAO+XNTb76BxS3l8qIzEW+Q9ZNSuh3hGPVc2i6pStP2jlJmHFQ3p7bYrCaOD2CJou56YotCCI7b4kuf3vyCCry2ml9n+oVBZa18ktfKTt6sWO2gTminCf4BSSBNkykomypiUV+q2TUv1EjPbFRmYc0TqwazwYDo=
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

aW1wbGVtZW50IGdldF9wcm9maWxpbmdfY2xrX21hc2sgYW5kIGZvcmNlX2Nsa19sZXZlbHMgZm9y
IGZvcmNpbmcgZHBtIGNsayB0byBsaW1pdCB2YWx1ZS4KClNpZ25lZC1vZmYtYnk6IFByaWtlIExp
YW5nIDxQcmlrZS5MaWFuZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L3Jlbm9pcl9wcHQuYyB8IDkxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDkxIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9yZW5vaXJfcHB0LmMKaW5kZXggZGM5NDViOC4uNGYyYjc1MCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvcmVub2lyX3BwdC5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L3Jlbm9pcl9wcHQuYwpAQCAtMzkzLDYgKzM5Myw5NSBAQCBzdGF0
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
KSB7CisJY2FzZSBTTVVfR0ZYQ0xLOgorCWNhc2UgU01VX1NDTEs6CisJCWlmIChzb2Z0X21pbl9s
ZXZlbCA+IDIgfHwgc29mdF9tYXhfbGV2ZWwgPiAyKSB7CisJCQlwcl9pbmZvKCJDdXJyZW50bHkg
c2NsayBvbmx5IHN1cHBvcnQgMyBsZXZlbHMgb24gQVBVXG4iKTsKKwkJCXJldHVybiAtRUlOVkFM
OworCQl9CisKKwkJcmV0ID0gc211X2dldF9kcG1fZnJlcV9yYW5nZShzbXUsIFNNVV9HRlhDTEss
ICZtaW5fZnJlcSwgJm1heF9mcmVxKTsKKwkJaWYgKHJldCkKKwkJCXJldHVybiByZXQ7CisJCXJl
dCA9IHNtdV9zZW5kX3NtY19tc2dfd2l0aF9wYXJhbShzbXUsIFNNVV9NU0dfU2V0U29mdE1heEdm
eENsaywKKwkJCQkJc29mdF9tYXhfbGV2ZWwgPT0gMCA/IG1pbl9mcmVxIDoKKwkJCQkJc29mdF9t
YXhfbGV2ZWwgPT0gMSA/IFJFTk9JUl9VTURfUFNUQVRFX0dGWENMSyA6IG1heF9mcmVxKTsKKwkJ
aWYgKHJldCkKKwkJCXJldHVybiByZXQ7CisJCXJldCA9IHNtdV9zZW5kX3NtY19tc2dfd2l0aF9w
YXJhbShzbXUsIFNNVV9NU0dfU2V0SGFyZE1pbkdmeENsaywKKwkJCQkJc29mdF9taW5fbGV2ZWwg
PT0gMiA/IG1heF9mcmVxIDoKKwkJCQkJc29mdF9taW5fbGV2ZWwgPT0gMSA/IFJFTk9JUl9VTURf
UFNUQVRFX0dGWENMSyA6IG1pbl9mcmVxKTsKKwkJaWYgKHJldCkKKwkJCXJldHVybiByZXQ7CisJ
CWJyZWFrOworCWNhc2UgU01VX1NPQ0NMSzoKKwkJR0VUX0RQTV9DVVJfRlJFUShjbGtfdGFibGUs
IGNsa190eXBlLCBzb2Z0X21pbl9sZXZlbCwgbWluX2ZyZXEpOworCQlHRVRfRFBNX0NVUl9GUkVR
KGNsa190YWJsZSwgY2xrX3R5cGUsIHNvZnRfbWF4X2xldmVsLCBtYXhfZnJlcSk7CisJCXJldCA9
IHNtdV9zZW5kX3NtY19tc2dfd2l0aF9wYXJhbShzbXUsIFNNVV9NU0dfU2V0U29mdE1heFNvY2Ns
a0J5RnJlcSwgbWF4X2ZyZXEpOworCQlpZiAocmV0KQorCQkJcmV0dXJuIHJldDsKKwkJcmV0ID0g
c211X3NlbmRfc21jX21zZ193aXRoX3BhcmFtKHNtdSwgU01VX01TR19TZXRIYXJkTWluU29jY2xr
QnlGcmVxLCBtaW5fZnJlcSk7CisJCWlmIChyZXQpCisJCQlyZXR1cm4gcmV0OworCQlicmVhazsK
KwljYXNlIFNNVV9NQ0xLOgorCWNhc2UgU01VX0ZDTEs6CisJCUdFVF9EUE1fQ1VSX0ZSRVEoY2xr
X3RhYmxlLCBjbGtfdHlwZSwgc29mdF9taW5fbGV2ZWwsIG1pbl9mcmVxKTsKKwkJR0VUX0RQTV9D
VVJfRlJFUShjbGtfdGFibGUsIGNsa190eXBlLCBzb2Z0X21heF9sZXZlbCwgbWF4X2ZyZXEpOwor
CQlyZXQgPSBzbXVfc2VuZF9zbWNfbXNnX3dpdGhfcGFyYW0oc211LCBTTVVfTVNHX1NldFNvZnRN
YXhGY2xrQnlGcmVxLCBtYXhfZnJlcSk7CisJCWlmIChyZXQpCisJCQlyZXR1cm4gcmV0OworCQly
ZXQgPSBzbXVfc2VuZF9zbWNfbXNnX3dpdGhfcGFyYW0oc211LCBTTVVfTVNHX1NldEhhcmRNaW5G
Y2xrQnlGcmVxLCBtaW5fZnJlcSk7CisJCWlmIChyZXQpCisJCQlyZXR1cm4gcmV0OworCQlicmVh
azsKKwlkZWZhdWx0OgorCQlicmVhazsKKwl9CisKKwlyZXR1cm4gcmV0OworfQorCiBzdGF0aWMg
Y29uc3Qgc3RydWN0IHBwdGFibGVfZnVuY3MgcmVub2lyX3BwdF9mdW5jcyA9IHsKIAkuZ2V0X3Nt
dV9tc2dfaW5kZXggPSByZW5vaXJfZ2V0X3NtdV9tc2dfaW5kZXgsCiAJLmdldF9zbXVfdGFibGVf
aW5kZXggPSByZW5vaXJfZ2V0X3NtdV90YWJsZV9pbmRleCwKQEAgLTQwNSw2ICs0OTQsOCBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IHBwdGFibGVfZnVuY3MgcmVub2lyX3BwdF9mdW5jcyA9IHsKIAku
Zm9yY2VfZHBtX2xpbWl0X3ZhbHVlID0gcmVub2lyX2ZvcmNlX2RwbV9saW1pdF92YWx1ZSwKIAku
dW5mb3JjZV9kcG1fbGV2ZWxzID0gcmVub2lyX3VuZm9yY2VfZHBtX2xldmVscywKIAkuZ2V0X3dv
cmtsb2FkX3R5cGUgPSByZW5vaXJfZ2V0X3dvcmtsb2FkX3R5cGUsCisJLmdldF9wcm9maWxpbmdf
Y2xrX21hc2sgPSByZW5vaXJfZ2V0X3Byb2ZpbGluZ19jbGtfbWFzaywKKwkuZm9yY2VfY2xrX2xl
dmVscyA9IHJlbm9pcl9mb3JjZV9jbGtfbGV2ZWxzLAogfTsKIAogdm9pZCByZW5vaXJfc2V0X3Bw
dF9mdW5jcyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKLS0gCjIuNy40CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
