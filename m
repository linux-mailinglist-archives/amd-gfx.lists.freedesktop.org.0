Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7052FEAB
	for <lists+amd-gfx@lfdr.de>; Thu, 30 May 2019 16:56:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B14E6E398;
	Thu, 30 May 2019 14:56:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780058.outbound.protection.outlook.com [40.107.78.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152156E394
 for <amd-gfx@lists.freedesktop.org>; Thu, 30 May 2019 14:56:16 +0000 (UTC)
Received: from MWHPR12MB1311.namprd12.prod.outlook.com (10.169.206.148) by
 MWHPR12MB1199.namprd12.prod.outlook.com (10.169.205.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.17; Thu, 30 May 2019 14:56:12 +0000
Received: from MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::d9ab:90d0:c292:60a8]) by MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::d9ab:90d0:c292:60a8%8]) with mapi id 15.20.1922.024; Thu, 30 May 2019
 14:56:12 +0000
From: "StDenis, Tom" <Tom.StDenis@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/doc: add rough outline of tracepoint documentation
Thread-Topic: [PATCH] drm/amd/doc: add rough outline of tracepoint
 documentation
Thread-Index: AQHVFvfSk/7dElBPCEmqyib7EQtDxA==
Date: Thu, 30 May 2019 14:56:11 +0000
Message-ID: <20190530145600.12241-1-tom.stdenis@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN7PR10CA0020.namprd10.prod.outlook.com
 (2603:10b6:406:bc::33) To MWHPR12MB1311.namprd12.prod.outlook.com
 (2603:10b6:300:13::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.21.0
x-originating-ip: [165.204.84.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f11a914-9178-4f0c-095a-08d6e50ef460
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MWHPR12MB1199; 
x-ms-traffictypediagnostic: MWHPR12MB1199:
x-microsoft-antispam-prvs: <MWHPR12MB11991B92946585048877482CF7180@MWHPR12MB1199.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-forefront-prvs: 00531FAC2C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(136003)(346002)(396003)(366004)(189003)(199004)(2501003)(36756003)(7736002)(81166006)(8936002)(8676002)(81156014)(50226002)(5660300002)(73956011)(14454004)(86362001)(6436002)(6486002)(305945005)(102836004)(5640700003)(71190400001)(71200400001)(256004)(53936002)(316002)(478600001)(72206003)(52116002)(6916009)(2906002)(2351001)(186003)(66476007)(64756008)(66556008)(26005)(66946007)(66446008)(99286004)(6116002)(3846002)(25786009)(386003)(6512007)(6506007)(66066001)(1076003)(68736007)(2616005)(4326008)(486006)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1199;
 H:MWHPR12MB1311.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +00qM1lxs/80eUL6nN6lUfjPGpewUZ2BpnhiLg0dBA/Ma4oxcX8VfYhfwKKacL9s0TdzZxfLc7z600OYvH0xPYkU6pUBP3BnTdTpL10fAIjPyq8y6k/w4RyMk1fbxeglEBrTVBlQe4GUIMbSnnCL3yRhBTKZbiKJlE1brEO5u7WmR3/QTlZgk83FvFW+lGAcvAd/BZKUWrr2cG35v9zYk8RumMA+BgPnfC/6ph/tKmVeMhLb1iYZ/sa61Bs0nMOZekAqD5kV0QN+AC4UmVFcQkVffBETmw8Yh0kNyB4moAyzDvbUcsuC5ct+0L75AIQQwytKOUv8XVSYqCwAxFYAVTvb76qcZ2THrvO5wASoM8+qKqxgfDFgdCDMbaFIDAhamjI3VYdyTaO1TMCMzXCbfGh3AW0WFCqslqX0Gw24O6k=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f11a914-9178-4f0c-095a-08d6e50ef460
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2019 14:56:12.0818 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tstdenis@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1199
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3VNTtWp1pLwAAU3LGRugzq9/wo7O3UQskPbpRrE5Opc=;
 b=FjTFQBuuvN1Q2z0L904hmk0IIo2z18/32WlZzW9FmjfX7i/UMIIz+CExYg95ZUxAxJ8/+5KucFPDeuUuKk+N+RyaVAbvsP8Nx7gbm4iVPRJarygEovp0sfXO8mJkCFv5fih59TkaIoABV810PjsGqzDIfn1iprfbCuFRzffXbIE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tom.StDenis@amd.com; 
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
Cc: "StDenis, Tom" <Tom.StDenis@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogVG9tIFN0IERlbmlzIDx0b20uc3RkZW5pc0BhbWQuY29tPg0KLS0tDQog
RG9jdW1lbnRhdGlvbi9ncHUvYW1kZ3B1LnJzdCAgICAgICAgICAgICAgfCAgMTAgKw0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90cmFjZS5oIHwgMjIxICsrKysrKysrKysrKysr
KysrKysrKysNCiAyIGZpbGVzIGNoYW5nZWQsIDIzMSBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2dwdS9hbWRncHUucnN0IGIvRG9jdW1lbnRhdGlvbi9ncHUvYW1k
Z3B1LnJzdA0KaW5kZXggODYxMzg3OTgxMjhmLi4zNTY0NzY1MTEwZTUgMTAwNjQ0DQotLS0gYS9E
b2N1bWVudGF0aW9uL2dwdS9hbWRncHUucnN0DQorKysgYi9Eb2N1bWVudGF0aW9uL2dwdS9hbWRn
cHUucnN0DQpAQCAtODksNiArODksMTYgQEAgQU1ER1BVIFJBUyBkZWJ1Z2ZzIGNvbnRyb2wgaW50
ZXJmYWNlDQogLi4ga2VybmVsLWRvYzo6IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9yYXMuYw0KICAgIDppbnRlcm5hbDoNCiANCitBTURHUFUgVHJhY2luZyBTdXBwb3J0DQorPT09
PT09PT09PT09PT09PT09PT09PQ0KKw0KKy4uIGtlcm5lbC1kb2M6OiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdHJhY2UuaA0KKyAgIDpkb2M6IEFNREdQVSBUcmFjaW5nIFN1cHBv
cnQNCisNCisNCisuLiBrZXJuZWwtZG9jOjogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3RyYWNlLmgNCisgICA6aW50ZXJuYWw6DQorDQogDQogR1BVIFBvd2VyL1RoZXJtYWwgQ29u
dHJvbHMgYW5kIE1vbml0b3JpbmcNCiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PQ0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90
cmFjZS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3RyYWNlLmgNCmluZGV4
IGQzY2EyNDI0YjVmZS4uNzFmZWJiOTBkM2UzIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3RyYWNlLmgNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV90cmFjZS5oDQpAQCAtMzcsNiArMzcsMjI3IEBADQogI2RlZmluZSBBTURHUFVf
Sk9CX0dFVF9USU1FTElORV9OQU1FKGpvYikgXA0KIAkgam9iLT5iYXNlLnNfZmVuY2UtPmZpbmlz
aGVkLm9wcy0+Z2V0X3RpbWVsaW5lX25hbWUoJmpvYi0+YmFzZS5zX2ZlbmNlLT5maW5pc2hlZCkN
CiANCisvKioNCisgKiBET0M6IEFNREdQVSBUcmFjaW5nIFN1cHBvcnQNCisgKg0KKyAqIFRoZSBB
TURHUFUgZHJpdmVyIHByb3ZpZGVzIG51bWVyb3VzIHRyYWNlIHBvaW50cyB0aGF0IGNhbiBhaWQN
CisgKiBpbiBkZWJ1Z2dpbmcuICBUaGV5IGFyZSBnbG9iYWxseSBlbmFibGVkIGJ5IHRoZSBmaWxl
Og0KKyAqDQorICogL3N5cy9rZXJuZWwvZGVidWcvdHJhY2luZy9ldmVudHMvYW1kZ3B1L2VuYWJs
ZQ0KKyAqDQorICogb3IgaW5kaXZpZHVhbGx5IGJ5IHRoZSBlbmFibGUgZmlsZXMgaW4gdGhlIHN1
Yi1kaXJlY3Rvcmllcw0KKyAqIG9mIHRoYXQgZGlyZWN0b3J5Lg0KKyAqDQorICogYW1kZ3B1X21t
X3JyZWcsIGFtZGdwdV9tbV93cmVnDQorICogLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
DQorICoNCisgKiBUaGVzZSB0cmFjZSBwb2ludHMgdHJhY2sgcmVhZHMgYW5kIHdyaXRlcyB0byBN
TUlPIHJlZ2lzdGVycyBieQ0KKyAqIHRoZSBrZXJuZWwgZHJpdmVyIChhY3Rpdml0eSBpbnNpZGUg
cmluZy9pbmRpcmVjdCBidWZmZXJzIGFyZSBub3QNCisgKiB0cmFjZWQpIHdoaWNoIGNhbiBiZSB1
c2VkIHRvIGRpYWdub3NlIElQIGJsb2NrIGFjdGl2aXR5IGFuZA0KKyAqIHJlc3BvbnNlcy4NCisg
Kg0KKyAqIFRoZSB0cmFjZSBjYXB0dXJlcyB0aGUgZm9sbG93aW5nIGluZm9ybWF0aW9uOg0KKyAq
DQorICogICAgIC0gRElEIG9mIHRoZSBkZXZpY2UgYmVpbmcgdXNlZA0KKyAqICAgICAtIFJlZ2lz
dGVyIGFkZHJlc3MNCisgKiAgICAgLSBWYWx1ZSBiZWluZyByZWFkIG9yIHdyaXR0ZW4NCisgKg0K
KyAqIEl0IGRvZXMgbm90IGRpZmZlcmVudGlhdGUgYmV0d2VlbiBtdWx0aXBsZSBpbnN0YW5jZXMg
b2YgdGhlIHNhbWUNCisgKiBBU0lDLiBUaGUgcmVnaXN0ZXIgYWRkcmVzcyBpcyB0aGUgRFdPUkQg
YWRkcmVzcyBvZiB0aGUgcmVnaXN0ZXINCisgKiBiZWluZyB1c2VkLg0KKyAqDQorICogYW1kZ3B1
X2l2DQorICogLS0tLS0tLS0tDQorICoNCisgKiBUaGlzIHRyYWNlcG9pbnQgY2FwdHVyZXMgZGF0
YSBmcm9tIGFuIElSUSBldmVudCBiZWZvcmUgZGlzcGF0Y2hpbmcNCisgKiBjb250cm9sIHRvIHRo
ZSByZXNwZWN0aXZlIElQIGJsb2NrIElSUSBoYW5kbGVyLiAgVGhlIHRyYWNlDQorICogY2FwdHVy
ZXMgdGhlIGZvbGxvd2luZyBpbmZvcm1hdGlvbjoNCisgKg0KKyAqICAgIC0gY2xpZW50IElEDQor
ICogICAgLSBzb3VyY2UgSUQNCisgKiAgICAtIHJpbmcgSUQNCisgKiAgICAtIFZNIElEDQorICog
ICAgLSBWTSBJRCBzb3VyY2UNCisgKiAgICAtIFRpbWVzdGFtcA0KKyAqICAgIC0gVGltZXN0YW1w
IHNvdXJjZQ0KKyAqICAgIC0gUEFTIElEDQorICogICAgLSA0IFNSQyBkYXRhIHdvcmRzDQorICoN
CisgKiBhbWRncHVfYm9fY3JlYXRlDQorICogLS0tLS0tLS0tLS0tLS0tLQ0KKyAqDQorICogVGhp
cyB0cmFjZXBvaW50IGNhcHR1cmVzIHRoZSBzdGF0ZSBvZiBhIHN1Y2Nlc3NmdWxseSBjcmVhdGVk
DQorICogYnVmZmVyIG9iamVjdCAoQk8pLiAgVGhlIHRyYWNlIGNhcHR1cmVzIHRoZSBmb2xsb3dp
bmcgaW5mb3JtYXRpb246DQorICoNCisgKiAgICAtIGtlcm5lbCBhZGRyZXNzIG9mIHRoZSBCTw0K
KyAqICAgIC0gTnVtYmVyIG9mIChHUFUpIHBhZ2VzDQorICogICAgLSBNZW1vcnkgdHlwZQ0KKyAq
ICAgIC0gUHJlZmVycmVkIGRvbWFpbg0KKyAqICAgIC0gQWxsb3dlZCBkb21haW5zDQorICogICAg
LSBCdWZmZXIgT2JqZWN0IEZsYWdzDQorICoNCisgKiBhbWRncHVfY3MNCisgKiAtLS0tLS0tLS0N
CisgKg0KKyAqIFRoaXMgdHJhY2Vwb2ludCBjYXB0dXJlcyBkYXRhIGFib3V0IGEgY29tbWFuZCBz
dWJtaXNzaW9uIHByaW9yDQorICogdG8gYmVpbmcgc3VibWl0dGVkIHRvIGEgcmluZyAob3IgcXVl
dWUpLiAgVGhlIHRyYWNlIGNhcHR1cmVzIGFsbA0KKyAqIGluZGlyZWN0IGJ1ZmZlcnMgKGlicykg
YXQgb25jZSBiZWZvcmUgaXNzdWluZyBhbnkgY29tbWFuZHMuICBUaGUNCisgKiB0cmFjZSBjYXB0
dXJlcyB0aGUgZm9sbG93aW5nIGluZm9ybWF0aW9uOg0KKyAqDQorICogICAgLSBrZXJuZWwgYWRk
cmVzcyBvZiB0aGUgYnVmZmVyIG9iamVjdCAoQk8pIGxpc3QNCisgKiAgICAtIFRoZSByaW5nIChp
bmRleCkgYmVpbmcgc3VibWl0dGVkIHRvDQorICogICAgLSBUaGUgbnVtYmVyIG9mIHdvcmRzDQor
ICogICAgLSBUaGUgbnVtYmVyIG9mIGZlbmNlcyBlbWl0dGVkDQorICoNCisgKiBhbWRncHVfY3Nf
aW9jdGwNCisgKiAtLS0tLS0tLS0tLS0tLS0NCisgKg0KKyAqIFRoaXMgdHJhY2Vwb2ludCBjYXB0
dXJlcyBpbmZvcm1hdGlvbiBmcm9tIHRoZSBJT0NUTCBxdWVyeSB0aGF0DQorICogc3VibWl0cyBj
b21tYW5kcyB0byBhIHJpbmcuICBJdCBpcyBwYXJ0IG9mIHRoZSBEUk0gdXNlcnNwYWNlDQorICog
aW5mcmFzdHJ1Y3R1cmUuICBUaGUgdHJhY2UgY2FwdHVyZXMgdGhlIGZvbGxvd2luZyBpbmZvcm1h
dGlvbjoNCisgKg0KKyAqICAgIC0gU2NoZWR1bGUgam9iIElEDQorICogICAgLSBUaW1lbGluZSAo
bmFtZSBvZiByaW5nIHRoZSBmZW5jZSBpcyBlbWl0dGVkIHRvKQ0KKyAqICAgIC0gRmVuY2UgY29u
dGV4dA0KKyAqICAgIC0gRmVuY2Ugc2VxdWVuY2UgbnVtYmVyDQorICogICAgLSBSaW5nIG5hbWUg
YmVpbmcgc3VibWl0dGVkIHRvDQorICogICAgLSBOdW1iZXIgb2YgaW5kaXJlY3QgYnVmZmVycyAo
aWJzKQ0KKyAqDQorICogYW1kZ3B1X3NjaGVkX3J1bl9qb2INCisgKiAtLS0tLS0tLS0tLS0tLS0t
LS0tLQ0KKyAqDQorICogVGhpcyB0cmFjZXBvaW50IGNhcHR1cmVzIGluZm9ybWF0aW9uIGFib3V0
IGEgam9iIHN1Ym1pc3Npb24NCisgKiBhdCB0aGUgcG9pbnQgb2Ygc2NoZWR1bGluZyBmb3Igc3Vi
bWlzc2lvbiB0byBhIHJpbmcuICBUaGUgdHJhY2UNCisgKiBjYXB0dXJlcyB0aGUgZm9sbG93aW5n
IGluZm9ybWF0aW9uOg0KKyAqDQorICogICAgLSBKb2IgSUQNCisgKiAgICAtIFRpbWVsaW5lIChu
YW1lIG9mIHJpbmcgdGhlIGZlbmNlIGlzIGVtaXR0ZWQgdG8pDQorICogICAgLSBDb250ZXh0IElE
DQorICogICAgLSBTZXF1ZW5jZSBOdW1iZXINCisgKiAgICAtIFJpbmcgbmFtZSBiZWluZyBzdWJt
aXR0ZWQgdG8NCisgKiAgICAtIE51bWJlciBvZiBpbmRpcmVjdCBidWZmZXJzIChpYnMpDQorICoN
CisgKiBhbWRncHVfdm1fZ3JhYl9pZA0KKyAqIC0tLS0tLS0tLS0tLS0tLS0tDQorICoNCisgKiBU
aGlzIHRyYWNlcG9pbnQgY2FwdHVyZXMgaW5mb3JtYXRpb24gYWJvdXQgYSBWTSBhbGxvY2F0aW9u
Lg0KKyAqIFRoZSB0cmFjZSBjYXB0dXJlcyB0aGUgZm9sbG93aW5nIGluZm9ybWF0aW9uOg0KKyAq
DQorICogICAgLSBQQVMgSUQNCisgKiAgICAtIFJpbmcgbmFtZQ0KKyAqICAgIC0gUmluZyBpbmRl
eA0KKyAqICAgIC0gVk0gSUQgdGhhdCBpcyBhc3NpZ25lZA0KKyAqICAgIC0gVk0gaHViIGFzc2ln
bmVkIChkZXBlbmRzIG9uIHJpbmcpDQorICogICAgLSBQYWdlIERpcmVjdG9yeSBiYXNlIGFkZHJl
c3MNCisgKiAgICAtIEZsYWcgaW5kaWNhdGluZyB3aGV0aGVyIGl0IG5lZWRzIHRvIGJlIGZsdXNo
ZWQgb3Igbm90DQorICoNCisgKiBhbWRncHVfdm1fYm9fbWFwDQorICogLS0tLS0tLS0tLS0tLS0t
LQ0KKyAqDQorICogVGhpcyB0cmFjZXBvaW50IGNhcHR1cmVzIGluZm9ybWF0aW9uIHdoZW4gYSBu
ZXcgbWFwcGluZyBpcyBpbnNlcnRlZA0KKyAqIGludG8gYSBWTSBzcGFjZS4gIFRoZSB0cmFjZSBj
YXB0dXJlcyB0aGUgZm9sbG93aW5nIGluZm9ybWF0aW9uOg0KKyAqDQorICogICAgLSBLZXJuZWwg
YWRkcmVzcyBvZiB0aGUgYnVmZmVyIG9iamVjdCAoYm8pDQorICogICAgLSBTdGFydCBwYWdlIGFk
ZHJlc3Mgb2YgbWFwcGluZw0KKyAqICAgIC0gTGFzdCBwYWdlIGFkZHJlc3Mgb2YgbWFwcGluZw0K
KyAqICAgIC0gT2Zmc2V0IGludG8gbWFwcGluZw0KKyAqICAgIC0gRmxhZ3MgZm9yIHRoZSBtYXBw
aW5nDQorICoNCisgKiBhbWRncHVfdm1fYm9fdW5tYXANCisgKiAtLS0tLS0tLS0tLS0tLS0tLS0N
CisgKg0KKyAqIFRoaXMgdHJhY2Vwb2ludCBjYXB0dXJlcyBpbmZvcm1hdGlvbiB3aGVuIGEgbWFw
cGluZyBpcyBkZWxldGVkDQorICogZnJvbSBhIFZNIHNwYWNlLiAgVGhlIHRyYWNlIGNhcHR1cmVz
IHRoZSBmb2xsb3dpbmcgaW5mb3JtYXRpb246DQorICoNCisgKiAgICAtIEtlcm5lbCBhZGRyZXNz
IG9mIHRoZSBidWZmZXIgb2JqZWN0IChibykNCisgKiAgICAtIFN0YXJ0IHBhZ2UgYWRkcmVzcyBv
ZiBtYXBwaW5nDQorICogICAgLSBMYXN0IHBhZ2UgYWRkcmVzcyBvZiBtYXBwaW5nDQorICogICAg
LSBPZmZzZXQgaW50byBtYXBwaW5nDQorICogICAgLSBGbGFncyBmb3IgdGhlIG1hcHBpbmcNCisg
Kg0KKyAqIGFtZGdwdV92bV9zZXRfcHRlcw0KKyAqIC0tLS0tLS0tLS0tLS0tLS0tLQ0KKyAqDQor
ICogVGhpcyB0cmFjZXBvaW50IGNhcHR1cmVzIGluZm9ybWF0aW9uIHdoZW4gbmV3IFBhZ2UgVGFi
bGUgRW50cmllcw0KKyAqIChQVEUpIGFyZSB0byBiZSB3cml0dGVuIG91dCB0byB0aGUgUGFnZSBU
YWJsZSBCbG9jayAoUFRCKSBwb2ludGVkDQorICogdG8gYnkgYSBQYWdlIERpcmVjdG9yeSBFbnRy
eSAoUERFKS4gIFRoZSB0cmFjZSBjYXB0dXJlcyB0aGUNCisgKiBmb2xsb3dpbmcgaW5mb3JtYXRp
b246DQorICoNCisgKiAgICAtIENQVSBhZGRyZXNzIG9mIFBURSAocGUpDQorICogICAgLSBQYWdl
IEJhc2UgQWRkcmVzcyAoYWRkcikgdG8gYmUgaW5zZXJ0ZWQNCisgKiAgICAtIE51bWJlciBvZiBQ
VEVzIHRvIGJlIHdyaXR0ZW4NCisgKiAgICAtIEluY3JlbWVudCBvbiB0aGUgcGFnZSBiYXNlZCBh
ZGRyZXNzIHBlciBlbnRyeQ0KKyAqICAgIC0gVGhlIFBURSBmbGFncw0KKyAqDQorICogYW1kZ3B1
X3ZtX2NvcHlfcHRlcw0KKyAqIC0tLS0tLS0tLS0tLS0tLS0tLS0NCisgKg0KKyAqIFRoaXMgdHJh
Y2Vwb2ludCBjYXB0dXJlcyBpbmZvcm1hdGlvbiB3aGVuIFBhZ2UgVGFibGUgRW50cmllcyBhcmUN
CisgKiBjb3BpZWQgZnJvbSBhIG1hcHBpbmcgdG8gYSBQYWdlIFRhYmxlIEJsb2NrLiAgVGhlIHRy
YWNlIGNhcHR1cmVzIHRoZQ0KKyAqIGZvbGxvd2luZyBpbmZvcm1hdGlvbjoNCisgKg0KKyAqICAg
IC0gRGVzdGluYXRpb24gUFRCIGZvciB0aGUgY29waWVkIGVudHJpZXMNCisgKiAgICAtIFNvdXJj
ZSBhZGRyZXNzDQorICogICAgLSBDb3VudCBvZiBQVEUgZW50cmllcyB0byBjb3B5DQorICoNCisg
KiBhbWRncHVfdm1fZmx1c2gNCisgKiAtLS0tLS0tLS0tLS0tLS0NCisgKg0KKyAqIFRoaXMgdHJh
Y2Vwb2ludCBjYXB0dXJlcyBpbmZvcm1hdGlvbiBvZiBhIFZNIGZsdXNoIGJlaW5nIHBlcmZvcm1l
ZA0KKyAqIHZpYSBhIHNwZWNpZmljIEdQVSByaW5nLiAgVGhlIHRyYWNlIGNhcHR1cmVzIHRoZSBm
b2xsb3dpbmcNCisgKiBpbmZvcm1hdGlvbjoNCisgKg0KKyAqICAgIC0gUmluZyBuYW1lDQorICog
ICAgLSBWTSBJRA0KKyAqICAgIC0gVk0gSHViDQorICogICAgLSBUaGUgYmFzZSBhZGRyZXNzIG9m
IHRoZSBQREIgYmVpbmcgaW52YWxpZGF0ZWQNCisgKg0KKyAqIGFtZGdwdV9ib19saXN0X3NldA0K
KyAqIC0tLS0tLS0tLS0tLS0tLS0tLQ0KKyAqDQorICogVGhpcyB0cmFjZXBvaW50IGNhcHR1cmVz
IGluZm9ybWF0aW9uIHdoZW4gc3RvcmluZyBhIGJ1ZmZlcg0KKyAqIG9iamVjdCAoYm8pIGxpc3Qg
ZW50cnkuIFRoZSB0cmFjZSBjYXB0dXJlcyB0aGUgZm9sbG93aW5nDQorICogaW5mb3JtYXRpb246
DQorICoNCisgKiAgICAtIEtlcm5lbCBhZGRyZXNzIG9mIHRoZSBidWZmZXIgb2JqZWN0IGxpc3QN
CisgKiAgICAtIEtlcm5lbCBhZGRyZXNzIG9mIHRoZSBidWZmZXIgb2JqZWN0IGJlaW5nIGFkZGVk
DQorICogICAgLSBTaXplIG9mIHRoZSBidWZmZXIgb2JqZWN0IGJlaW5nIGFkZGVkDQorICoNCisg
KiBhbWRncHVfY3NfYm9fc3RhdHVzDQorICogLS0tLS0tLS0tLS0tLS0tLS0tLQ0KKyAqDQorICog
VGhpcyB0cmFjZXBvaW50IGNhcHR1cmVzIGluZm9ybWF0aW9uIHdoZW4gYSBidWZmZXIgb2JqZWN0
IChibykNCisgKiBsaXN0IGlzIGNyZWF0ZWQuICBUaGUgdHJhY2UgY2FwdHVyZXMgdGhlIGZvbGxv
d2luZyBpbmZvcm1hdGlvbjoNCisgKg0KKyAqICAgIC0gVG90YWwgbnVtYmVyIG9mIGVudHJpZXMN
CisgKiAgICAtIFRvdGFsIGJ5dGVzIG9mIG9iamVjdHMgc3RvcmVkIGluIGxpc3QNCisgKg0KKyAq
IGFtZGdwdV9ib19tb3ZlDQorICogLS0tLS0tLS0tLS0tLS0NCisgKg0KKyAqIFRoaXMgdHJhY2Vw
b2ludCBjYXB0dXJlcyBpbmZvcm1hdGlvbiBhYm91dCB0aGUgbW92ZW1lbnQgb2YgYQ0KKyAqIGJ1
ZmZlciBvYmplY3QgZnJvbSBvbmUgcGxhY2VtZW50IChtZW1vcnkgdHlwZSkgdG8gYW5vdGhlci4g
IHRoZQ0KKyAqIHRyYWNlIGNhcHR1cmVzIHRoZSBmb2xsb3dpbmcgaW5mb3JtYXRpb246DQorICoN
CisgKiAgICAgLSBLZXJuZWwgYWRkcmVzcyBvZiBidWZmZXIgb2JqZWN0DQorICogICAgIC0gU2l6
ZSBvZiBidWZmZXIgb2JqZWN0IGluIGJ5dGVzDQorICogICAgIC0gTmV3IHBsYWNlbWVudCB0YXJn
ZXQNCisgKiAgICAgLSBPbGQgcGxhY2VtZW50IHNvdXJjZQ0KKyAqDQorICogYW1kZ3B1X2liX3Bp
cGVfc3luYw0KKyAqIC0tLS0tLS0tLS0tLS0tLS0tLS0NCisgKg0KKyAqIFRoaXMgdHJhY2Vwb2lu
dCBjYXB0dXJlcyBpbmZvcm1hdGlvbiB3aGVuIGEgcGlwZWxpbmUgc3luYyBpcw0KKyAqIGVtaXR0
ZWQgdG8gYSByaW5nLiAgVGhlIHRyYWNlIGNhcHR1cmVzIHRoZSBmb2xsb3dpbmcgaW5mb3JtYXRp
b246DQorICoNCisgKiAgICAgLSBOYW1lIG9mIHRoZSByaW5nDQorICogICAgIC0gSm9iIElEDQor
ICogICAgIC0gS2VybmVsIGFkZHJlc3Mgb2YgZmVuY2Ugb2JqZWN0DQorICogICAgIC0gQ29udGV4
dCBJRA0KKyAqICAgICAtIEZlbmNlIHNlcXVlbmNlIG51bWJlcg0KKyAqDQorICovDQorDQogVFJB
Q0VfRVZFTlQoYW1kZ3B1X21tX3JyZWcsDQogCSAgICBUUF9QUk9UTyh1bnNpZ25lZCBkaWQsIHVp
bnQzMl90IHJlZywgdWludDMyX3QgdmFsdWUpLA0KIAkgICAgVFBfQVJHUyhkaWQsIHJlZywgdmFs
dWUpLA0KLS0gDQoyLjIxLjANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
