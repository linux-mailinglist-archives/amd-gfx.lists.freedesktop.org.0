Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE0C8F31B
	for <lists+amd-gfx@lfdr.de>; Thu, 15 Aug 2019 20:19:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522C389F4F;
	Thu, 15 Aug 2019 18:19:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800088.outbound.protection.outlook.com [40.107.80.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CFB289F4F
 for <amd-gfx@lists.freedesktop.org>; Thu, 15 Aug 2019 18:19:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WaN92I5xG75crTyQDlIeelP53JkmuNJSqqA5Raz+zfnCRWL+K7qObxBiaZuLk0HDz3xsIcqTmnQFolDRj0IpC/2LJbBPq/+9LxfOTT/jD/Eyk4vr4qTsBlieArc8OC7rNZpVj1nfF0CdI72/aEXT9KwJMa85Vvgv4mydjA6xyepBR6DpLvjMfUPl1t2XFYsp7wt7hpye5plBgtUenTceg744rEKdMn2j+igYKHbsPWtx6LSnlItWbTqjYklgmWXLc1op6MfwY5vAptbUpKzwHEmo838LakOy5bmD74cCjh4xs9k381+JejP7etxe1csZatWdY1rkEG34dm3ii1EwUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ZHaKyH5OAUYAwQad1g1Y4KLCN2JP/hTvhROI5YLCkk=;
 b=dxhytC5AW5udz1sOTVWuurgMbvf+RWIHoSGuWNMTxfyo8g4B+mZjKkV+5DxuW+Ie5hHlSXmKT4jMoBPHNMlg0t/YOKYKT9vZayQmmAVhkp7W/q+BaSwcm838wXs3m92VnfiQdb8FGNbbyGjr0m9ovNmrSvffuM9iy9vC//4ow0KyFu2C9A6zAqHGSETMfWnRVlwrxQYPBhbaDO0xUF3trGm/zO3048nTDz/+Q4CNFh7YM/l3FNn/EGsDkvqmpcNFRwViwRL0/62HPVo5eD79bPuJglzRcrYohCnHl5HbBkFbK/kWFEFnKldFQlFEqqvPQGfBxKEs9QDGLyoLy6XrGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR1201MB0178.namprd12.prod.outlook.com (10.174.114.148) by
 BN6PR1201MB0003.namprd12.prod.outlook.com (10.172.111.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Thu, 15 Aug 2019 18:19:48 +0000
Received: from BN6PR1201MB0178.namprd12.prod.outlook.com
 ([fe80::e14e:201c:e206:9346]) by BN6PR1201MB0178.namprd12.prod.outlook.com
 ([fe80::e14e:201c:e206:9346%7]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 18:19:48 +0000
From: "Thai, Thong" <Thong.Thai@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] Revert "drm/amdgpu: use direct loading on renoir vcn for
 the moment"
Thread-Topic: [PATCH 1/2] Revert "drm/amdgpu: use direct loading on renoir vcn
 for the moment"
Thread-Index: AQHVU5YFIc6l9g5xeECfJNK23Sws5A==
Date: Thu, 15 Aug 2019 18:19:48 +0000
Message-ID: <20190815181940.4897-1-thong.thai@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0018.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::31) To BN6PR1201MB0178.namprd12.prod.outlook.com
 (2603:10b6:405:55::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4742ebe8-00bd-4f77-cd9c-08d721ad2813
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR1201MB0003; 
x-ms-traffictypediagnostic: BN6PR1201MB0003:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR1201MB00037A154107DCDB016E17979DAC0@BN6PR1201MB0003.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:243;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(366004)(39860400002)(396003)(376002)(199004)(189003)(6116002)(71200400001)(8676002)(2906002)(1076003)(99286004)(50226002)(7736002)(2501003)(305945005)(316002)(8936002)(256004)(86362001)(71190400001)(36756003)(2616005)(66066001)(81166006)(4326008)(26005)(386003)(5660300002)(476003)(2351001)(3846002)(81156014)(186003)(6916009)(102836004)(14454004)(478600001)(66476007)(6506007)(66446008)(6436002)(66946007)(6486002)(25786009)(5640700003)(486006)(6512007)(52116002)(53936002)(66556008)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0003;
 H:BN6PR1201MB0178.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NOLFJ5bc/p8brzCNQjCeJpt9MB7eXScvDAg0nFdpoRtTGKQnnKSkfz87pVWB8KyvNrmqckFyxThyeiyreQCj7LEQvwe9377jIpXa70ogRWSgCY5IqBGuH8ejoaJdB16L0P7toSHoeqDPjqTiL5n9mxmRoVgALWbY5IfvfzzU3xdmSa6IbcWbOgIYvc4ffHhtO+VfQTkbx4eRvJnVz3uSkIhVabnpP3zRwbcWD7sn/ejJ84ezdNUWfM41oH0FnbsMPIiqsXjlibyKk2O77wK5U/bVkf5AkNp9x9sBt1sf1PzzzmcF/SBS120FA55xT4JwoA19YUSH+pNwdnYT0OBWYCRkFHTF/X0rumoi0l+F1+vYf+zGTyZJU6qHqm4VfWJZiYyH4u8FO+pYEQCOw9czyQnTNrVtSmnPKwXHDWsdgXg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4742ebe8-00bd-4f77-cd9c-08d721ad2813
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 18:19:48.3249 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PLOtB5o+JEEZbQpfzhBzAfpxLFe95Gjln6EgUC8KtC0nCA56K3YpN2LOmNe2Dg8ME7j/U/oKVl0Ene52cDPeVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0003
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ZHaKyH5OAUYAwQad1g1Y4KLCN2JP/hTvhROI5YLCkk=;
 b=28onWNqNplkhoM9FbE+ZPQuojxgk9MEhPlH/fBSNWhdRVh3l+oo3j0zjBUWg/opdctEJkThjE8u9V6pTMEHQ63kBjN1ISXXclkJCH/uLOa+qKIe7O1ZxCba4gBhzyPV9IKez+ALz1Z5UiLMeXHKOX4Rj5cOetmWNKYrv7Hd5agQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Thong.Thai@amd.com; 
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
Cc: "Thai, Thong" <Thong.Thai@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyByZXZlcnRzIGNvbW1pdCA2OWZjZDczNDdmNmZiMTFlZGM3ZWFlYTdjN2I5Y2ZmMDA0NGNl
MTdlLgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYyB8IDkgKysr
LS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jICAgfCA5ICsrKy0t
LS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYwppbmRleCA4YjQzYzViMjFhZTku
LjM1YTBhMTM5NmJlNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3Zjbi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYwpA
QCAtODQsOCArODQsNyBAQCBpbnQgYW1kZ3B1X3Zjbl9zd19pbml0KHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2KQogCWNhc2UgQ0hJUF9SRU5PSVI6CiAJCWZ3X25hbWUgPSBGSVJNV0FSRV9SRU5P
SVI7CiAJCWlmICgoYWRldi0+ZmlybXdhcmUubG9hZF90eXBlID09IEFNREdQVV9GV19MT0FEX1BT
UCkgJiYKLQkJICAgIChhZGV2LT5wZ19mbGFncyAmIEFNRF9QR19TVVBQT1JUX1ZDTl9EUEcpICYm
Ci0JCSAgICBhZGV2LT5hc2ljX3R5cGUgIT0gQ0hJUF9SRU5PSVIpIC8qIHRvIGJlIHJlbW92ZWQg
d2hpbGUgdmNuIHBzcCBsb2FkaW5nIHdvcmtzICovCisJCSAgICAoYWRldi0+cGdfZmxhZ3MgJiBB
TURfUEdfU1VQUE9SVF9WQ05fRFBHKSkKIAkJCWFkZXYtPnZjbi5pbmRpcmVjdF9zcmFtID0gdHJ1
ZTsKIAkJYnJlYWs7CiAJZGVmYXVsdDoKQEAgLTEzOSw4ICsxMzgsNyBAQCBpbnQgYW1kZ3B1X3Zj
bl9zd19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCX0KIAogCWJvX3NpemUgPSBB
TURHUFVfVkNOX1NUQUNLX1NJWkUgKyBBTURHUFVfVkNOX0NPTlRFWFRfU0laRTsKLQlpZiAoYWRl
di0+ZmlybXdhcmUubG9hZF90eXBlICE9IEFNREdQVV9GV19MT0FEX1BTUCB8fAotCSAgICBhZGV2
LT5hc2ljX3R5cGUgPT0gQ0hJUF9SRU5PSVIpCisJaWYgKGFkZXYtPmZpcm13YXJlLmxvYWRfdHlw
ZSAhPSBBTURHUFVfRldfTE9BRF9QU1ApCiAJCWJvX3NpemUgKz0gQU1ER1BVX0dQVV9QQUdFX0FM
SUdOKGxlMzJfdG9fY3B1KGhkci0+dWNvZGVfc2l6ZV9ieXRlcykgKyA4KTsKIAlyID0gYW1kZ3B1
X2JvX2NyZWF0ZV9rZXJuZWwoYWRldiwgYm9fc2l6ZSwgUEFHRV9TSVpFLAogCQkJCSAgICBBTURH
UFVfR0VNX0RPTUFJTl9WUkFNLCAmYWRldi0+dmNuLnZjcHVfYm8sCkBAIC0yMzMsOCArMjMxLDcg
QEAgaW50IGFtZGdwdV92Y25fcmVzdW1lKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQl1
bnNpZ25lZCBvZmZzZXQ7CiAKIAkJaGRyID0gKGNvbnN0IHN0cnVjdCBjb21tb25fZmlybXdhcmVf
aGVhZGVyICopYWRldi0+dmNuLmZ3LT5kYXRhOwotCQlpZiAoYWRldi0+ZmlybXdhcmUubG9hZF90
eXBlICE9IEFNREdQVV9GV19MT0FEX1BTUCB8fAotCQkgICAgYWRldi0+YXNpY190eXBlID09IENI
SVBfUkVOT0lSKSB7CisJCWlmIChhZGV2LT5maXJtd2FyZS5sb2FkX3R5cGUgIT0gQU1ER1BVX0ZX
X0xPQURfUFNQKSB7CiAJCQlvZmZzZXQgPSBsZTMyX3RvX2NwdShoZHItPnVjb2RlX2FycmF5X29m
ZnNldF9ieXRlcyk7CiAJCQltZW1jcHlfdG9pbyhhZGV2LT52Y24uY3B1X2FkZHIsIGFkZXYtPnZj
bi5mdy0+ZGF0YSArIG9mZnNldCwKIAkJCQkgICAgbGUzMl90b19jcHUoaGRyLT51Y29kZV9zaXpl
X2J5dGVzKSk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJf
MC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYwppbmRleCA4NGFhNzc0
NzA4MDIuLmIxMmM1ZTU3ZjE4YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvdmNuX3YyXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5j
CkBAIC0xNDIsOCArMTQyLDcgQEAgc3RhdGljIGludCB2Y25fdjJfMF9zd19pbml0KHZvaWQgKmhh
bmRsZSkKIAlpZiAocikKIAkJcmV0dXJuIHI7CiAKLQlpZiAoYWRldi0+ZmlybXdhcmUubG9hZF90
eXBlID09IEFNREdQVV9GV19MT0FEX1BTUCAmJgotCSAgICBhZGV2LT5hc2ljX3R5cGUgIT0gQ0hJ
UF9SRU5PSVIpIHsKKwlpZiAoYWRldi0+ZmlybXdhcmUubG9hZF90eXBlID09IEFNREdQVV9GV19M
T0FEX1BTUCkgewogCQljb25zdCBzdHJ1Y3QgY29tbW9uX2Zpcm13YXJlX2hlYWRlciAqaGRyOwog
CQloZHIgPSAoY29uc3Qgc3RydWN0IGNvbW1vbl9maXJtd2FyZV9oZWFkZXIgKilhZGV2LT52Y24u
ZnctPmRhdGE7CiAJCWFkZXYtPmZpcm13YXJlLnVjb2RlW0FNREdQVV9VQ09ERV9JRF9WQ05dLnVj
b2RlX2lkID0gQU1ER1BVX1VDT0RFX0lEX1ZDTjsKQEAgLTM2MCw4ICszNTksNyBAQCBzdGF0aWMg
dm9pZCB2Y25fdjJfMF9tY19yZXN1bWUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJdWlu
dDMyX3Qgb2Zmc2V0OwogCiAJLyogY2FjaGUgd2luZG93IDA6IGZ3ICovCi0JaWYgKGFkZXYtPmZp
cm13YXJlLmxvYWRfdHlwZSA9PSBBTURHUFVfRldfTE9BRF9QU1AgJiYKLQkgICAgYWRldi0+YXNp
Y190eXBlICE9IENISVBfUkVOT0lSKSB7CisJaWYgKGFkZXYtPmZpcm13YXJlLmxvYWRfdHlwZSA9
PSBBTURHUFVfRldfTE9BRF9QU1ApIHsKIAkJV1JFRzMyX1NPQzE1KFVWRCwgMCwgbW1VVkRfTE1J
X1ZDUFVfQ0FDSEVfNjRCSVRfQkFSX0xPVywKIAkJCShhZGV2LT5maXJtd2FyZS51Y29kZVtBTURH
UFVfVUNPREVfSURfVkNOXS50bXJfbWNfYWRkcl9sbykpOwogCQlXUkVHMzJfU09DMTUoVVZELCAw
LCBtbVVWRF9MTUlfVkNQVV9DQUNIRV82NEJJVF9CQVJfSElHSCwKQEAgLTQwNiw4ICs0MDQsNyBA
QCBzdGF0aWMgdm9pZCB2Y25fdjJfMF9tY19yZXN1bWVfZHBnX21vZGUoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsIGJvb2wgaW5kaXJlYwogCXVpbnQzMl90IG9mZnNldDsKIAogCS8qIGNhY2hl
IHdpbmRvdyAwOiBmdyAqLwotCWlmIChhZGV2LT5maXJtd2FyZS5sb2FkX3R5cGUgPT0gQU1ER1BV
X0ZXX0xPQURfUFNQICYmCi0JICAgIGFkZXYtPmFzaWNfdHlwZSAhPSBDSElQX1JFTk9JUikgewor
CWlmIChhZGV2LT5maXJtd2FyZS5sb2FkX3R5cGUgPT0gQU1ER1BVX0ZXX0xPQURfUFNQKSB7CiAJ
CWlmICghaW5kaXJlY3QpIHsKIAkJCVdSRUczMl9TT0MxNV9EUEdfTU9ERV8yXzAoU09DMTVfRFBH
X01PREVfT0ZGU0VUXzJfMCgKIAkJCQlVVkQsIDAsIG1tVVZEX0xNSV9WQ1BVX0NBQ0hFXzY0QklU
X0JBUl9MT1cpLAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
