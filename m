Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A36D5D5C
	for <lists+amd-gfx@lfdr.de>; Mon, 14 Oct 2019 10:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40816E141;
	Mon, 14 Oct 2019 08:26:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720046.outbound.protection.outlook.com [40.107.72.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F9706E144
 for <amd-gfx@lists.freedesktop.org>; Mon, 14 Oct 2019 08:26:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/c3BFGEykwFes5OLXakNd4kHX2S//JMmJB9S1Wy/TRc8ra1vR55rmEOVQw0QUZ01f4FopEAJEz4YeYTDFdx5nz0wf12WP1qXr9yEnfNqaC7lkULliUVAEByYBTsySEQekz2Vy4nf41ekFE4d5ol0PN0mCSGg8F5Y2JcKWLgRMOJN7a19J6BySb2xIaxs03tt3fS4XdWjMD4mG83T5NrVo6W4xEk6XZbr+5s+6J+nD1pcnoCu4noFJ0KIbquzGBL2kbWZPnGyW5q0IR3zciixpJmkHPat5+uIGB89fQBRwBQwZV7fIvtxuATgSGaw0Q9GqcmfKM1LfkqrdRzG1ApRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sg/s/JGJDWdXWOEiXpnJwKBnaRsIW1ZwiL97DPr/8EA=;
 b=KXeoOWG6Z+VjMDDpS6yrCGtHbb+l4PnhDu6ItIWjOhyBWKr0vaBFfQmvIXKBMS33y4v1LbkkKzs3zzRLIowM8fHOtrPO8vuPgTCXpsnMUMgSV5NYj1JGK7CYcDzIBn5YQBU/TPaMxSDQmPF8r5wxjN+sE2kWOmIToz9V1gWAw4mKfoBqP683125k9B+ooOieRNZiH39RuYO1Y3G6lDNoo+gRTndyFcxv8TfRNClglmpcQSsAMnKDHKGp010iuQyzambm+RU7Swl/pEFCi294qqcoX1axLjvHUQQOgkorjNaQwYVlXgKFKGnzpKW1bvG7G4hyoc02dEnkY+Kw/Fmxkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1306.namprd12.prod.outlook.com (10.168.233.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Mon, 14 Oct 2019 08:26:07 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e%10]) with mapi id 15.20.2347.021; Mon, 14 Oct
 2019 08:26:07 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Tuikov, Luben" <Luben.Tuikov@amd.com>, "Yin, Tianci (Rico)"
 <Tianci.Yin@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 7/8] drm/amdgpu: reserve vram for memory training
Thread-Topic: [PATCH 7/8] drm/amdgpu: reserve vram for memory training
Thread-Index: AQHVf+cl9Ws7VrcKg0awtAOsHv9jNKdWFgoAgAO8LgA=
Date: Mon, 14 Oct 2019 08:26:07 +0000
Message-ID: <a93b3b8e-4df9-f6e2-95f7-3f0c0d8bebdc@amd.com>
References: <20191011035033.24935-1-tianci.yin@amd.com>
 <20191011035033.24935-7-tianci.yin@amd.com>
 <9084e67e-adc2-b512-b593-ca218c17a366@amd.com>
