Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CED35AFBD9
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Sep 2019 13:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 407C06EAA8;
	Wed, 11 Sep 2019 11:50:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790057.outbound.protection.outlook.com [40.107.79.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5136D6EAA9
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Sep 2019 11:50:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j38rAVhVirNOy2u2RxA8Ht/gQfdGNL9Un/M8mK03qBwP6z1uUH3SW5rkoZj49tmMDy1obP0477OLAW4joMgftuuDu+/gN/xtC9gZiCyModgcSklNOKkNQ3lWgHftynBLNGsUxERjafJZJYR7xnbHYJEalf7LOmbV9q0XMILi3ZQOd8T6vldtFe00HSs7lenCU9X2m1yXR+neGAD2GoybjYe+l7J+Mu0vz00zX7hQys3PHL4t7qqDsVrlMKIE+X8mQ4cR0VXQ4n//DMlfb4WWIFy7WQbLUevoGIQ4xdWyz9VMN+gp4B9aL20LGFYjRNNuGN0qqXyPc2o3c4WitvQiqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jEv+eHLPNLuffnTWpWcp1iTt1Q3Rf1OpraPJzZz3I1E=;
 b=P62g6Ech+twSMEAW6VX9QL5fz+9/KulD2zS3ytsl2vvozLCyX4ZAYA8s+JuPrrPROvCx3LRdgPmcQntIxHgmTnU8I62cYD0/daLRkkqr4+k7EunHth0we/a3RIPhBVHU+7m2L7PNm9Ro2F2Yg3rbRYPYdr99MqmdAtNd0vIzYfLWrau5ZRgkeUdgyGgCvBMEEs3rytfVLqWaBw2dbeDLC/cLwrC8z3xTPvAml+8DIn4S0J+pgzqsnsGQrrylhF5UKVlLrCvPMxRB1gnhvyWkhah75kLJ8dhmyO0CQqc139lUqNyg/LVppv8buhvvQTVKIf7EHRqABqaSXqGG7USovQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB4224.namprd12.prod.outlook.com (52.135.51.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Wed, 11 Sep 2019 11:50:25 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed%6]) with mapi id 15.20.2241.018; Wed, 11 Sep 2019
 11:50:25 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amd/powerplay: properly set mp1 state for SW SMU
 suspend/reset routine
Thread-Topic: [PATCH 1/2] drm/amd/powerplay: properly set mp1 state for SW SMU
 suspend/reset routine
