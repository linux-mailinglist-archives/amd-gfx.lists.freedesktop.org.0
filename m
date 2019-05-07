Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFED16057
	for <lists+amd-gfx@lfdr.de>; Tue,  7 May 2019 11:16:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF2789D39;
	Tue,  7 May 2019 09:16:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730049.outbound.protection.outlook.com [40.107.73.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94E489D39
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 May 2019 09:16:10 +0000 (UTC)
Received: from MN2PR12MB3408.namprd12.prod.outlook.com (20.178.243.85) by
 MN2PR12MB3325.namprd12.prod.outlook.com (20.178.243.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.15; Tue, 7 May 2019 09:16:09 +0000
Received: from MN2PR12MB3408.namprd12.prod.outlook.com
 ([fe80::7042:de63:ed77:13b4]) by MN2PR12MB3408.namprd12.prod.outlook.com
 ([fe80::7042:de63:ed77:13b4%5]) with mapi id 15.20.1856.012; Tue, 7 May 2019
 09:16:09 +0000
From: "Huang, Trigger" <Trigger.Huang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 0/2] Skip IH re-route on Vega SR-IOV
Thread-Topic: [PATCH 0/2] Skip IH re-route on Vega SR-IOV
Thread-Index: AQHVBIqT3dm+73E6xUabPl0IXPMV0qZfRiaAgAACGvCAABZKgIAAAnyA
Date: Tue, 7 May 2019 09:16:08 +0000
Message-ID: <MN2PR12MB340898621D89278F50B643ADFE310@MN2PR12MB3408.namprd12.prod.outlook.com>
References: <1557202115-24444-1-git-send-email-Trigger.Huang@amd.com>
 <1b5b40b0-0d3c-8374-f423-5c50617fca9a@gmail.com>
 <MN2PR12MB34084FE909CDC9AF45A6D624FE310@MN2PR12MB3408.namprd12.prod.outlook.com>
 <3bc56691-9d61-8709-31a4-6ee98b79b397@gmail.com>
In-Reply-To: <3bc56691-9d61-8709-31a4-6ee98b79b397@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d9ce6aba-b481-4366-b10c-08d6d2cca43e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3325; 
x-ms-traffictypediagnostic: MN2PR12MB3325:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3325B69531E9B82BCDDC46A3FE310@MN2PR12MB3325.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0030839EEE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(39860400002)(376002)(346002)(366004)(189003)(199004)(13464003)(51914003)(486006)(8936002)(316002)(102836004)(110136005)(66066001)(14444005)(186003)(256004)(81156014)(86362001)(81166006)(53546011)(2501003)(478600001)(9686003)(5660300002)(53936002)(6306002)(229853002)(6506007)(14454004)(66574012)(6116002)(64756008)(66446008)(66556008)(66476007)(68736007)(446003)(11346002)(76116006)(2906002)(66946007)(73956011)(55016002)(476003)(8676002)(76176011)(6246003)(966005)(72206003)(6436002)(7736002)(305945005)(7696005)(99286004)(26005)(71190400001)(52536014)(3846002)(33656002)(25786009)(71200400001)(74316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3325;
 H:MN2PR12MB3408.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CZQg7bo5IdEkWS828ryGNXJia4SsZIBftfM2uhipZkNoRV8dfUTOC2+24vQQEJ2zy1o2uUwB/DzxZLRU6lkvT2zr23U2lpknc3BXG5D1BujO+xYRrFYzFxevzTywSaEvJwjvFaZr8wVL9MmXdjgCQqTRAzbX9IHHR5hJ3V585szBCoH7WI91YbSjnm0BSFWSQhBXUjgHqQ2pp+RWq89YjFcYHkSq7MqLb8O1AYnZf3tvZVK8CAq91aNmaR0kt1mia+omKJ1kScoQo/mGJk8w8BqXPMLzHayLczlgG+BYOgAi3/S+39ziTqTSF3hxrsOg36hny5Ig3WvYVTLzpHv2rF8YugH0qk152yErnB7K9+kem5HLfIYEuC0T6PVvzI/qDnXELG595E7BQzI2TmJC6ZLL3TsRRfkLag7u/82mSlA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ce6aba-b481-4366-b10c-08d6d2cca43e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2019 09:16:08.9296 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3325
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ebmD66igvthkyR/XV84zjC8qkhRH/LFzeRMhgViKOI=;
 b=udHhjpI67kym54zN00lXzICt7foRYTRvwlV6um1vIfUVCmru921rHNZFKM2OGRdpXQFK/rstfMhQ3+U35MKqZsGyyvT8d1LbT54b9bNYxq7QvcPZeCknPbvpg9MXZuCWq5h8ZvJyNg4gMeJlcx9YyqA8G+68pgeYll9vyCn8Q4g=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Trigger.Huang@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQpPSywgdGhhbmtzIGZvciB0aGUgZGV0YWlsZWQgYmFja2dyb3VuZCwgIGJlZm9yZSBJIGRpZG4n
dCAga25vdyB0aGUgbGltaXRhdGlvbiBpbiB0aGUgaGFyZHdhcmUuDQoNClRoYW5rcyAmIEJlc3Qg
V2lzaGVzLA0KVHJpZ2dlciBIdWFuZw0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJv
bTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IA0K
U2VudDogVHVlc2RheSwgTWF5IDA3LCAyMDE5IDU6MDQgUE0NClRvOiBIdWFuZywgVHJpZ2dlciA8
VHJpZ2dlci5IdWFuZ0BhbWQuY29tPjsgS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2Vu
aWdAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpTdWJqZWN0OiBSZTog
W1BBVENIIDAvMl0gU2tpcCBJSCByZS1yb3V0ZSBvbiBWZWdhIFNSLUlPVg0KDQpbQ0FVVElPTjog
RXh0ZXJuYWwgRW1haWxdDQoNCkhpIFRyaWdnZXIsDQoNCj4gQW5kIHNlZSB0aGlzIGludGVycnVw
dCBpcyBzdGlsbCBmcm9tIElIMCBhbWRncHVfaXJxX2hhbmRsZXIsIHdoaWNoIGNhbiBwcm92ZSB0
aGlzIGZlYXR1cmUgaXMgbm90IHdvcmtpbmcgdW5kZXIgU1ItSU9WLg0KSW4gdGhpcyBjYXNlIHRo
aXMgY2hhbmdlIGlzIGEgY2xlYXIgTkFLLg0KDQo+IEkgc3VnZ2VzdCB0byByZW1vdmUgdGhpcyBm
ZWF0dXJlIGZyb20gU1ItSU9WLCBhcyBteSBjb25jZXJuIGlzLCAgc29tZSB3ZWlyZCBidWdzIG1h
eSBiZSBjYXNlZCBieSBpdCBpbiB0aGUgVmlydHVhbGl6YXRpb24gaGVhdnkgc3RyZXNzIHRlc3Qu
DQpBbmQgSSByZWFsbHkgdGhpbmsgd2Ugc2hvdWxkIGtlZXAgaXQgdG8gbWFrZSBzdXJlIHRoYXQg
d2UgaGF2ZSB0aGUgc2FtZSBoYW5kbGluZyBmb3IgYmFyZSBtZXRhbCBhcyBmb3IgU1JJT1YuDQoN
Cj4gSW4gdGhlIGZ1dHVyZSwgbWF5YmUgd2UgY2FuIHJlcXVlc3QgUFNQIHRlYW0gdG8gYWRkIHRo
aXMgc3VwcG9ydCBmb3IgU1ItSU9WLg0KV2Ugd2lsbCBuZXZlciBiZSBhYmxlIHRvIHVzZSB0aGlz
IHVuZGVyIFNSSU9WIGJlY2F1c2Ugb2YgbGltaXRhdGlvbiBpbiB0aGUgaGFyZHdhcmUuDQoNCldo
YXQgd2UgY291bGQgbWF5YmUgZG8gaXMgY2hlY2sgdGhlIHJlc3BvbnNlIGNvZGUgZnJvbSB0aGUg
UFNQIGZpcm13YXJlIGlmIGl0IGNvcnJlY3RseSBpZ25vcmVkIHRoZSBjb21tYW5kcyB1bmRlciBT
Ui1JT1YsIGJ1dCBJIHRoaW5rIHRoZSByZXNwb25zZSBjb2RlIGlzIHRoZSBzYW1lIGZvciBpZ25v
cmluZyBhcyBmb3IgZXhlY3V0aW5nIHRoZSBjb21tYW5kcy4NCg0KUmVnYXJkcywNCkNocmlzdGlh
bi4NCg0KQW0gMDcuMDUuMTkgdW0gMTA6NTQgc2NocmllYiBIdWFuZywgVHJpZ2dlcjoNCj4gSGkg
Q2hyaXN0aWFuLA0KPg0KPiBPbiBWZWdhMTAgU1ItSU9WIFZGLCBJIGluamVjdGVkIGEgJ3JlYWwn
IFZNQyBwYWdlIGZhdWx0IGZyb20gdXNlciBzcGFjZSwgdXNpbmcgdGhlIG1vZGlmaWVkIGFtZGdw
dV90ZXN0Lg0KPiBbICAgMTkuMTI3ODc0XSBhbWRncHUgMDAwMDowMDowOC4wOiBbZ2Z4aHViXSBu
by1yZXRyeSBwYWdlIGZhdWx0IChzcmNfaWQ6MCByaW5nOjE3NCB2bWlkOjEgcGFzaWQ6MzI3Njgs
IGZvciBwcm9jZXNzIGFtZGdwdV90ZXN0IHBpZCAxMDcxIHRocmVhZCBhbWRncHVfdGVzdCBwaWQg
MTA3MSkNCj4gWyAgIDE5LjEzMDAzN10gYW1kZ3B1IDAwMDA6MDA6MDguMDogICBpbiBwYWdlIHN0
YXJ0aW5nIGF0IGFkZHJlc3MgMHgwMDAwMDAwODAwMDAwMDAwIGZyb20gMjcNCj4NCj4gQW5kIHNl
ZSB0aGlzIGludGVycnVwdCBpcyBzdGlsbCBmcm9tIElIMCBhbWRncHVfaXJxX2hhbmRsZXIsIHdo
aWNoIGNhbiBwcm92ZSB0aGlzIGZlYXR1cmUgaXMgbm90IHdvcmtpbmcgdW5kZXIgU1ItSU9WLg0K
Pg0KPiBJIHN1Z2dlc3QgdG8gcmVtb3ZlIHRoaXMgZmVhdHVyZSBmcm9tIFNSLUlPViwgYXMgbXkg
Y29uY2VybiBpcywgIHNvbWUgd2VpcmQgYnVncyBtYXkgYmUgY2FzZWQgYnkgaXQgaW4gdGhlIFZp
cnR1YWxpemF0aW9uIGhlYXZ5IHN0cmVzcyB0ZXN0Lg0KPiBJbiB0aGUgZnV0dXJlLCBtYXliZSB3
ZSBjYW4gcmVxdWVzdCBQU1AgdGVhbSB0byBhZGQgdGhpcyBzdXBwb3J0IGZvciBTUi1JT1YuDQo+
DQo+IFRoYW5rcyAmIEJlc3QgV2lzaGVzLA0KPiBUcmlnZ2VyIEh1YW5nDQo+DQo+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IENocmlzdGlhbiBLw7ZuaWcgPGNrb2VuaWcubGVp
Y2h0enVtZXJrZW5AZ21haWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBNYXkgMDcsIDIwMTkgMzoz
NyBQTQ0KPiBUbzogSHVhbmcsIFRyaWdnZXIgPFRyaWdnZXIuSHVhbmdAYW1kLmNvbT47IA0KPiBh
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDAvMl0g
U2tpcCBJSCByZS1yb3V0ZSBvbiBWZWdhIFNSLUlPVg0KPg0KPiBbQ0FVVElPTjogRXh0ZXJuYWwg
RW1haWxdDQo+DQo+IFdlIGludGVudGlvbmFsbHkgZGlkbid0IGRvIHRoaXMgdG8gbWFrZSBzdXJl
IHRoYXQgdGhlIGNvbW1hbmRzIGFyZSBpZ25vcmVkIGJ5IHRoZSBQU1AgZmlybXdhcmUuDQo+DQo+
IEkgaGF2ZSBubyBzdHJvbmcgb3BpbmlvbiBvbiBpZiB3ZSBzaG91bGQgZG8gdGhpcyBvciBub3Qs
IGJ1dCB0aGUgUFNQIGZpcm13YXJlIGd1eXMgbWlnaHQgaGF2ZS4NCj4NCj4gQ2hyaXN0aWFuLg0K
Pg0KPiBBbSAwNy4wNS4xOSB1bSAwNjowOCBzY2hyaWViIFRyaWdnZXIgSHVhbmc6DQo+PiBJSCBy
ZS1yb3V0ZSBpcyBub3Qgc3VwcG9ydGVkIG9uIFZlZ2EgU1ItSU9WLCBuZWVkIHRvIGJlIHNraXBw
ZWQNCj4+DQo+PiBUcmlnZ2VyIEh1YW5nICgyKToNCj4+ICAgICBkcm0vYW1kZ3B1OiBTa2lwIElI
IHJlcm91dGUgaW4gVmVnYTEwIFNSLUlPViBWRg0KPj4gICAgIGRybS9hbWRncHU6IFNraXAgSUgg
cmVyb3V0ZSBpbiBWZWdhMjAgU1ItSU9WIFZGDQo+Pg0KPj4gICAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvcHNwX3YxMV8wLmMgfCA0ICsrKysNCj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3BzcF92M18xLmMgIHwgNCArKysrDQo+PiAgICAyIGZpbGVzIGNoYW5nZWQsIDggaW5z
ZXJ0aW9ucygrKQ0KPj4NCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18NCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
