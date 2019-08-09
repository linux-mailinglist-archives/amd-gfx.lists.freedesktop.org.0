Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E7B87CCD
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 16:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F876EE17;
	Fri,  9 Aug 2019 14:36:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710064.outbound.protection.outlook.com [40.107.71.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F586EE17
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 14:36:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASwwOZ4DEDAaJh5VjhULLZuzNAfhqX1jbKvW2loP3QdfEhvNaQ7GZ4S2xwi3UC7+X1fFBn+wK8czej/i7X+PpxFaT0SaXGzJBfYdvswQXI8+xD9ymhkdfBOiNxi/QBAn7Yr78gm+JTN4ZzqsxmAlsvJheCcutBBzwZkMASQFYIvlGadKWQFWD4EthRIG05JdEFQoRIj+34RMQ4PkLZdIq1nhX7EQLXJiLlgP+dJIXDXlXIy/mJ+yy9pcVv31Y/OTi66eAZ+MdP/Df8mC6ZMj/HgjZpRIgAU2qZfI/vLpRfP2CNw/08bt73IjV/AO48EL71RtU6fk7radXl24JrqEFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hArWaKV6BkjutIe9c4/VnNDnKWkNvdqSH++C/VlthMo=;
 b=JNnns7ZaSOGz6goNoCSaxqB63UkGznC/mTlBY+MOoPVzIud86lncA0N9ZnG0/sRLNYpEXKiDfeqv29Rx3GnuD2aMYixqi19bYTuW1AeyySZ9LR+AiiCnpP8qoXjvj/58dizvMokK7vwI1qsL+epar83LawohuH0klos5ytreNKb6+KHfayIA+u9gfErHIckGryE1U3oQeqcaxU5w1l3q5NBxH9ihLXFdGgsxcKylvlgU565tpo+xs0m7sFgTt9z1JSzTuB/TxxBKCxBhURncQGYsSlH27BrzUqx4yW20oH45Yup1olY4+DNfr9Ph2a5hMT+qpVHFiGpIVpzNc7nA3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1913.namprd12.prod.outlook.com (10.175.88.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.15; Fri, 9 Aug 2019 14:36:10 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89%12]) with mapi id 15.20.2157.015; Fri, 9 Aug 2019
 14:36:10 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 4/5] drm/amdgpu: Support snooped PTE flag
Thread-Topic: [PATCH 4/5] drm/amdgpu: Support snooped PTE flag
Thread-Index: AQHVTlhbNx5L6PBwCES2C6piVhXYjabyv/uAgAAfgACAAANggA==
Date: Fri, 9 Aug 2019 14:36:10 +0000
Message-ID: <98ca07a4-acc5-ab38-17b7-710d84a3229d@amd.com>
References: <1565316926-19516-1-git-send-email-Oak.Zeng@amd.com>
 <1565316926-19516-4-git-send-email-Oak.Zeng@amd.com>
 <88fad585-ad1b-bca9-7079-d79896def19c@amd.com>
 <BL0PR12MB25801EB371ADC1E82ED6AEA180D60@BL0PR12MB2580.namprd12.prod.outlook.com>
