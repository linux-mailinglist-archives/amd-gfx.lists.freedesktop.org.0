Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEE0DBD3F
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Oct 2019 07:50:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2506F89CB3;
	Fri, 18 Oct 2019 05:50:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on0626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe45::626])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A72828919B
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Oct 2019 05:50:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AgcofGg7IepsmNVhZSMj40FIFE0oqou+WUpjz1xPWclHUl7oRZhEpH4SNlPoVlPbJqTjoyk5B3RhsHjWwN3LH2/Ht4R+ZvA6Gm9jMrgh/cEN2e7Q7x1rSfLNJTW3N+os7oJg5jsVwWfX+QhN+7x3zs+nTccMzWgw9kxqSq529e4B/xW3va8X3tJm2tPzYZpUS/eb7skVPGpTlCkA+w77YCDpnUI+5bBBScgRVtCrnC+dvYyadPpPc/3v1AryJoHE1CMaBvu4oNe3CqAJJL2ny3so15yThPkepg4SB7C8qmCV8a876X/E3QahgsJDPvHs1Iu0RqeAGoQD41D3yQevTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PIbkfAGri86RbnFBvf3dQHusiKxrw04xJ6v43MGobAs=;
 b=Z3R7Ldw/GTbueyMxmZdimBp5bhBhLS4tKP8HY/88RPB9+6mDVUxSa8Boa8ltJtcfGkFRwQzUlCr6+L5A1/xU2IvJHcf1fbC7fs7idU+QTKfArdz8Mw8cSChW71PP8bS1UT0VZh6bUUMkdQcsepqMEwdvM4/ZmBjtbl5RQXQ7FeXBEGSgESYT22AjX0MiqM2ppM7uYFOaLdjiNyCzu15TUativ2pfXMwRPWavSoSSKZrPVJDNYjLWV9ZqbsZwRBO3y0JrzhXs/9rNHDcSjL/1ur8PAY8vs15phHRpjedeBxv/ynW+AOOk6CuQxIbtGqGP0DF6EZEQqKAUKOVpKQDCAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3598.namprd12.prod.outlook.com (20.178.244.84) by
 MN2PR12MB2877.namprd12.prod.outlook.com (20.179.81.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Fri, 18 Oct 2019 05:50:21 +0000
Received: from MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::d003:9b5a:b346:b32b]) by MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::d003:9b5a:b346:b32b%7]) with mapi id 15.20.2347.023; Fri, 18 Oct 2019
 05:50:20 +0000
From: "Feng, Kenneth" <Kenneth.Feng@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: update Arcturus driver smu interface
 XGMI link part
Thread-Topic: [PATCH] drm/amd/powerplay: update Arcturus driver smu interface
 XGMI link part
