Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBCABEB00
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 05:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F3B6ECDA;
	Thu, 26 Sep 2019 03:50:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750048.outbound.protection.outlook.com [40.107.75.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B7F46ECCD
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 03:50:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OiCg5CccZLJgohkkPBbkJhtf9f35M0yM6J1DEoSN8BUc0UNteMs617V3dDfDObhZguv6hR64WylpS9H4dRaIy6xdTGRjFSIOizFbnUaKfZfSWsAUHX0KpzoZVGDs6eB6FDSa2ZuaVZZp/sdMkYx2RFVgQRTFIT1nJLq3GCEnVo+teyAbW9TIa9Ob8VZvFHnaJNowdGW5hwalwUDcvVjhUBKTVULKHJrJXbFtH43dFgrMZSmzbPUxuf2ZyWDtxTSlpPd2FpPECbFcc89CvqXWDetk4enu6LCjj2wiokErGvW/wE4L4l2YjgXTH8uXNmaRpjw/U82b+zDWE4L0rbumgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7GxX0rTFFV13sf+GjKFfBMegDL3SrfkxGIiS5euMVA=;
 b=oQ1ejndqUtT2JiuhLia38iStHQjJ5BnYm4uPWdcvd4c7Gh+pWThg+FdnAwygygqzyJlpMF6CEIy4wT9822gxBnruEIuIgq6Rzb1TnarfpPyy5h3ahBceE3lcDCm5bx9XKsuP0IfOSs7A9SzxVw3hoM3hpfnNqaM3OE2KfNg83Bvn6dQ9wUQPpysUkefIOU5kA/rAPvpeolB8zmjCq2H7LsUoKOFgFJwAO94R2QzgtfJGu2NqJIsTeMa2E0/4Evew7qsMz6g/vnnKnRXIJ2Izq1gMG/oYRSn7P5m3a5ewUsnuHwVOpvk9BFTO15+xjF8RhX6a0Xun1lVVC8C5TV0AbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) by
 MN2PR12MB3469.namprd12.prod.outlook.com (20.178.242.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Thu, 26 Sep 2019 03:50:14 +0000
Received: from MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41]) by MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41%7]) with mapi id 15.20.2305.017; Thu, 26 Sep 2019
 03:50:14 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 6/8] drm/amd/powerplay: implement interface
 set_power_profile_mode()
Thread-Topic: [PATCH 6/8] drm/amd/powerplay: implement interface
 set_power_profile_mode()
Thread-Index: AQHVdB2AeO2zhY1FGE+nPCW94qBLsw==
Date: Thu, 26 Sep 2019 03:50:14 +0000
Message-ID: <1569469774-16813-6-git-send-email-Prike.Liang@amd.com>
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
x-ms-office365-filtering-correlation-id: 51add1be-5506-40bc-e39c-08d74234a314
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3469; 
x-ms-traffictypediagnostic: MN2PR12MB3469:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB34695AE7BB5F4BFDFE2B9543FB860@MN2PR12MB3469.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:56;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(199004)(189003)(316002)(256004)(2351001)(476003)(7736002)(386003)(66556008)(64756008)(66946007)(305945005)(66476007)(478600001)(6486002)(86362001)(76176011)(5640700003)(2906002)(6436002)(52116002)(5660300002)(8936002)(26005)(54906003)(81156014)(11346002)(50226002)(486006)(8676002)(81166006)(66446008)(6506007)(102836004)(66066001)(71200400001)(6916009)(71190400001)(99286004)(3846002)(2616005)(446003)(4326008)(2501003)(6116002)(186003)(36756003)(14454004)(6512007)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3469;
 H:MN2PR12MB3536.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UMFybIzlhiywTq3vMJESIvU1Dx+OtVejWH7WEVNte5W5w2U5ryI2emK9oFE/xWg7zoqygi4EZG4qCXJ93kD347gf3vUui0c8Q3etiJGc61PImTTEM0XTGyi7UDQheZCZyTK242Ut3PnBGlLKkZgLiQeF3D5XVgf3jTBxBve/UlaKnD8QvucqjY58UvocH8tJaiUYM2H8lCo6WrUaN/zUqwy8s4PsrcitA6oo+T/RgQBtX77vkc47xVyVzVDQigFwOwNtoGghFyezSvl7BNH7Inwq0raCHexueAkNyWVGfgLCNjctdhe2WQhPrIHJJcREqgC7BYlnnEzmzMMH8mcs0lX6pG3ln8huoiB8/Jyp4VejGzEZp1nRs6FJLIpRGoplrQDa/xOU0KVmfycUwl3uvOHrnSlvI7Vld7HALqBpu9A=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51add1be-5506-40bc-e39c-08d74234a314
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 03:50:14.0450 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BG8R+ucFqWqkOtczBcZlerrhG7S+VdtXKjiXYVNDrAKW2RZRptVSylLX0q8AncV4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3469
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7GxX0rTFFV13sf+GjKFfBMegDL3SrfkxGIiS5euMVA=;
 b=kZlTHaZf3/JecfVJVu+SJ2vB1KEq2ITrK205OOyG30a1Zb1rHrJfh9eU417BLngrFfIGVreEqSum7pkK8ZpDPchsDtfi8/lJjzS9MO+8hL98u0SbIsyTkZQMMJNq01HN/vKmcSXatzZzh9Dba8p/3tP7iAFvl1iU3Y1OXdAx5S4=
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

