Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B18DDBFAEB
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 23:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0CC6EE10;
	Thu, 26 Sep 2019 21:27:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820053.outbound.protection.outlook.com [40.107.82.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E7626EE0E
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 21:27:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UBFMsdMqZNrsrjx3ew+zH7gy1I5noeH+0mdep+X+AL/19FF8d0O7os66R/L7HJLEHEycv1Il8lQXYX4DSQwSqhiQM0It6RKyoco1YTlENSIpZI1CU3XSHlU4U9CHWEdf7QKlmDk7LdTYsU+l87WNbroPgZKeEmGm7e/dFlvV0MrCrpYZlpKFAn/Gux698vcJiMAfOQFzYW+jEOyQzXgNXrut+wBqZTPvD3EXdXegJy4j1+uMUz7CY0HZhP31tS8oQSZ6jnnmaJcKmUj+xILYzVBflaHEFR+SXBXPw1IrSDijxKl1xpFyupz0KZo9M/R6GP/zRrPJTVNvIjHtIMYZbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6/77nvdV8ULrd3AqwaqZVg9A4d9Tf+azLRmJn4xoVg=;
 b=e7r5U4xW4K2stwx7/GO2cmJWeeDreKaIKgUEc/36A3Xa4ZA3jWsWjefknxoqOBbC1p39xp6Tykkjh0NjFe3Erc1S1WCI7RHtxqHLqwRTMEXHyVyg6YuVrXjFidZ8E4eoHW2tcBmmaoqet6lKjot4Ol67bc4po4asejvetargj84rtYI8HoUfyjzirEoJs1aW9pzQBldiVfLgD08HDvgY7rQ3SHaPn7KnRv8NkbcC6OyzeJXzXOTVB6VwBsXPezBF/cyL8KOprM0ADJXtSakvBfeFU6SmS09kWDJ5AAO445N+MKKXXuxIp9XA5IPXpCTV1RV6tUf8D0OmaCrihINf2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB3850.namprd12.prod.outlook.com (10.255.173.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Thu, 26 Sep 2019 21:27:14 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa%4]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 21:27:14 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdkfd: Record vmid pasid mapping in the driver for
 non HWS mode
Thread-Topic: [PATCH 1/2] drm/amdkfd: Record vmid pasid mapping in the driver
 for non HWS mode
Thread-Index: AQHVdLEqfaqrBCzjNUSyTJI1+qxGEQ==
Date: Thu, 26 Sep 2019 21:27:14 +0000
Message-ID: <20190926212640.28989-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::25) To DM6PR12MB2778.namprd12.prod.outlook.com
 (2603:10b6:5:50::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52f67792-fa88-4e1f-7f4e-08d742c84cab
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB3850; 
x-ms-traffictypediagnostic: DM6PR12MB3850:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3850A75C72357957BD2C7027F0860@DM6PR12MB3850.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(189003)(199004)(2906002)(6436002)(50226002)(6916009)(1076003)(99286004)(14454004)(316002)(66476007)(66066001)(3846002)(2501003)(71200400001)(86362001)(71190400001)(305945005)(7736002)(66946007)(478600001)(5640700003)(256004)(186003)(52116002)(6512007)(81156014)(66446008)(81166006)(486006)(2351001)(66556008)(2616005)(8676002)(476003)(102836004)(6506007)(6486002)(6116002)(8936002)(4326008)(386003)(26005)(64756008)(5660300002)(25786009)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3850;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Un9onrOO0T9BakrA4ghE9qbP5pqbnbyIXLTD7POVOnZke7s9hGHCZ401klTWdlIBJDdFF/k99r8gWvbPDLgy6T+9T+pyZqVFDkSsof97/JWc4lFgUksmISpCeUzxnwXIUZlShI0zgULVwqF1WcjfSbYHoSBqkgdSIRBB8O/2MIUFs17HFGYQo6JCLJZZGTqQkA4neyAjN0ZIPH1gwc0HgE+k1ak/+LhSL8dcOIY93XRWkedZtjq+r4GMhR8pcSfe71dMPaLrEcWqkyFaDkkLlwEACG6kvxZdx3SsB2VY4Tc5YRMnXPic6xvJUtrWawXmmgTux27qwrjIMneBmRps8AxfiPM3RFC74OIDZExcDG8LyRMlk5uKx+fWb2g8L/7kPm6Z5n6tFvzceEuuEraHu/j30PUGlegSGhU9CYXOPNo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52f67792-fa88-4e1f-7f4e-08d742c84cab
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 21:27:14.5483 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WZaAi0Arx94pfCP1ro168pGdsQruv5ju8b9Gpad5GS5nqtHgHgFpaOsZvgMSTMpb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3850
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6/77nvdV8ULrd3AqwaqZVg9A4d9Tf+azLRmJn4xoVg=;
 b=4f9zi4m1ew7tsbxHKaCJZcWCScm/zaP2oZRcbGaRJl9sJ0CDJRFhq80r6OR87NgW0Q93RarhIWSqGw9cMekmj43fclUF4gCx2hvEV49N08F2lNNg+ag1rR+4NkXjoDD5BhE68vZW5GtzPRJaLVRu4uk0sq6J97EBABB43WYChaA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yong.Zhao@amd.com; 
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
Cc: "Zhao, Yong" <Yong.Zhao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBtYWtlcyBwb3NzaWJsZSB0aGUgdm1pZCBwYXNpZCBtYXBwaW5nIHF1ZXJ5IHRocm91Z2gg
c29mdHdhcmUuCgpDaGFuZ2UtSWQ6IEliNTM5YWFlMjc3YTIyN2NjMzlmNjQ2OWFlMjNjNDZjNGQy
ODliODdiClNpZ25lZC1vZmYtYnk6IFlvbmcgWmhhbyA8WW9uZy5aaGFvQGFtZC5jb20+Ci0tLQog
Li4uL2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jIHwgMzMgKysrKysr
KysrKysrLS0tLS0tLQogLi4uL2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdl
ci5oIHwgIDMgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmggICAgICAg
ICB8ICAyICsrCiAzIGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2Vf
cXVldWVfbWFuYWdlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9x
dWV1ZV9tYW5hZ2VyLmMKaW5kZXggZTdmMGEzMmUwZTQ0Li40NTVmNDlhMjVjY2IgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdl
ci5jCkBAIC0yMjQsMjAgKzIyNCwzMCBAQCBzdGF0aWMgaW50IGFsbG9jYXRlX3ZtaWQoc3RydWN0
IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0sCiAJCQlzdHJ1Y3QgcWNtX3Byb2Nlc3NfZGV2aWNl
ICpxcGQsCiAJCQlzdHJ1Y3QgcXVldWUgKnEpCiB7Ci0JaW50IGJpdCwgYWxsb2NhdGVkX3ZtaWQ7
CisJaW50IGFsbG9jYXRlZF92bWlkID0gLTEsIGk7CiAKLQlpZiAoZHFtLT52bWlkX2JpdG1hcCA9
PSAwKQotCQlyZXR1cm4gLUVOT01FTTsKKwlmb3IgKGkgPSBkcW0tPmRldi0+dm1faW5mby5maXJz
dF92bWlkX2tmZDsKKwkJCWkgPD0gZHFtLT5kZXYtPnZtX2luZm8ubGFzdF92bWlkX2tmZDsgaSsr
KSB7CisJCWlmICghZHFtLT52bWlkX3Bhc2lkW2ldKSB7CisJCQlhbGxvY2F0ZWRfdm1pZCA9IGk7
CisJCQlicmVhazsKKwkJfQorCX0KKworCWlmIChhbGxvY2F0ZWRfdm1pZCA8IDApIHsKKwkJcHJf
ZXJyKCJubyBtb3JlIHZtaWQgdG8gYWxsb2NhdGVcbiIpOworCQlyZXR1cm4gLUVOT1NQQzsKKwl9
CisKKwlwcl9kZWJ1Zygidm1pZCBhbGxvY2F0ZWQ6ICVkXG4iLCBhbGxvY2F0ZWRfdm1pZCk7CisK
KwlkcW0tPnZtaWRfcGFzaWRbYWxsb2NhdGVkX3ZtaWRdID0gcS0+cHJvY2Vzcy0+cGFzaWQ7CiAK
LQliaXQgPSBmZnMoZHFtLT52bWlkX2JpdG1hcCkgLSAxOwotCWRxbS0+dm1pZF9iaXRtYXAgJj0g
figxIDw8IGJpdCk7CisJc2V0X3Bhc2lkX3ZtaWRfbWFwcGluZyhkcW0sIHEtPnByb2Nlc3MtPnBh
c2lkLCBhbGxvY2F0ZWRfdm1pZCk7CiAKLQlhbGxvY2F0ZWRfdm1pZCA9IGJpdCArIGRxbS0+ZGV2
LT52bV9pbmZvLmZpcnN0X3ZtaWRfa2ZkOwotCXByX2RlYnVnKCJ2bWlkIGFsbG9jYXRpb24gJWRc
biIsIGFsbG9jYXRlZF92bWlkKTsKIAlxcGQtPnZtaWQgPSBhbGxvY2F0ZWRfdm1pZDsKIAlxLT5w
cm9wZXJ0aWVzLnZtaWQgPSBhbGxvY2F0ZWRfdm1pZDsKIAotCXNldF9wYXNpZF92bWlkX21hcHBp
bmcoZHFtLCBxLT5wcm9jZXNzLT5wYXNpZCwgcS0+cHJvcGVydGllcy52bWlkKTsKIAlwcm9ncmFt
X3NoX21lbV9zZXR0aW5ncyhkcW0sIHFwZCk7CiAKIAkvKiBxcGQtPnBhZ2VfdGFibGVfYmFzZSBp
cyBzZXQgZWFybGllciB3aGVuIHJlZ2lzdGVyX3Byb2Nlc3MoKQpAQCAtMjc4LDggKzI4OCw2IEBA
IHN0YXRpYyB2b2lkIGRlYWxsb2NhdGVfdm1pZChzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIg
KmRxbSwKIAkJCQlzdHJ1Y3QgcWNtX3Byb2Nlc3NfZGV2aWNlICpxcGQsCiAJCQkJc3RydWN0IHF1
ZXVlICpxKQogewotCWludCBiaXQgPSBxcGQtPnZtaWQgLSBkcW0tPmRldi0+dm1faW5mby5maXJz
dF92bWlkX2tmZDsKLQogCS8qIE9uIEdGWCB2NywgQ1AgZG9lc24ndCBmbHVzaCBUQyBhdCBkZXF1
ZXVlICovCiAJaWYgKHEtPmRldmljZS0+ZGV2aWNlX2luZm8tPmFzaWNfZmFtaWx5ID09IENISVBf
SEFXQUlJKQogCQlpZiAoZmx1c2hfdGV4dHVyZV9jYWNoZV9ub2Nwc2NoKHEtPmRldmljZSwgcXBk
KSkKQEAgLTI4OSw4ICsyOTcsOCBAQCBzdGF0aWMgdm9pZCBkZWFsbG9jYXRlX3ZtaWQoc3RydWN0
IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0sCiAKIAkvKiBSZWxlYXNlIHRoZSB2bWlkIG1hcHBp
bmcgKi8KIAlzZXRfcGFzaWRfdm1pZF9tYXBwaW5nKGRxbSwgMCwgcXBkLT52bWlkKTsKKwlkcW0t
PnZtaWRfcGFzaWRbcXBkLT52bWlkXSA9IDA7CiAKLQlkcW0tPnZtaWRfYml0bWFwIHw9ICgxIDw8
IGJpdCk7CiAJcXBkLT52bWlkID0gMDsKIAlxLT5wcm9wZXJ0aWVzLnZtaWQgPSAwOwogfQpAQCAt
MTAxNyw3ICsxMDI1LDggQEAgc3RhdGljIGludCBpbml0aWFsaXplX25vY3BzY2goc3RydWN0IGRl
dmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0pCiAJCQkJZHFtLT5hbGxvY2F0ZWRfcXVldWVzW3BpcGVd
IHw9IDEgPDwgcXVldWU7CiAJfQogCi0JZHFtLT52bWlkX2JpdG1hcCA9ICgxIDw8IGRxbS0+ZGV2
LT52bV9pbmZvLnZtaWRfbnVtX2tmZCkgLSAxOworCW1lbXNldChkcW0tPnZtaWRfcGFzaWQsIDAs
IHNpemVvZihkcW0tPnZtaWRfcGFzaWQpKTsKKwogCWRxbS0+c2RtYV9iaXRtYXAgPSB+MFVMTCA+
PiAoNjQgLSBnZXRfbnVtX3NkbWFfcXVldWVzKGRxbSkpOwogCWRxbS0+eGdtaV9zZG1hX2JpdG1h
cCA9IH4wVUxMID4+ICg2NCAtIGdldF9udW1feGdtaV9zZG1hX3F1ZXVlcyhkcW0pKTsKIApkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5h
Z2VyLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFn
ZXIuaAppbmRleCBlZWQ4Zjk1MGI2NjMuLjk5YzhiMzYzMDFlZiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmgKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmgKQEAgLTE4
OCw3ICsxODgsOCBAQCBzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgewogCXVuc2lnbmVkIGlu
dAkJKmFsbG9jYXRlZF9xdWV1ZXM7CiAJdWludDY0X3QJCXNkbWFfYml0bWFwOwogCXVpbnQ2NF90
CQl4Z21pX3NkbWFfYml0bWFwOwotCXVuc2lnbmVkIGludAkJdm1pZF9iaXRtYXA7CisJLyogdGhl
IHBhc2lkIG1hcHBpbmcgZm9yIGVhY2gga2ZkIHZtaWQgKi8KKwl1aW50MTZfdAkJdm1pZF9wYXNp
ZFtWTUlEX05VTV07CiAJdWludDY0X3QJCXBpcGVsaW5lc19hZGRyOwogCXN0cnVjdCBrZmRfbWVt
X29iagkqcGlwZWxpbmVfbWVtOwogCXVpbnQ2NF90CQlmZW5jZV9ncHVfYWRkcjsKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmggYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oCmluZGV4IDBkMmM3ZmExZmE0Ni4uYTA4MDE1NzIwODQx
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmgKQEAgLTQzLDYgKzQzLDggQEAK
IAogI2luY2x1ZGUgImFtZF9zaGFyZWQuaCIKIAorI2RlZmluZSBWTUlEX05VTSAxNgorCiAjZGVm
aW5lIEtGRF9NQVhfUklOR19FTlRSWV9TSVpFCTgKIAogI2RlZmluZSBLRkRfU1lTRlNfRklMRV9N
T0RFIDA0NDQKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
