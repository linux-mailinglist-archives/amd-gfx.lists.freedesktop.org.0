Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BFADBD3B
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Oct 2019 07:48:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8AEF6E0FA;
	Fri, 18 Oct 2019 05:48:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810048.outbound.protection.outlook.com [40.107.81.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 197C86E0FA
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Oct 2019 05:48:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A1Zl38SWm3hafLOolpGmncRjXnw/j/c5JGMH4k9y+uojGFvrKPnpoA+7wXD5IMnfarI+Y+XQRY76WyBkD+BYX4RwQacJvVhHYPf8qTC7ci15cm13Zqswac25/Uyv4PFLs12otqCM9VVKlQYgibDCt3O8nQCXYrS1gwLpizsMwHlVPdKsooYemcI1Y8sTHFudZyqxtlfJ7a282m3x/j0VBHbXqud04OLP7aR576hrXbb0cRGT4rtAg2WX/AaqRUMAOqjGCS2EXK9KhwwHY7hsUygTXaZWALWKb+g7Kq1EmgyxFzVha8ksFM1zPayT+PkMNpPXSPTxr3BJhNyF4QxH8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZfvI7jJx+laNnkzcRCS+bZ8xGL4teaB7zmH52O+BHI=;
 b=cDHY6F1b2wPT9sR56Sjhxqk81nDZIv0tl4MM6LEzVbaRLJzErrh8QAphZHgRr0E9ahP3ZBJyZJonlSGj4zCQ86Z21rynNVW0mrsWWHs6lQ0e45ZWT/mK1KNS2e0kaUvWTwBhWUvqisU/SoJO657vy4uOVCOQsxLNB9JGoPTCcELO83u+fBCtzXViB0yk6lJVMRbzQPURIRu88cKpxvirSG0IH+kcgu44J4BHjO6uqRjWcwLUW6B2OgrRvgEWxVYdH/5w23DK3eeNxD97t9yhATya8BQ1u/A5VbU2OQKtoR0CKN8HB54EFIQ9C0zk5+qSDnaUjRjPPCQkhMI7NtS8pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3329.namprd12.prod.outlook.com (20.178.208.93) by
 BN8PR12MB3617.namprd12.prod.outlook.com (20.178.211.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Fri, 18 Oct 2019 05:48:30 +0000
Received: from BN8PR12MB3329.namprd12.prod.outlook.com
 ([fe80::28c4:55fd:ee27:8560]) by BN8PR12MB3329.namprd12.prod.outlook.com
 ([fe80::28c4:55fd:ee27:8560%7]) with mapi id 15.20.2347.023; Fri, 18 Oct 2019
 05:48:30 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: update Arcturus driver smu interface XGMI
 link part
Thread-Topic: [PATCH] drm/amd/powerplay: update Arcturus driver smu interface
 XGMI link part
Thread-Index: AQHVhXerhYh0kj5XZE+E0Zwtp0mBTA==
Date: Fri, 18 Oct 2019 05:48:30 +0000
Message-ID: <20191018054812.25717-1-evan.quan@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0055.apcprd03.prod.outlook.com
 (2603:1096:203:52::19) To BN8PR12MB3329.namprd12.prod.outlook.com
 (2603:10b6:408:61::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 948a4964-061e-4927-e90a-08d7538ecdc9
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN8PR12MB3617:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB36175EB20824380A3C1EE712E46C0@BN8PR12MB3617.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:813;
x-forefront-prvs: 01949FE337
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(346002)(376002)(366004)(396003)(199004)(189003)(316002)(6506007)(4326008)(486006)(476003)(50226002)(2616005)(186003)(5660300002)(26005)(5640700003)(66066001)(14454004)(1076003)(3846002)(6116002)(36756003)(6436002)(2906002)(8676002)(305945005)(71190400001)(52116002)(71200400001)(102836004)(2351001)(66556008)(386003)(81156014)(81166006)(25786009)(6916009)(2501003)(6512007)(86362001)(99286004)(8936002)(7736002)(66476007)(478600001)(66446008)(256004)(64756008)(66946007)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3617;
 H:BN8PR12MB3329.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VD/3WQdwpURlCe4mYm5fonPxXetX/3VDW9EojvjHbFLDtAQJ7LmYyZcp/xTk5pF2TcJuGK2/JZixmDhF1sUVUYerACWQ8CBGSp1FKiFo/JyORNfJNQbGU6Jqx2Mr73hPSojWjE2IReLunkobs8sKvF93uKV+Ngz6fVnh12dfiBuMBROJyI8cxSL8nHOkWB7gnffg29GJUUoaaVRFXmHeVkuGoP2rZpKzUWtvWHjMzTBhR3ESX6qshyORacWGHYsaUfruhan1ylQZPu7Pa5wK1kACrF7iTN8dyR8oVqfZ3/+xrF/Y1GsNf+/blQ2eV4L8joK7QFQ1ENUMTySA4WkNIkjS1xx2RDzIHQgD+0zxnFfHGnGuK8HjEGivPv5BGjRU7XrsgyImxCJ+s0xeV8APsKGJvp0CJ4P6COUqlzxIj1o=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 948a4964-061e-4927-e90a-08d7538ecdc9
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2019 05:48:30.4564 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4cZ7nkVfFrNcj3Zxhmyy3EI4W2hznQR4KDvTZsbpTch5BLG6Vx9cqeNR3vrxtM9q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3617
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZfvI7jJx+laNnkzcRCS+bZ8xGL4teaB7zmH52O+BHI=;
 b=1BKR+AMG1vYDy5kvSqNy05+2IpusN0UfmXfGj0B07/tY1lCFdz17hvtz06d1SQJQBkLdOkp/acQ/s2fHzc2ue+7dmZeOPe2sia4ncjybLlZDy0lHkPz0F5jqGtcVRrwORZID3NT7V6iBCYzHjvtA5qcM1YGqlm5AeRByDaNj1Pc=
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
Cc: "Quan, Evan" <Evan.Quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VG8gZml0IHRoZSBsYXRlc3QgU01VIGZpcm13YXJlLgoKQ2hhbmdlLUlkOiBJZTM0ZTY5MzA1Nzdi
N2E2ZmU5OTMyNzNmMjEzNzMyNjk2NjI4YjI2NApTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1YW4gPGV2
YW4ucXVhbkBhbWQuY29tPgotLS0KIC4uLi9wb3dlcnBsYXkvaW5jL3NtdTExX2RyaXZlcl9pZl9h
cmN0dXJ1cy5oICB8IDI4ICsrKysrKysrKysrKystLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2luYy9zbXVfdjExXzAuaCB8ICAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIxIGlu
c2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvaW5jL3NtdTExX2RyaXZlcl9pZl9hcmN0dXJ1cy5oIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdTExX2RyaXZlcl9pZl9hcmN0dXJ1cy5oCmluZGV4
IDIyNDhkNjgyYzQ2Mi4uODg2YjlhMjFlYmQ4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9pbmMvc211MTFfZHJpdmVyX2lmX2FyY3R1cnVzLmgKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdTExX2RyaXZlcl9pZl9hcmN0dXJ1cy5oCkBA
IC00MjMsMTggKzQyMywzMCBAQCB0eXBlZGVmIGVudW0gewogfSBQd3JDb25maWdfZTsKIAogdHlw
ZWRlZiBlbnVtIHsKLSAgWEdNSV9MSU5LX1JBVEVfMTIgPSAwLCAgLy8gMTJHYnBzCi0gIFhHTUlf
TElOS19SQVRFXzE2LCAgICAgIC8vIDE2R2JwcwotICBYR01JX0xJTktfUkFURV8yMiwgICAgICAv
LyAyMkdicHMKLSAgWEdNSV9MSU5LX1JBVEVfMjUsICAgICAgLy8gMjVHYnBzCisgIFhHTUlfTElO
S19SQVRFXzIgPSAyLCAgICAvLyAyR2JwcworICBYR01JX0xJTktfUkFURV80ID0gNCwgICAgLy8g
NEdicHMKKyAgWEdNSV9MSU5LX1JBVEVfOCA9IDgsICAgIC8vIDhHYnBzCisgIFhHTUlfTElOS19S
QVRFXzEyID0gMTIsICAvLyAxMkdicHMKKyAgWEdNSV9MSU5LX1JBVEVfMTYgPSAxNiwgIC8vIDE2
R2JwcworICBYR01JX0xJTktfUkFURV8xNyA9IDE3LCAgLy8gMTdHYnBzCisgIFhHTUlfTElOS19S
QVRFXzE4ID0gMTgsICAvLyAxOEdicHMKKyAgWEdNSV9MSU5LX1JBVEVfMTkgPSAxOSwgIC8vIDE5
R2JwcworICBYR01JX0xJTktfUkFURV8yMCA9IDIwLCAgLy8gMjBHYnBzCisgIFhHTUlfTElOS19S
QVRFXzIxID0gMjEsICAvLyAyMUdicHMKKyAgWEdNSV9MSU5LX1JBVEVfMjIgPSAyMiwgIC8vIDIy
R2JwcworICBYR01JX0xJTktfUkFURV8yMyA9IDIzLCAgLy8gMjNHYnBzCisgIFhHTUlfTElOS19S
QVRFXzI0ID0gMjQsICAvLyAyNEdicHMKKyAgWEdNSV9MSU5LX1JBVEVfMjUgPSAyNSwgIC8vIDI1
R2JwcwogICBYR01JX0xJTktfUkFURV9DT1VOVAogfSBYR01JX0xJTktfUkFURV9lOwogCiB0eXBl
ZGVmIGVudW0gewotICBYR01JX0xJTktfV0lEVEhfMiA9IDAsIC8vIHgyCi0gIFhHTUlfTElOS19X
SURUSF80LCAgICAgLy8geDQKLSAgWEdNSV9MSU5LX1dJRFRIXzgsICAgICAvLyB4OAotICBYR01J
X0xJTktfV0lEVEhfMTYsICAgIC8vIHgxNgorICBYR01JX0xJTktfV0lEVEhfMSA9IDEsICAgLy8g
eDEKKyAgWEdNSV9MSU5LX1dJRFRIXzIgPSAyLCAgIC8vIHgyCisgIFhHTUlfTElOS19XSURUSF80
ID0gNCwgICAvLyB4NAorICBYR01JX0xJTktfV0lEVEhfOCA9IDgsICAgLy8geDgKKyAgWEdNSV9M
SU5LX1dJRFRIXzkgPSA5LCAgIC8vIHg5CisgIFhHTUlfTElOS19XSURUSF8xNiA9IDE2LCAvLyB4
MTYKICAgWEdNSV9MSU5LX1dJRFRIX0NPVU5UCiB9IFhHTUlfTElOS19XSURUSF9lOwogCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211X3YxMV8wLmggYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211X3YxMV8wLmgKaW5kZXggNDYyMTRm
NTMzODZkLi41YjE4YTA2NmU2NDQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L2luYy9zbXVfdjExXzAuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9pbmMvc211X3YxMV8wLmgKQEAgLTI3LDcgKzI3LDcgQEAKIAogI2RlZmluZSBTTVUxMV9EUklW
RVJfSUZfVkVSU0lPTl9JTlYgMHhGRkZGRkZGRgogI2RlZmluZSBTTVUxMV9EUklWRVJfSUZfVkVS
U0lPTl9WRzIwIDB4MTMKLSNkZWZpbmUgU01VMTFfRFJJVkVSX0lGX1ZFUlNJT05fQVJDVCAweDBE
CisjZGVmaW5lIFNNVTExX0RSSVZFUl9JRl9WRVJTSU9OX0FSQ1QgMHgwRgogI2RlZmluZSBTTVUx
MV9EUklWRVJfSUZfVkVSU0lPTl9OVjEwIDB4MzMKICNkZWZpbmUgU01VMTFfRFJJVkVSX0lGX1ZF
UlNJT05fTlYxMiAweDMzCiAjZGVmaW5lIFNNVTExX0RSSVZFUl9JRl9WRVJTSU9OX05WMTQgMHgz
NAotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