Thread-Index: AQHVaJcZpHOVIGBkxEmaipNKKu4kbA==
Date: Wed, 11 Sep 2019 11:50:24 +0000
Message-ID: <20190911115001.13864-1-evan.quan@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0149.apcprd02.prod.outlook.com
 (2603:1096:202:16::33) To MN2PR12MB3344.namprd12.prod.outlook.com
 (2603:10b6:208:c5::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a593edfe-30c5-48ea-6fa7-08d736ae3b66
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4224; 
x-ms-traffictypediagnostic: MN2PR12MB4224:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4224CBBDD4799D4FAF87495FE4B10@MN2PR12MB4224.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(136003)(366004)(39860400002)(189003)(199004)(3846002)(5660300002)(66556008)(476003)(6512007)(71200400001)(6486002)(7736002)(2501003)(15650500001)(486006)(1076003)(305945005)(66446008)(6506007)(71190400001)(52116002)(2351001)(14454004)(2906002)(99286004)(26005)(478600001)(14444005)(102836004)(25786009)(256004)(186003)(50226002)(2616005)(386003)(6916009)(5640700003)(6116002)(8676002)(316002)(8936002)(86362001)(66066001)(36756003)(81156014)(81166006)(53936002)(4326008)(54906003)(6436002)(66476007)(66946007)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4224;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WmHrDvETHFVG20CERmQPq5IcZ1iZkFACqD52WA4O52W7NuCLI029JH0AiIE5qURh9UuAwujR9qzoT8cc2BA3JBvzgJ/U9iwSZltL71QlRxFdalCFN0IfIj8OxA7pk3qVK/mqMyhj+1lj4vKRgRNQHwlc4VxH+nTeZLIkBaIhGD+bw6I0+X1qcS/x3DfzrXObF2AgiYqzI7XjXs/WXHvTpCpWITCYiIbjzazCjlQrTzX0lVFDjfc4bWVZAtjKazuVck7UcR8TYh5P3mLqUrt+voMLrQaQe3Ism1CojrISlUs1b8FJ244diVO6izs48VehZI57S9bWl/Olf0Cz28Pg1bgFXGBC+aROy7h5/8XMVtEvhJT1C7R/OMvuqNUe81z3fsIb8av1rDr2y7GMOGTpcXn40h8gC8ZX+2Y9T35PZHg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a593edfe-30c5-48ea-6fa7-08d736ae3b66
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 11:50:25.0189 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f6PM/vLBiMFuWSKiArAwBWpbOOEbkOfk+IvCenK4gWkKoWUZOQ1Pp5upks7Wkegn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4224
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jEv+eHLPNLuffnTWpWcp1iTt1Q3Rf1OpraPJzZz3I1E=;
 b=nYDxDmYr4TJ+H57PW5CvfYjBYLT2V6cYQj0kuceNJ5hS2TxvB67HUKsSIbN+tzR07J3XNz8BG6eKLAWUvU78PdrWuHKc5anmOXw1xcLmhcsGk2yPydwKLrDGCIFnIDL6yePsr7u0jPftxgdlv3rBddGaPs9DqenLAQx8RDB6x9k=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Ma, Le" <Le.Ma@amd.com>,
 "Quan, Evan" <Evan.Quan@amd.com>, "Gui, Jack" <Jack.Gui@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2V0IG1wMSBzdGF0ZSBwcm9wZXJseSBmb3IgU1cgU01VIHN1c3BlbmQvcmVzZXQgcm91dGluZS4K
CkNoYW5nZS1JZDogSTQ1OGQwOWU3OWJiYTI2MTNiYjg1MDk5OTM4NjQ4NzgyZmY5MWI5N2EKU2ln
bmVkLW9mZi1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgICAgfCAxMCArKy0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jICAgIHwgNDAgKysrKysrKysrKysrKysr
KysrKwogLi4uL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oICAgIHwgIDIg
KwogMyBmaWxlcyBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwppbmRleCBjODY5N2I1ZWYx
ZDAuLjVmZTUzOWY4MDAwOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
ZXZpY2UuYwpAQCAtMjIxNywxNiArMjIxNywxNiBAQCBzdGF0aWMgaW50IGFtZGdwdV9kZXZpY2Vf
aXBfc3VzcGVuZF9waGFzZTIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCS8qIGhhbmRs
ZSBwdXR0aW5nIHRoZSBTTUMgaW4gdGhlIGFwcHJvcHJpYXRlIHN0YXRlICovCiAJCWlmIChhZGV2
LT5pcF9ibG9ja3NbaV0udmVyc2lvbi0+dHlwZSA9PSBBTURfSVBfQkxPQ0tfVFlQRV9TTUMpIHsK
IAkJCWlmIChpc19zdXBwb3J0X3N3X3NtdShhZGV2KSkgewotCQkJCS8qIHRvZG8gKi8KKwkJCQly
ID0gc211X3NldF9tcDFfc3RhdGUoJmFkZXYtPnNtdSwgYWRldi0+bXAxX3N0YXRlKTsKIAkJCX0g
ZWxzZSBpZiAoYWRldi0+cG93ZXJwbGF5LnBwX2Z1bmNzICYmCiAJCQkJICAgYWRldi0+cG93ZXJw
bGF5LnBwX2Z1bmNzLT5zZXRfbXAxX3N0YXRlKSB7CiAJCQkJciA9IGFkZXYtPnBvd2VycGxheS5w
cF9mdW5jcy0+c2V0X21wMV9zdGF0ZSgKIAkJCQkJYWRldi0+cG93ZXJwbGF5LnBwX2hhbmRsZSwK
IAkJCQkJYWRldi0+bXAxX3N0YXRlKTsKLQkJCQlpZiAocikgewotCQkJCQlEUk1fRVJST1IoIlNN
QyBmYWlsZWQgdG8gc2V0IG1wMSBzdGF0ZSAlZCwgJWRcbiIsCi0JCQkJCQkgIGFkZXYtPm1wMV9z
dGF0ZSwgcik7Ci0JCQkJfQorCQkJfQorCQkJaWYgKHIpIHsKKwkJCQlEUk1fRVJST1IoIlNNQyBm
YWlsZWQgdG8gc2V0IG1wMSBzdGF0ZSAlZCwgJWRcbiIsCisJCQkJCSAgYWRldi0+bXAxX3N0YXRl
LCByKTsKIAkJCX0KIAkJfQogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9hbWRncHVfc211LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVf
c211LmMKaW5kZXggZjEzZTEzNGJlNDJlLi4yNWYzYzllMWI0MDQgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKQEAgLTE3OTYsNiArMTc5Niw0NiBAQCBpbnQg
c211X2ZvcmNlX2Nsa19sZXZlbHMoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCiAJcmV0dXJuIHJl
dDsKIH0KIAoraW50IHNtdV9zZXRfbXAxX3N0YXRlKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAor
CQkgICAgICBlbnVtIHBwX21wMV9zdGF0ZSBtcDFfc3RhdGUpCit7CisJdWludDE2X3QgbXNnOwor
CWludCByZXQ7CisKKwkvKgorCSAqIFRoZSBTTUMgaXMgbm90IGZ1bGx5IHJlYWR5LiBUaGF0IG1h
eSBiZQorCSAqIGV4cGVjdGVkIGFzIHRoZSBJUCBtYXkgYmUgbWFza2VkLgorCSAqIFNvLCBqdXN0
IHJldHVybiB3aXRob3V0IGVycm9yLgorCSAqLworCWlmICghc211LT5wbV9lbmFibGVkKQorCQly
ZXR1cm4gMDsKKworCXN3aXRjaCAobXAxX3N0YXRlKSB7CisJY2FzZSBQUF9NUDFfU1RBVEVfU0hV
VERPV046CisJCW1zZyA9IFNNVV9NU0dfUHJlcGFyZU1wMUZvclNodXRkb3duOworCQlicmVhazsK
KwljYXNlIFBQX01QMV9TVEFURV9VTkxPQUQ6CisJCW1zZyA9IFNNVV9NU0dfUHJlcGFyZU1wMUZv
clVubG9hZDsKKwkJYnJlYWs7CisJY2FzZSBQUF9NUDFfU1RBVEVfUkVTRVQ6CisJCW1zZyA9IFNN
VV9NU0dfUHJlcGFyZU1wMUZvclJlc2V0OworCQlicmVhazsKKwljYXNlIFBQX01QMV9TVEFURV9O
T05FOgorCWRlZmF1bHQ6CisJCXJldHVybiAwOworCX0KKworCS8qIHNvbWUgYXNpY3MgbWF5IG5v
dCBzdXBwb3J0IHRob3NlIG1lc3NhZ2VzICovCisJaWYgKHNtdV9tc2dfZ2V0X2luZGV4KHNtdSwg
bXNnKSA8IDApCisJCXJldHVybiAwOworCisJcmV0ID0gc211X3NlbmRfc21jX21zZyhzbXUsIG1z
Zyk7CisJaWYgKHJldCkKKwkJcHJfZXJyKCJbUHJlcGFyZU1wMV0gRmFpbGVkIVxuIik7CisKKwly
ZXR1cm4gcmV0OworfQorCiBjb25zdCBzdHJ1Y3QgYW1kX2lwX2Z1bmNzIHNtdV9pcF9mdW5jcyA9
IHsKIAkubmFtZSA9ICJzbXUiLAogCS5lYXJseV9pbml0ID0gc211X2Vhcmx5X2luaXQsCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaAppbmRleCAzZGU4
OGQwODQ2MTUuLjE2ZGYwOWJlNmE5ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9pbmMvYW1kZ3B1X3NtdS5oCkBAIC05MDMsNSArOTAzLDcgQEAgaW50IHNtdV9zeXNfc2V0
X3BwX2ZlYXR1cmVfbWFzayhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgdWludDY0X3QgbmV3X21h
c2spOwogaW50IHNtdV9mb3JjZV9jbGtfbGV2ZWxzKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAog
CQkJIGVudW0gc211X2Nsa190eXBlIGNsa190eXBlLAogCQkJIHVpbnQzMl90IG1hc2spOworaW50
IHNtdV9zZXRfbXAxX3N0YXRlKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAorCQkgICAgICBlbnVt
IHBwX21wMV9zdGF0ZSBtcDFfc3RhdGUpOwogCiAjZW5kaWYKLS0gCjIuMjMuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