In-Reply-To: <BL0PR12MB25801EB371ADC1E82ED6AEA180D60@BL0PR12MB2580.namprd12.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0171.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::15) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d81bfb97-c271-4b1f-a9ec-08d71cd6eba7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1913; 
x-ms-traffictypediagnostic: DM5PR12MB1913:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB19138A2D04F6945C88B3B57083D60@DM5PR12MB1913.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:279;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(13464003)(189003)(199004)(99286004)(4326008)(229853002)(2906002)(65956001)(14454004)(31696002)(86362001)(31686004)(65826007)(65806001)(76176011)(52116002)(36756003)(46003)(478600001)(102836004)(71200400001)(71190400001)(6246003)(25786009)(7736002)(386003)(6506007)(53546011)(8676002)(53936002)(186003)(305945005)(256004)(81156014)(14444005)(6512007)(5660300002)(64756008)(66946007)(2616005)(66446008)(66556008)(8936002)(2501003)(66476007)(6436002)(81166006)(6116002)(11346002)(446003)(486006)(476003)(6486002)(110136005)(64126003)(54906003)(58126008)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1913;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: X25DyUA9quMwKFVb/H2dzjaJUPCGTtgLVBLZpFCanr6azLuyOBiVPe14o7QdG82Xf0TSIlGjxVLJXSoioZX7xIC0bMqz3t6ULmK+iuocCXj8bIb7YNNjXmB5D0IwkzpMtukymmUPCtXj4IzO3hh5zjohne7R2wo/wgqKlaEHi4xEEeUfdEvirOkT2m0PqEEh9cif34iUB7tWBxRFmxpadvNGRmkHdP0OFZGi/Iu6c1I1R8kiH8j03GcAiSq0bekXuqW7i6bdFb6nidgEooUUj23yKKF3wpRm2cfkSpoSz6gnig3B0MGLIumqgS0yF8g4IMku27A3CZHNPRCaGja3h1xkoY6a/xgB/TdjbQD/2uapjY6AH29owIOgNtFkY4QIhV3kc9pW7mJVMOF+faVCx8pjk1euFk5hUprPG1teuMA=
Content-ID: <938E28B59ADD234D81FF54AD4F890B90@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d81bfb97-c271-4b1f-a9ec-08d71cd6eba7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 14:36:10.0936 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /+/OfPxXQ7kie6ZZQGwxFzSOCL/IHKQBOHGi4oVCdfYoR9TsU8plQ82kxlCsbiiE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1913
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hArWaKV6BkjutIe9c4/VnNDnKWkNvdqSH++C/VlthMo=;
 b=Ov0GY2SdKwK1GXn3CqC9cLxKkqrsVD1f4N9bPC+CqaxuYjSP7kz3CCBgkaZeJYXm+hFzaksjFYfsYvCfp2/gNDCATR2roObLJIv8X2PX43S+xETftM0uMwsVWmdpOaGMCWlTOD5PpcRhjcx41Qyz6ijVStK+OWSjKf0hIpteMz0=
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Keely,
 Sean" <Sean.Keely@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDkuMDguMTkgdW0gMTY6MjQgc2NocmllYiBaZW5nLCBPYWs6DQo+DQo+IFJlZ2FyZHMsDQo+