Thread-Index: AQHVhXerhYh0kj5XZE+E0Zwtp0mBTKdf5NiQ
Date: Fri, 18 Oct 2019 05:50:20 +0000
Message-ID: <MN2PR12MB3598091DC15026C4989C3CD48E6C0@MN2PR12MB3598.namprd12.prod.outlook.com>
References: <20191018054812.25717-1-evan.quan@amd.com>
In-Reply-To: <20191018054812.25717-1-evan.quan@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: efec47a2-569f-49b4-6bfb-08d7538f0fec
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB2877:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2877ADC355EC2E69FE7F30938E6C0@MN2PR12MB2877.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:813;
x-forefront-prvs: 01949FE337
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(13464003)(189003)(199004)(2501003)(4326008)(2906002)(55016002)(52536014)(478600001)(66066001)(15650500001)(8676002)(966005)(86362001)(14454004)(256004)(71200400001)(71190400001)(14444005)(316002)(110136005)(5660300002)(446003)(11346002)(229853002)(99286004)(76116006)(476003)(486006)(66446008)(7696005)(6506007)(66946007)(64756008)(66556008)(66476007)(76176011)(6436002)(8936002)(7736002)(305945005)(81166006)(81156014)(6246003)(6306002)(9686003)(26005)(25786009)(186003)(53546011)(33656002)(102836004)(3846002)(74316002)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2877;
 H:MN2PR12MB3598.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sG9FOwrs8et1cSkcaZRKMMGC+RcxW0tvCqctnGlhu4ElZ6OJFtItg5g9fKLBJxp5o8KA414bV3kd2r+ow/V/Wb9XciqHmDzhE9zkP9wzO/c8m1/LF1sqZZOE+6SnNtVyEPdsVO0GF2zHrijR3FO6tCt5B68/jlRHPpBroWrj+wzVmumKLTbXV7YohaBZ9vWFGYP9K+HWoY5SjLVx+Rk+aexsy3XbxEspYBdH3bjUSB2b+Pr/2Oio1AkhTaiRiXtxQkWwiPB78C2tAlDJIZKH5mbFOddcBjx9vV/hV0rFlIw3N4rCl9Z1dXoJQrjQpvOTGoMaUPrvz7OOme36iShelYgVERWCTUzAuGUbuZxWYFnBHqbWs0DCPtJoJ0CMtiHBqsYrS6EzfjIY0DUjUjZsQpsaBPKo6LulpYzu9dMdFvavdoejdatT7GT47dGzT/uX08yiZUc9uka2P/Jv3ToBmw==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efec47a2-569f-49b4-6bfb-08d7538f0fec
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2019 05:50:20.8295 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hmUT/pXMewCS5s6/Dx983hURB/XQakbHs8yYxUMOzh98M2V676RPNfjsI101VmJc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2877
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PIbkfAGri86RbnFBvf3dQHusiKxrw04xJ6v43MGobAs=;
 b=iGzAvpyJvzvXBTSzO580/RGAQ0ZyuI7kQgv/ucAMq2nAZx7zxw6BtGr51iVGNLjuzQHlnQ4rD4bDg3qQ6I+l8dNa+k02KHJQtdNHNbs58nTMxsSa1oKr2CaF3OvQbPDRPUlcE7sYPyjtIPKqKXb8LW8F8jBl1aHt3jTWo1ZyAhI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kenneth.Feng@amd.com; 
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
Cc: "Quan, Evan" <Evan.Quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEtlbm5ldGggRmVuZyA8a2VubmV0aC5mZW5nQGFtZC5jb20+DQoNCg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFtZC1nZnggW21haWx0bzphbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnXSBPbiBCZWhhbGYgT2YgUXVhbiwgRXZhbg0KU2Vu
dDogRnJpZGF5LCBPY3RvYmVyIDE4LCAyMDE5IDE6NDkgUE0NClRvOiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KQ2M6IFF1YW4sIEV2YW4gPEV2YW4uUXVhbkBhbWQuY29tPg0KU3ViamVj
dDogW1BBVENIXSBkcm0vYW1kL3Bvd2VycGxheTogdXBkYXRlIEFyY3R1cnVzIGRyaXZlciBzbXUg
aW50ZXJmYWNlIFhHTUkgbGluayBwYXJ0DQoNCltDQVVUSU9OOiBFeHRlcm5hbCBFbWFpbF0NCg0K
VG8gZml0IHRoZSBsYXRlc3QgU01VIGZpcm13YXJlLg0KDQpDaGFuZ2UtSWQ6IEllMzRlNjkzMDU3
N2I3YTZmZTk5MzI3M2YyMTM3MzI2OTY2MjhiMjY0DQpTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1YW4g
PGV2YW4ucXVhbkBhbWQuY29tPg0KLS0tDQogLi4uL3Bvd2VycGxheS9pbmMvc211MTFfZHJpdmVy
X2lmX2FyY3R1cnVzLmggIHwgMjggKysrKysrKysrKysrKy0tLS0tLSAgZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvaW5jL3NtdV92MTFfMC5oIHwgIDIgKy0NCiAyIGZpbGVzIGNoYW5nZWQs
IDIxIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211MTFfZHJpdmVyX2lmX2FyY3R1cnVzLmggYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211MTFfZHJpdmVyX2lmX2FyY3R1cnVz
LmgNCmluZGV4IDIyNDhkNjgyYzQ2Mi4uODg2YjlhMjFlYmQ4IDEwMDY0NA0KLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdTExX2RyaXZlcl9pZl9hcmN0dXJ1cy5oDQor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211MTFfZHJpdmVyX2lmX2Fy
Y3R1cnVzLmgNCkBAIC00MjMsMTggKzQyMywzMCBAQCB0eXBlZGVmIGVudW0gew0KIH0gUHdyQ29u
ZmlnX2U7DQoNCiB0eXBlZGVmIGVudW0gew0KLSAgWEdNSV9MSU5LX1JBVEVfMTIgPSAwLCAgLy8g
MTJHYnBzDQotICBYR01JX0xJTktfUkFURV8xNiwgICAgICAvLyAxNkdicHMNCi0gIFhHTUlfTElO
S19SQVRFXzIyLCAgICAgIC8vIDIyR2Jwcw0KLSAgWEdNSV9MSU5LX1JBVEVfMjUsICAgICAgLy8g
MjVHYnBzDQorICBYR01JX0xJTktfUkFURV8yID0gMiwgICAgLy8gMkdicHMNCisgIFhHTUlfTElO
S19SQVRFXzQgPSA0LCAgICAvLyA0R2Jwcw0KKyAgWEdNSV9MSU5LX1JBVEVfOCA9IDgsICAgIC8v
IDhHYnBzDQorICBYR01JX0xJTktfUkFURV8xMiA9IDEyLCAgLy8gMTJHYnBzDQorICBYR01JX0xJ
TktfUkFURV8xNiA9IDE2LCAgLy8gMTZHYnBzDQorICBYR01JX0xJTktfUkFURV8xNyA9IDE3LCAg
Ly8gMTdHYnBzDQorICBYR01JX0xJTktfUkFURV8xOCA9IDE4LCAgLy8gMThHYnBzDQorICBYR01J
X0xJTktfUkFURV8xOSA9IDE5LCAgLy8gMTlHYnBzDQorICBYR01JX0xJTktfUkFURV8yMCA9IDIw
LCAgLy8gMjBHYnBzDQorICBYR01JX0xJTktfUkFURV8yMSA9IDIxLCAgLy8gMjFHYnBzDQorICBY
R01JX0xJTktfUkFURV8yMiA9IDIyLCAgLy8gMjJHYnBzDQorICBYR01JX0xJTktfUkFURV8yMyA9
IDIzLCAgLy8gMjNHYnBzDQorICBYR01JX0xJTktfUkFURV8yNCA9IDI0LCAgLy8gMjRHYnBzDQor
ICBYR01JX0xJTktfUkFURV8yNSA9IDI1LCAgLy8gMjVHYnBzDQogICBYR01JX0xJTktfUkFURV9D
T1VOVA0KIH0gWEdNSV9MSU5LX1JBVEVfZTsNCg0KIHR5cGVkZWYgZW51bSB7DQotICBYR01JX0xJ
TktfV0lEVEhfMiA9IDAsIC8vIHgyDQotICBYR01JX0xJTktfV0lEVEhfNCwgICAgIC8vIHg0DQot
ICBYR01JX0xJTktfV0lEVEhfOCwgICAgIC8vIHg4DQotICBYR01JX0xJTktfV0lEVEhfMTYsICAg
IC8vIHgxNg0KKyAgWEdNSV9MSU5LX1dJRFRIXzEgPSAxLCAgIC8vIHgxDQorICBYR01JX0xJTktf
V0lEVEhfMiA9IDIsICAgLy8geDINCisgIFhHTUlfTElOS19XSURUSF80ID0gNCwgICAvLyB4NA0K
KyAgWEdNSV9MSU5LX1dJRFRIXzggPSA4LCAgIC8vIHg4DQorICBYR01JX0xJTktfV0lEVEhfOSA9
IDksICAgLy8geDkNCisgIFhHTUlfTElOS19XSURUSF8xNiA9IDE2LCAvLyB4MTYNCiAgIFhHTUlf
TElOS19XSURUSF9DT1VOVA0KIH0gWEdNSV9MSU5LX1dJRFRIX2U7DQoNCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211X3YxMV8wLmggYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211X3YxMV8wLmgNCmluZGV4IDQ2MjE0ZjUzMzg2ZC4u
NWIxOGEwNjZlNjQ0IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
aW5jL3NtdV92MTFfMC5oDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMv
c211X3YxMV8wLmgNCkBAIC0yNyw3ICsyNyw3IEBADQoNCiAjZGVmaW5lIFNNVTExX0RSSVZFUl9J
Rl9WRVJTSU9OX0lOViAweEZGRkZGRkZGICAjZGVmaW5lIFNNVTExX0RSSVZFUl9JRl9WRVJTSU9O
X1ZHMjAgMHgxMyAtI2RlZmluZSBTTVUxMV9EUklWRVJfSUZfVkVSU0lPTl9BUkNUIDB4MEQNCisj
ZGVmaW5lIFNNVTExX0RSSVZFUl9JRl9WRVJTSU9OX0FSQ1QgMHgwRg0KICNkZWZpbmUgU01VMTFf
RFJJVkVSX0lGX1ZFUlNJT05fTlYxMCAweDMzICAjZGVmaW5lIFNNVTExX0RSSVZFUl9JRl9WRVJT
SU9OX05WMTIgMHgzMyAgI2RlZmluZSBTTVUxMV9EUklWRVJfSUZfVkVSU0lPTl9OVjE0IDB4MzQN
Ci0tDQoyLjIzLjANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18NCmFtZC1nZnggbWFpbGluZyBsaXN0DQphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zw0KaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