In-Reply-To: <9084e67e-adc2-b512-b593-ca218c17a366@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR0102CA0023.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:14::36) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 02654c0f-7f9c-4cc1-88f7-08d750802946
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB1306:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB13060EFE2E89BBC645359E1E83900@DM5PR12MB1306.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01901B3451
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(199004)(189003)(25786009)(6506007)(5660300002)(71190400001)(298455003)(31696002)(99286004)(8936002)(81166006)(81156014)(8676002)(31686004)(186003)(76176011)(52116002)(65956001)(65806001)(14454004)(102836004)(71200400001)(58126008)(2501003)(53546011)(386003)(110136005)(86362001)(316002)(478600001)(7736002)(476003)(6116002)(2906002)(46003)(446003)(4001150100001)(256004)(2616005)(486006)(11346002)(36756003)(4326008)(66446008)(64756008)(66556008)(66476007)(66946007)(6486002)(6246003)(6512007)(6436002)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1306;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0FqmcExd22TfF+GLNMeDGk2+mWUVPx8cAjqb33HC25UUTovz2M9UyFTm2FY9jI1pv3zc9YhixW7Atjwv3Wvrg3hqW9SsXqTlxpKm0hgSkhAN8rLfLHgcCG9oZ3bWdp+RjpI3i40u8Q8QoR5jo3ih16hYhJFIi+Q1Tl+10FzANx5puaMwdo8a97eGNZJ0nUiQ7SEB4ktMHmooH/DmScnNCVp7NaPfxvYDWheQChjMRkZtbN6D6Zg32n81Erya2Gggp57JBVMnURYiunjN9C7f9nMjPopXv5Xn4LsobEEUOXdeTbh6y8s72sJSjMG/v8kuxhECCdy+dYfbLuH6jGSCqLXLmO5VwWm6ao6BwaE9LAF/6Qr4VamfsyEtl8uvNzqyyeS1k8ttU1w6Nqeo7X05T8VHq4BpiDcNpDAuy/MGm8g=
Content-ID: <2803AEF96D788644B2B0CB749BBA6ABE@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02654c0f-7f9c-4cc1-88f7-08d750802946
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2019 08:26:07.7127 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xcccim3fgRPMgak1rlH3k7VIsYO8sSF/dcRnUbAWWaqf5r6MxSxFCChGVfdoc8WR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1306
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sg/s/JGJDWdXWOEiXpnJwKBnaRsIW1ZwiL97DPr/8EA=;
 b=ZUsy5/uN7NEW5yKlN1hc+6evhYalMhJR2AFAUmVoDJYJXKMRHWVCCdDLgUDNZaKnedAWrtsmwdQOtvqGS+zEB/R1G1Gs/oIQi8oOczDPODpxTHe7T5BD3udZvsCfzV9cBRKgEDmW0xzz2SS1Jc14WZ1pzkZm4+mwu0YIjf1R8tI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTIuMTAuMTkgdW0gMDE6MjMgc2NocmllYiBUdWlrb3YsIEx1YmVuOg0KPiBPbiAyMDE5LTEw