IE9haw0KPg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLb2VuaWcsIENo
cmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPg0KPiBTZW50OiBGcmlkYXksIEF1Z3Vz
dCA5LCAyMDE5IDg6MzEgQU0NCj4gVG86IFplbmcsIE9hayA8T2FrLlplbmdAYW1kLmNvbT47IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBLdWVobGluZywgRmVsaXggPEZlbGl4
Lkt1ZWhsaW5nQGFtZC5jb20+OyBLZWVseSwgU2VhbiA8U2Vhbi5LZWVseUBhbWQuY29tPg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIDQvNV0gZHJtL2FtZGdwdTogU3VwcG9ydCBzbm9vcGVkIFBURSBm
bGFnDQo+DQo+IEFtIDA5LjA4LjE5IHVtIDA0OjE1IHNjaHJpZWIgWmVuZywgT2FrOg0KPj4gU2V0
IHNub29wZWQgUFRFIGZsYWcgYWNjb3JkaW5nIHRvIG1hcHBpbmcgZmxhZy4gV3JpdGUgcmVxdWVz
dCB0byBhDQo+PiBwYWdlIHdpdGggc25vb3BlZCBiaXQgc2V0LCB3aWxsIHNlbmQgb3V0IGludmFs
aWRhdGUgcHJvYmUgcmVxdWVzdCB0bw0KPj4gVENDIG9mIHRoZSByZW1vdGUgR1BVIHdoZXJlIHRo
ZSB2cmFtIHBhZ2UgcmVzaWRlcy4NCj4+DQo+PiBDaGFuZ2UtSWQ6IEk3OTlmNjhlYzdhNWExYWJm
MzIwNzVmNWVmMzEwNTE2NDFhMGIzNzM2DQo+PiBTaWduZWQtb2ZmLWJ5OiBPYWsgWmVuZyA8T2Fr
LlplbmdAYW1kLmNvbT4NCj4+IC0tLQ0KPj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z21jX3Y5XzAuYyB8IDMgKysrDQo+PiAgICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8w
LmMNCj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYw0KPj4gaW5kZXgg
ZDcwOTkwMi4uOGZhZWFkMyAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dtY192OV8wLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192
OV8wLmMNCj4+IEBAIC01OTksNiArNTk5LDkgQEAgc3RhdGljIHVpbnQ2NF90IGdtY192OV8wX2dl
dF92bV9wdGVfZmxhZ3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+PiAgICAJaWYgKGZs
YWdzICYgQU1ER1BVX1ZNX1BBR0VfUFJUKQ0KPj4gICAgCQlwdGVfZmxhZyB8PSBBTURHUFVfUFRF
X1BSVDsNCj4+ICAgIA0KPj4gKwlpZiAoZmxhZ3MgJiBBTURHUFVfVk1fUEFHRV9JTlZBTElEQVRF
X1BST0JFKQ0KPj4gKwkJcHRlX2ZsYWcgfD0gQU1ER1BVX1BURV9TTk9PUEVEOw0KPj4gKw0KPiBT
dGlsbCBhIE5BSywgd2UgYWJzb2x1dGVseSBuZWVkIGEgY2hlY2sgaGVyZSB0aGF0IHRoaXMgaXMg
b25seSBzZXQgd2hlbiB0aGUgQk8gaXMgaW4gWEdNSS4NCj4NCj4gW09ha106IFBlciBkaXNjdXNz
aW9uIHdpdGggdXBwZXIgbGF5ZXIgc3RhY2ssIHJlbW90ZSB2cmFtIG1hcHBpbmcgKGVpdGhlciBv
dmVyIFBDSWUgb3IgWEdNSSkgc2hvdWxkIGFsd2F5cyBpbnZhbGlkYXRlIHByb2JlIHRoZSBjYWNo
ZSBsaW5lcyBvZiBHUFUgd2hvIG93bnMgdGhlIG1lbW9yeSBvYmplY3QuDQoNClRoZW4gd2UgY2Fu
IGp1c3QgZHJvcCB0aGUgQU1ER1BVX1ZNX1BBR0VfSU5WQUxJREFURV9QUk9CRSBmbGFnLg0KDQpC
dXQgdGhlIHByb2JsZW0gaXMgc29tZXRoaW5nIGVudGlyZWx5IGRpZmZlcmVudCwgdGhlIFBURV9T
Tk9PUEVEIGZsYWcgDQpoYXMgZGlmZmVyZW50IG1lYW5pbmcgZGVwZW5kaW5nIG9uIGlmIHRoZSB0
cmFuc2FjdGlvbiBpcyByb3V0ZWQgdG8gWEdNSSANCm9yIFBDSWUuDQoNCkZvciBYR01JIHRoZSBm
bGFnIHRyaWdnZXJzIGludmFsaWRhdGUgcHJvYmUgb24gdGhlIHJlbW90ZSBHUFUsIGJ1dCBmb3Ig
DQpQQ0llIGl0IGNvbnRyb2xzIENQVSBjYWNoZSBzbm9vcGluZy4NCg0KQW5kIHRoZSBDUFUgY2Fj
aGUgc25vb3BpbmcgZmxhZ3Mgb2YgdGhlIGRldmljZXMgYW5kIGhvc3QgbXVzdCBtYXRjaCBvciAN
Cm90aGVyd2lzZSB5b3UgcnVuIGludG8gYSBoZWxsIGxvdCBvZiBwcm9ibGVtcyBvbiBzb21lIGFy
Y2hpdGVjdHVyZXMuDQoNClNvIHdlIGNhbiBvbmx5IGFsbG93IHNldHRpbmcgdGhlIHNub29wZWQg
ZmxhZyBoZXJlIHdoZW4gdGhhdCBQVEUgaXMgDQpyZWFsbHkgcG9pbnRpbmcgdG8gWEdNSS4NCg0K
UmVnYXJkcywNCkNocmlzdGlhbi4NCg0KPg0KPiBDaHJpc3RpYW4uDQo+DQo+PiAgICAJcmV0dXJu
IHB0ZV9mbGFnOw0KPj4gICAgfQ0KPj4gICAgDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