QWRkIHNldF9wb3dlcl9wcm9maWxlX21vZGUoKSBmb3Igbm9uZSBtYW51YWwgZHBtIGxldmVsIGNh
c2Ugc2V0dGluZyBwb3dlciBwcm9maWxlIG1vZGUuCgpTaWduZWQtb2ZmLWJ5OiBQcmlrZSBMaWFu
ZyA8UHJpa2UuTGlhbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9yZW5vaXJfcHB0LmMgfCAzMCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvcmVub2lyX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvcmVub2lyX3BwdC5jCmluZGV4IDRmMmI3NTAuLjE1MWQ3OGUgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Jlbm9pcl9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0LmMKQEAgLTQ4Miw2ICs0ODIsMzUgQEAgc3RhdGlj
IGludCByZW5vaXJfZm9yY2VfY2xrX2xldmVscyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIAly
ZXR1cm4gcmV0OwogfQogCitzdGF0aWMgaW50IHJlbm9pcl9zZXRfcG93ZXJfcHJvZmlsZV9tb2Rl
KHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBsb25nICppbnB1dCwgdWludDMyX3Qgc2l6ZSkKK3sK
KwlpbnQgd29ya2xvYWRfdHlwZSwgcmV0OworCisJc211LT5wb3dlcl9wcm9maWxlX21vZGUgPSBp
bnB1dFtzaXplXTsKKworCWlmIChzbXUtPnBvd2VyX3Byb2ZpbGVfbW9kZSA+IFBQX1NNQ19QT1dF
Ul9QUk9GSUxFX0NVU1RPTSkgeworCQlwcl9lcnIoIkludmFsaWQgcG93ZXIgcHJvZmlsZSBtb2Rl
ICVkXG4iLCBzbXUtPnBvd2VyX3Byb2ZpbGVfbW9kZSk7CisJCXJldHVybiAtRUlOVkFMOworCX0K
KworCS8qIGNvbnYgUFBfU01DX1BPV0VSX1BST0ZJTEUqIHRvIFdPUktMT0FEX1BQTElCXypfQklU
ICovCisJd29ya2xvYWRfdHlwZSA9IHNtdV93b3JrbG9hZF9nZXRfdHlwZShzbXUsIHNtdS0+cG93
ZXJfcHJvZmlsZV9tb2RlKTsKKwlpZiAod29ya2xvYWRfdHlwZSA8IDApIHsKKwkJcHJfZXJyKCJV
bnN1cHBvcnRlZCBwb3dlciBwcm9maWxlIG1vZGUgJWQgb24gUkVOT0lSXG4iLHNtdS0+cG93ZXJf
cHJvZmlsZV9tb2RlKTsKKwkJcmV0dXJuIC1FSU5WQUw7CisJfQorCisJcmV0ID0gc211X3NlbmRf
c21jX21zZ193aXRoX3BhcmFtKHNtdSwgU01VX01TR19TZXRXb3JrbG9hZE1hc2ssCisJCQkJICAg
IDEgPDwgd29ya2xvYWRfdHlwZSk7CisJaWYgKHJldCkgeworCQlwcl9lcnIoIkZhaWwgdG8gc2V0
IHdvcmtsb2FkIHR5cGUgJWRcbiIsIHdvcmtsb2FkX3R5cGUpOworCQlyZXR1cm4gcmV0OworCX0K
KworCXJldHVybiAwOworfQorCisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHB0YWJsZV9mdW5jcyBy
ZW5vaXJfcHB0X2Z1bmNzID0gewogCS5nZXRfc211X21zZ19pbmRleCA9IHJlbm9pcl9nZXRfc211
X21zZ19pbmRleCwKIAkuZ2V0X3NtdV90YWJsZV9pbmRleCA9IHJlbm9pcl9nZXRfc211X3RhYmxl
X2luZGV4LApAQCAtNDk2LDYgKzUyNSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHB0YWJsZV9m
dW5jcyByZW5vaXJfcHB0X2Z1bmNzID0gewogCS5nZXRfd29ya2xvYWRfdHlwZSA9IHJlbm9pcl9n
ZXRfd29ya2xvYWRfdHlwZSwKIAkuZ2V0X3Byb2ZpbGluZ19jbGtfbWFzayA9IHJlbm9pcl9nZXRf
cHJvZmlsaW5nX2Nsa19tYXNrLAogCS5mb3JjZV9jbGtfbGV2ZWxzID0gcmVub2lyX2ZvcmNlX2Ns
a19sZXZlbHMsCisJLnNldF9wb3dlcl9wcm9maWxlX21vZGUgPSByZW5vaXJfc2V0X3Bvd2VyX3By
b2ZpbGVfbW9kZSwKIH07CiAKIHZvaWQgcmVub2lyX3NldF9wcHRfZnVuY3Moc3RydWN0IHNtdV9j
b250ZXh0ICpzbXUpCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