LTEwIDExOjUwIHAubS4sIFRpYW5jaSBZaW4gd3JvdGU6DQo+PiBGcm9tOiAiVGlhbmNpLllpbiIg
PHRpYW5jaS55aW5AYW1kLmNvbT4NCj4+DQo+PiBtZW1vcnkgdHJhaW5pbmcgdXNpbmcgc3BlY2lm
aWMgZml4ZWQgdnJhbSBzZWdtZW50LCByZXNlcnZlIHRoZXNlDQo+PiBzZWdtZW50cyBiZWZvcmUg
YW55b25lIG1heSBhbGxvY2F0ZSBpdC4NCj4+DQo+PiBDaGFuZ2UtSWQ6IEkxNDM2NzU1ODEzYTU2
NTYwOGEyODU3YTY4M2Y1MzUzNzc2MjBhNjM3DQo+PiBSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogVGlhbmNpLllp
biA8dGlhbmNpLnlpbkBhbWQuY29tPg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV90dG0uYyB8IDk2ICsrKysrKysrKysrKysrKysrKysrKysrKysNCj4+ICAg
MSBmaWxlIGNoYW5nZWQsIDk2IGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3R0bS5jDQo+PiBpbmRleCA5ZGE2MzUwYTRiYTIuLjQyZDBmY2I5ODM4
MiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0u
Yw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jDQo+PiBA
QCAtMTY2Nyw2ICsxNjY3LDkzIEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3R0bV9md19yZXNlcnZlX3Zy
YW1faW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4+ICAgCQkJCQkgICZhZGV2LT5m
d192cmFtX3VzYWdlLnZhKTsNCj4+ICAgfQ0KPj4gICANCj4+ICsvKg0KPj4gKyAqIE1lbW95IHRy
YWluaW5nIHJlc2VydmF0aW9uIGZ1bmN0aW9ucw0KPj4gKyAqLw0KPj4gKw0KPj4gKy8qKg0KPj4g
KyAqIGFtZGdwdV90dG1fdHJhaW5pbmdfcmVzZXJ2ZV92cmFtX2ZpbmkgLSBmcmVlIG1lbW9yeSB0
cmFpbmluZyByZXNlcnZlZCB2cmFtDQo+PiArICoNCj4+ICsgKiBAYWRldjogYW1kZ3B1X2Rldmlj
ZSBwb2ludGVyDQo+PiArICoNCj4+ICsgKiBmcmVlIG1lbW9yeSB0cmFpbmluZyByZXNlcnZlZCB2
cmFtIGlmIGl0IGhhcyBiZWVuIHJlc2VydmVkLg0KPj4gKyAqLw0KPj4gK3N0YXRpYyBpbnQgYW1k
Z3B1X3R0bV90cmFpbmluZ19yZXNlcnZlX3ZyYW1fZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldikNCj4+ICt7DQo+PiArCXN0cnVjdCBwc3BfbWVtb3J5X3RyYWluaW5nX2NvbnRleHQgKmN0
eCA9ICZhZGV2LT5wc3AubWVtX3RyYWluX2N0eDsNCj4+ICsNCj4+ICsJY3R4LT5pbml0ID0gUFNQ
X01FTV9UUkFJTl9OT1RfU1VQUE9SVDsNCj4+ICsJaWYgKGN0eC0+YzJwX2JvKSB7DQo+PiArCQlh
bWRncHVfYm9fZnJlZV9rZXJuZWwoJmN0eC0+YzJwX2JvLCBOVUxMLCBOVUxMKTsNCj4+ICsJCWN0
eC0+YzJwX2JvID0gTlVMTDsNCj4+ICsJfQ0KPiBHZW5lcmFsbHkgaXQgaXMgYSBnb29kIGlkZWEg
dG8gcGFyYWdyYXBoIHlvdXIgY29kZS4NCj4gU28gYW4gZW1wdHkgbGluZSBiZXR3ZWVuIGlmLXN0
YXRlbWVudHMgaXMgYSBnb29kIGlkZWEuDQo+IEhvd2V2ZXIsIHRoZXJlIGlzIG5vIG5lZWQgaW46
DQo+DQo+IHJldCA9IGYoeCk7DQo+IGlmIChyZXQpIHsNCj4gCTxib2R5IG9mIGNvZGU+DQo+IH0N
Cj4NCj4gaWYgKGJsYWgpIHsNCj4gCTxib2R5IG9mIGNvZGU+DQo+IH0NCj4NCj4gVGhlIGFib3Zl
IGFyZSB0d28gKDIpIHdlbGwtZm9ybWVkIHBhcmFncmFwaHMuDQoNCkFkZGl0aW9uYWwgdG8gdGhh
dCBhbWRncHVfYm9fZnJlZV9rZXJuZWwoKSBqdXN0IGxpa2Uga2ZyZWUoKSBpcyBOVUxMIA0Kc2Fm
ZSBmb3IgdGhlIHJlYXNvbiB0aGF0IHlvdSBzaG91bGRuJ3QgbmVlZCAiaWYicyBsaWtlIHRoYXQg
b25lLg0KDQpFLmcuIGp1c3Qgd3JpdGU6DQoNCmFtZGdwdV9ib19mcmVlX2tlcm5lbCgmY3R4LT5j
MnBfYm8uLi4pOw0KDQphbmQgeW91IGFyZSBkb25lLg0KDQpSZWdhcmRzLA0KQ2hyaXN0aWFuLg0K
DQo+DQo+PiArCWlmIChjdHgtPnAyY19ibykgew0KPj4gKwkJYW1kZ3B1X2JvX2ZyZWVfa2VybmVs
KCZjdHgtPnAyY19ibywgTlVMTCwgTlVMTCk7DQo+PiArCQljdHgtPnAyY19ibyA9IE5VTEw7DQo+
PiArCX0NCj4+ICsNCj4+ICsJcmV0dXJuIDA7DQo+PiArfQ0KPj4gKw0KPj4gKy8qKg0KPj4gKyAq
IGFtZGdwdV90dG1fdHJhaW5pbmdfcmVzZXJ2ZV92cmFtX2luaXQgLSBjcmVhdGUgYm8gdnJhbSBy
ZXNlcnZhdGlvbiBmcm9tIG1lbW9yeSB0cmFpbmluZw0KPj4gKyAqDQo+PiArICogQGFkZXY6IGFt
ZGdwdV9kZXZpY2UgcG9pbnRlcg0KPj4gKyAqDQo+PiArICogY3JlYXRlIGJvIHZyYW0gcmVzZXJ2
YXRpb24gZnJvbSBtZW1vcnkgdHJhaW5pbmcuDQo+PiArICovDQo+PiArc3RhdGljIGludCBhbWRn
cHVfdHRtX3RyYWluaW5nX3Jlc2VydmVfdnJhbV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KQ0KPj4gK3sNCj4+ICsJaW50IHJldDsNCj4+ICsJc3RydWN0IHBzcF9tZW1vcnlfdHJhaW5p
bmdfY29udGV4dCAqY3R4ID0gJmFkZXYtPnBzcC5tZW1fdHJhaW5fY3R4Ow0KPj4gKw0KPj4gKwlt
ZW1zZXQoY3R4LCAwLCBzaXplb2YoKmN0eCkpOw0KPj4gKwlpZiAoIWFkZXYtPmZ3X3ZyYW1fdXNh
Z2UubWVtX3RyYWluX3N1cHBvcnQpIHsNCj4+ICsJCURSTV9ERUJVRygibWVtb3J5IHRyYWluaW5n
IGRvZXMgbm90IHN1cHBvcnQhXG4iKTsNCj4+ICsJCXJldHVybiAwOw0KPj4gKwl9DQo+PiArDQo+
PiArCWN0eC0+YzJwX3RyYWluX2RhdGFfb2Zmc2V0ID0gYWRldi0+ZndfdnJhbV91c2FnZS5tZW1f
dHJhaW5fZmJfbG9jOw0KPj4gKwljdHgtPnAyY190cmFpbl9kYXRhX29mZnNldCA9IChhZGV2LT5n
bWMubWNfdnJhbV9zaXplIC0gR0REUjZfTUVNX1RSQUlOSU5HX09GRlNFVCk7DQo+PiArCWN0eC0+
dHJhaW5fZGF0YV9zaXplID0gR0REUjZfTUVNX1RSQUlOSU5HX0RBVEFfU0laRV9JTl9CWVRFUzsN
Cj4+ICsNCj4+ICsJRFJNX0RFQlVHKCJ0cmFpbl9kYXRhX3NpemU6JWxseCxwMmNfdHJhaW5fZGF0
YV9vZmZzZXQ6JWxseCxjMnBfdHJhaW5fZGF0YV9vZmZzZXQ6JWxseC5cbiIsDQo+PiArCQkgIGN0
eC0+dHJhaW5fZGF0YV9zaXplLA0KPj4gKwkJICBjdHgtPnAyY190cmFpbl9kYXRhX29mZnNldCwN
Cj4+ICsJCSAgY3R4LT5jMnBfdHJhaW5fZGF0YV9vZmZzZXQpOw0KPj4gKw0KPj4gKwlyZXQgPSBh
bWRncHVfYm9fY3JlYXRlX2tlcm5lbF9hdChhZGV2LA0KPj4gKwkJCQkJIGN0eC0+cDJjX3RyYWlu
X2RhdGFfb2Zmc2V0LA0KPj4gKwkJCQkJIGN0eC0+dHJhaW5fZGF0YV9zaXplLA0KPj4gKwkJCQkJ
IEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0sDQo+PiArCQkJCQkgJmN0eC0+cDJjX2JvLA0KPj4gKwkJ
CQkJIE5VTEwpOw0KPj4gKwlpZiAocmV0KSB7DQo+PiArCQlEUk1fRVJST1IoImFsbG9jIHAyY19i
byBmYWlsZWQoJWQpIVxuIiwgcmV0KTsNCj4+ICsJCXJldCA9IC1FTk9NRU07DQo+PiArCQlnb3Rv
IGVycl9vdXQ7DQo+PiArCX0NCj4gTkFLIQ0KPiBXaHkgYXJlIHlvdSByZS13cml0aW5nIHRoZSBl
cnJvciBjb2RlIGZyb20gImFtZGdwdV9ib19jcmVhdGVfa2VucmVsX2F0KCkiPw0KPiBQYXNzIHRo
ZSBlcnJvciBhcyBpcy4NCj4NCj4+ICsNCj4+ICsJcmV0ID0gYW1kZ3B1X2JvX2NyZWF0ZV9rZXJu
ZWxfYXQoYWRldiwNCj4+ICsJCQkJCSBjdHgtPmMycF90cmFpbl9kYXRhX29mZnNldCwNCj4+ICsJ
CQkJCSBjdHgtPnRyYWluX2RhdGFfc2l6ZSwNCj4+ICsJCQkJCSBBTURHUFVfR0VNX0RPTUFJTl9W
UkFNLA0KPj4gKwkJCQkJICZjdHgtPmMycF9ibywNCj4+ICsJCQkJCSBOVUxMKTsNCj4+ICsJaWYg
KHJldCkgew0KPj4gKwkJRFJNX0VSUk9SKCJhbGxvYyBjMnBfYm8gZmFpbGVkKCVkKSFcbiIsIHJl
dCk7DQo+PiArCQlyZXQgPSAtRU5PTUVNOw0KPj4gKwkJZ290byBlcnJfb3V0Ow0KPj4gKwl9DQo+
IE5BSyENCj4gV2h5IGFyZSB5b3UgcmUtd3JpdGluZyB0aGUgZXJyb3IgY29kZSBmcm9tICJhbWRn
cHVfYm9fY3JlYXRlX2tlbnJlbF9hdCgpIj8NCj4gUGFzcyB0aGUgZXJyb3IgYXMgaXMuDQo+DQo+
PiArDQo+PiArCWN0eC0+aW5pdCA9IFBTUF9NRU1fVFJBSU5fUkVTRVJWRV9TVUNDRVNTOw0KPj4g
KwlyZXR1cm4gMDsNCj4+ICsNCj4+ICtlcnJfb3V0Og0KPiBZZXMuLi4gd2VsbCAiZXJyX291dCIg
Y291bGQgYmUgYW55IGlkZW50aWZpZXIsIGluY2x1ZGluZw0KPiBhIHZhcmlhYmxlLCBhcyBvdXIg
dmFyaWFibGVzIGZvbGxvdyBzbmFrZS1ub3RhdGlvbiwgYWxsIGxvd2VyY2FzZS4NCj4NCj4gQmFj
ayBhdCB0aGUgdHVybiBvZiB0aGlzIGNlbnR1cnksIExpbnV4IGZvbGxvd2VkIGNhcGl0YWxpemVk
DQo+IGdvdG8gbGFiZWxzIHRvIGRpc3Rpbmd1aXNoIHRoZW0gZnJvbSBhbnl0aGluZyBlbHNlIGFy
b3VuZA0KPiBpbiB0aGUga2VybmVsIGNvZGU6DQo+DQo+IAlnb3RvIEJhZF9lcnI7DQo+IAkuLi4N
Cj4NCj4gCXJldHVybiAwOw0KPiBCYWRfZXJyOg0KPiAJcmV0dXJuIGJhZF9naWZ0Ow0KPiB9DQo+
DQo+IFRvIGRpc3Rpbmd1aXNoIHRoYXQgYSBjYXBpdGFsaXplZCBpZGVudGlmaWVyIGlzIGEgZ290
byBsYWJlbCwNCj4gIkJhZF9lcnIiIGFuZCBhbGwgbG93ZXItY2FzZSBsYWJlbCBpcyBqdXN0IGFu
b3RoZXIgdmFyaWFibGUNCj4gb3IgZnVuY3Rpb24gaWRlbnRpZmllciwgImJhZF9naWZ0Ii4NCj4N
Cj4gUmVnYXJkcywNCj4gTHViZW4NCj4NCj4+ICsJYW1kZ3B1X3R0bV90cmFpbmluZ19yZXNlcnZl
X3ZyYW1fZmluaShhZGV2KTsNCj4+ICsJcmV0dXJuIHJldDsNCj4+ICt9DQo+PiArDQo+PiAgIC8q
Kg0KPj4gICAgKiBhbWRncHVfdHRtX2luaXQgLSBJbml0IHRoZSBtZW1vcnkgbWFuYWdlbWVudCAo
dHRtKSBhcyB3ZWxsIGFzIHZhcmlvdXMNCj4+ICAgICogZ3R0L3ZyYW0gcmVsYXRlZCBmaWVsZHMu
DQo+PiBAQCAtMTc0MCw2ICsxODI3LDE0IEBAIGludCBhbWRncHVfdHRtX2luaXQoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpDQo+PiAgIAkJcmV0dXJuIHI7DQo+PiAgIAl9DQo+PiAgIA0KPj4g
KwkvKg0KPj4gKwkgKlRoZSByZXNlcnZlZCB2cmFtIGZvciBtZW1vcnkgdHJhaW5pbmcgbXVzdCBi
ZSBwaW5uZWQgdG8gdGhlIHNwZWNpZmllZA0KPj4gKwkgKnBsYWNlIG9uIHRoZSBWUkFNLCBzbyBy
ZXNlcnZlIGl0IGVhcmx5Lg0KPj4gKwkgKi8NCj4+ICsJciA9IGFtZGdwdV90dG1fdHJhaW5pbmdf
cmVzZXJ2ZV92cmFtX2luaXQoYWRldik7DQo+PiArCWlmIChyKQ0KPj4gKwkJcmV0dXJuIHI7DQo+
PiArDQo+PiAgIAkvKiBhbGxvY2F0ZSBtZW1vcnkgYXMgcmVxdWlyZWQgZm9yIFZHQQ0KPj4gICAJ
ICogVGhpcyBpcyB1c2VkIGZvciBWR0EgZW11bGF0aW9uIGFuZCBwcmUtT1Mgc2Nhbm91dCBidWZm
ZXJzIHRvDQo+PiAgIAkgKiBhdm9pZCBkaXNwbGF5IGFydGlmYWN0cyB3aGlsZSB0cmFuc2l0aW9u
aW5nIGJldHdlZW4gcHJlLU9TDQo+PiBAQCAtMTgyNSw2ICsxOTIwLDcgQEAgdm9pZCBhbWRncHVf
dHRtX2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+PiAgIAkJcmV0dXJuOw0KPj4g
ICANCj4+ICAgCWFtZGdwdV90dG1fZGVidWdmc19maW5pKGFkZXYpOw0KPj4gKwlhbWRncHVfdHRt
X3RyYWluaW5nX3Jlc2VydmVfdnJhbV9maW5pKGFkZXYpOw0KPj4gICAJYW1kZ3B1X3R0bV9md19y
ZXNlcnZlX3ZyYW1fZmluaShhZGV2KTsNCj4+ICAgCWlmIChhZGV2LT5tbWFuLmFwZXJfYmFzZV9r
YWRkcikNCj4+ICAgCQlpb3VubWFwKGFkZXYtPm1tYW4uYXBlcl9iYXNlX2thZGRyKTsNCj4+DQoN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
