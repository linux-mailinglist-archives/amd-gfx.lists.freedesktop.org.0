Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4D1A63CA
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 10:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87BCE897B5;
	Tue,  3 Sep 2019 08:24:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on0608.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::608])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F1B897B5;
 Tue,  3 Sep 2019 08:24:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l8VlpRTD7duuJBvrOUQ3VVyovlQ05xKe3mXBDMSwBIh1nBpgQ9laLG9161vPn6W4bIg5NvmqHAthCpEWA3s73p7ETlShoGMJQ8ZExmAlpiWgw42tPY1JZAeuE6bL6FyXfBCPfqNR4/yONaVyBEAiTE93XxQ1IldM8y6OtnkS2HE9Y9d8Rfqjj6ZJHLabqA2bMtZ/X7J4sNJrssDg3UvZLBDO534Ga/eWRjJA3MDg339Soy1cYSILdL8dAhtgyctUW4DXrzOTajijOmT9boyJTScCt1MrHLbbXNEhBnRQ3k9B6L0wwL3g34eA8F+DL24oBcpnS4uZ95uXXbnJgVjlNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2NIWnBb6uO6KnTmyNjCnXD5Wf7KfkB3xOn3lJ7B/rA=;
 b=CaJrVCW18QQBlhm42i9Jz6JBoxUUc2d8SZ1usz9/YEssYqFyIJW+7b8C2LpPIX10tG06QLM0i9lSY0k56SPA4I6j33qh1l3bjVLP3Yud9muxK+988hALHkBkPoRj4+uwzrEzWzQo1Uq6Un/Acga1mVwMfLcWRqK50toDRSf6BuQjHHJmUplUbfyOiSPlBG9t0lFyx7wy4+4QNbiGENWGMjSyOSmKJGfGi/SFwqZCP8/rMCM6UtL06BbLQmbcZgqQCamEfkjsLlXAW/aovmttVjahl1vmc0C5iXBPdfS4zl5JTr3Tqug3vDQJ0ucAh4FYv4YFY8UxLAgKleN18iDTTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2343.namprd12.prod.outlook.com (52.132.140.166) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16; Tue, 3 Sep 2019 08:24:30 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2220.022; Tue, 3 Sep 2019
 08:24:30 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>, "Ho, Kenny" <Kenny.Ho@amd.com>
Subject: Re: [PATCH RFC v4 00/16] new cgroup controller for gpu/drm subsystem
Thread-Topic: [PATCH RFC v4 00/16] new cgroup controller for gpu/drm subsystem
Thread-Index: AQHVXi/LnajOLv3OCUKQAozn0zrbR6cZn26AgAAGLYA=
Date: Tue, 3 Sep 2019 08:24:30 +0000
Message-ID: <f8d561b9-091e-2f74-944f-38230195eea8@amd.com>
References: <20190829060533.32315-1-Kenny.Ho@amd.com>
 <20190903080217.GL2112@phenom.ffwll.local>
In-Reply-To: <20190903080217.GL2112@phenom.ffwll.local>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: MR2P264CA0125.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::17) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 29057928-2b24-4f2f-abe0-08d73048248e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2343; 
x-ms-traffictypediagnostic: DM5PR12MB2343:
x-ms-exchange-purlcount: 11
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB2343F570752ADB21337CDBB583B90@DM5PR12MB2343.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(136003)(376002)(366004)(396003)(199004)(189003)(186003)(446003)(6512007)(81166006)(6306002)(5660300002)(4326008)(110136005)(54906003)(229853002)(99286004)(14454004)(6506007)(386003)(76176011)(478600001)(81156014)(25786009)(8676002)(58126008)(6246003)(316002)(14444005)(86362001)(36756003)(71190400001)(71200400001)(6436002)(102836004)(7736002)(66946007)(6116002)(66476007)(66556008)(64756008)(46003)(66446008)(31686004)(53936002)(2906002)(8936002)(31696002)(256004)(6486002)(2616005)(476003)(11346002)(486006)(52116002)(305945005)(6636002)(966005)(65806001)(65956001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2343;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0P6Qn18bB16XqyBZ91Ch3ojxWNS+6h3SJ3fRda9GTN251xjc9vmyThfulloJ6w13zeL8m3NSOtRtzIH4wYd6AIcM9CYqKIjEs1o9cekMjPxdkt/cTYZOylzs6WrsGkx1VZwixBmlammQvNcZV8GxAM3hlzBs7txsVxul1bpkEQf0ubm0kDGaYV663k4A2pteb7KbZ/UQhviLiGi5WLNFjrI3AeCjlGNepFb8OfFYf/Trpgh25KalzDIrXecvHJx3Zepc88JRhYKIVcIOwFfnVryjJ+DSRpi9Bi0DvsVqpXf1/L5T/tPOWXDJaz8J375ST1fmpfAH1PDoSm1QmS6jDsMJoTJSs/PuTEmEn+GSBJwGSa5u3WtR1zwfNzPNIoP5k4qs/bO4toLNrVJZn+Bz+WkorZAo8tRGpXkmai/Ly9k=
Content-ID: <276F7F89A3238447B388F7101FC4C977@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29057928-2b24-4f2f-abe0-08d73048248e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 08:24:30.7681 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hmG2YbF11c4BJJbCercHF0bucQH9YKrzBVexY10c4QamnpLJgmZZyD52Mi/xb4um
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2343
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2NIWnBb6uO6KnTmyNjCnXD5Wf7KfkB3xOn3lJ7B/rA=;
 b=pljuqOkuVZwuVnB2CMqVgWmLIEoFQhbDQR/8SMdtGRHexn/HiAngGHkyQIsIX/Lc8aHhBh5d8Eczhqps6gS1fGBZmjI59TG8TuWRdd1f4rn5r8LyoB1OMvW0Ld62ulfyGyYlH5sn3on0pfkQA5921k5IPhaqiCXAQIejsJb9Xk8=
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "jsparks@cray.com" <jsparks@cray.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "lkaplan@cray.com" <lkaplan@cray.com>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>, "y2kenny@gmail.com" <y2kenny@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Greathouse, Joseph" <Joseph.Greathouse@amd.com>,
 "tj@kernel.org" <tj@kernel.org>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDMuMDkuMTkgdW0gMTA6MDIgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBPbiBUaHUsIEF1
ZyAyOSwgMjAxOSBhdCAwMjowNToxN0FNIC0wNDAwLCBLZW5ueSBIbyB3cm90ZToNCj4+IFRoaXMg
aXMgYSBmb2xsb3cgdXAgdG8gdGhlIFJGQyBJIG1hZGUgcHJldmlvdXNseSB0byBpbnRyb2R1Y2Ug
YSBjZ3JvdXANCj4+IGNvbnRyb2xsZXIgZm9yIHRoZSBHUFUvRFJNIHN1YnN5c3RlbSBbdjEsdjIs
djNdLiAgVGhlIGdvYWwgaXMgdG8gYmUgYWJsZSB0bw0KPj4gcHJvdmlkZSByZXNvdXJjZSBtYW5h
Z2VtZW50IHRvIEdQVSByZXNvdXJjZXMgdXNpbmcgdGhpbmdzIGxpa2UgY29udGFpbmVyLg0KPj4N
Cj4+IFdpdGggdGhpcyBSRkMgdjQsIEkgYW0gaG9waW5nIHRvIGhhdmUgc29tZSBjb25zZW5zdXMg
b24gYSBtZXJnZSBwbGFuLiAgSSBiZWxpZXZlDQo+PiB0aGUgR0VNIHJlbGF0ZWQgcmVzb3VyY2Vz
IChkcm0uYnVmZmVyLiopIGludHJvZHVjZWQgaW4gcHJldmlvdXMgUkZDIGFuZCwNCj4+IGhvcGVm
dWxseSwgdGhlIGxvZ2ljYWwgR1BVIGNvbmNlcHQgKGRybS5sZ3B1LiopIGludHJvZHVjZWQgaW4g
dGhpcyBSRkMgYXJlDQo+PiB1bmNvbnRyb3ZlcnNpYWwgYW5kIHJlYWR5IHRvIG1vdmUgb3V0IG9m
IFJGQyBhbmQgaW50byBhIG1vcmUgZm9ybWFsIHJldmlldy4gIEkNCj4+IHdpbGwgY29udGludWUg
dG8gd29yayBvbiB0aGUgbWVtb3J5IGJhY2tlbmQgcmVzb3VyY2VzIChkcm0ubWVtb3J5LiopLg0K
Pj4NCj4+IFRoZSBjb3ZlciBsZXR0ZXIgZnJvbSB2MSBpcyBjb3BpZWQgYmVsb3cgZm9yIHJlZmVy
ZW5jZS4NCj4+DQo+PiBbdjFdOiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZl
cy9kcmktZGV2ZWwvMjAxOC1Ob3ZlbWJlci8xOTcxMDYuaHRtbA0KPj4gW3YyXTogaHR0cHM6Ly93
d3cuc3Bpbmljcy5uZXQvbGlzdHMvY2dyb3Vwcy9tc2cyMjA3NC5odG1sDQo+PiBbdjNdOiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9hbWQtZ2Z4LzIwMTktSnVuZS8wMzYw
MjYuaHRtbA0KPiBTbyBsb29raW5nIGF0IGFsbCB0aGlzIGRvZXNuJ3Qgc2VlbSB0byBoYXZlIGNo
YW5nZWQgbXVjaCwgYW5kIHRoZSBvbGQNCj4gZGlzY3Vzc2lvbiBkaWRuJ3QgcmVhbGx5IGNvbmNs
dWRlIGFueXdoZXJlIChhc2lkZSBmcm9tIHNvbWUgZGV0YWlscykuDQo+DQo+IE9uZSBtb3JlIG9w
ZW4gdGhvdWdoIHRoYXQgY3Jvc3NlZCBteSBtaW5kLCBoYXZpbmcgcmVhZCBhIHRvbiBvZiB0dG0g
YWdhaW4NCj4gcmVjZW50bHk6IEhvdyBkb2VzIHRoaXMgYWxsIGludGVyYWN0IHdpdGggdHRtIGds
b2JhbCBsaW1pdHM/IEknZCBzYXkgdGhlDQo+IHR0bSBnbG9iYWwgbGltaXRzIGlzIHRoZSB1ci1j
Z3JvdXBzIHdlIGhhdmUgaW4gZHJtLCBhbmQgbm90IGxvb2tpbmcgYXQNCj4gdGhhdCBzZWVtcyBr
aW5kYSBiYWQuDQoNCkF0IGxlYXN0IG15IGhvcGUgd2FzIHRvIGNvbXBsZXRlbHkgcmVwbGFjZSB0
dG0gZ2xvYmFscyB3aXRoIHRob3NlIA0KbGltaXRhdGlvbnMgaGVyZSB3aGVuIGl0IGlzIHJlYWR5
Lg0KDQpDaHJpc3RpYW4uDQoNCj4gLURhbmllbA0KPg0KPj4gdjQ6DQo+PiBVbmNoYW5nZWQgKG5v
IHJldmlldyBuZWVkZWQpDQo+PiAqIGRybS5tZW1vcnkuKi90dG0gcmVzb3VyY2VzIChQYXRjaCA5
LTEzLCBJIGFtIHN0aWxsIHdvcmtpbmcgb24gbWVtb3J5IGJhbmR3aWR0aA0KPj4gYW5kIHNocmlu
a2VyKQ0KPj4gQmFzZSBvbiBmZWVkYmFja3Mgb24gdjM6DQo+PiAqIHVwZGF0ZSBub21pbmNsYXR1
cmUgdG8gZHJtY2cNCj4+ICogZW1iZWQgcGVyIGRldmljZSBkcm1jZyBwcm9wZXJ0aWVzIGludG8g
ZHJtX2RldmljZQ0KPj4gKiBzcGxpdCBHRU0gYnVmZmVyIHJlbGF0ZWQgY29tbWl0cyBpbnRvIHN0
YXRzIGFuZCBsaW1pdA0KPj4gKiByZW5hbWUgZnVuY3Rpb24gbmFtZSB0byBhbGlnbiB3aXRoIGNv
bnZlbnRpb24NCj4+ICogY29tYmluZWQgYnVmZmVyIGFjY291bnRpbmcgYW5kIGNoZWNrIGludG8g
YSB0cnlfY2hhcmdlIGZ1bmN0aW9uDQo+PiAqIHN1cHBvcnQgYnVmZmVyIHN0YXRzIHdpdGhvdXQg
bGltaXQgZW5mb3JjZW1lbnQNCj4+ICogcmVtb3ZlZCBHRU0gYnVmZmVyIHNoYXJpbmcgbGltaXRh
dGlvbg0KPj4gKiB1cGRhdGVkIGRvY3VtZW50YXRpb25zDQo+PiBOZXcgZmVhdHVyZXM6DQo+PiAq
IGludHJvZHVjaW5nIGxvZ2ljYWwgR1BVIGNvbmNlcHQNCj4+ICogZXhhbXBsZSBpbXBsZW1lbnRh
dGlvbiB3aXRoIEFNRCBLRkQNCj4+DQo+PiB2MzoNCj4+IEJhc2Ugb24gZmVlZGJhY2tzIG9uIHYy
Og0KPj4gKiByZW1vdmVkIC5oZWxwIHR5cGUgZmlsZSBmcm9tIHYyDQo+PiAqIGNvbmZvcm0gdG8g
Y2dyb3VwIGNvbnZlbnRpb24gZm9yIGRlZmF1bHQgYW5kIG1heCBoYW5kbGluZw0KPj4gKiBjb25m
b3JtIHRvIGNncm91cCBjb252ZW50aW9uIGZvciBhZGRyZXNzaW5nIGRldmljZSBzcGVjaWZpYyBs
aW1pdHMgKHdpdGggbWFqb3I6bWlub3IpDQo+PiBOZXcgZnVuY3Rpb246DQo+PiAqIGFkb3B0ZWQg
bWVtcGFyc2UgZm9yIG1lbW9yeSBzaXplIHJlbGF0ZWQgYXR0cmlidXRlcw0KPj4gKiBhZGRlZCBt
YWNybyB0byBtYXJzaGFsbCBkcm1jZ3JwIGNmdHlwZSBwcml2YXRlICAoRFJNQ0dfQ1RGX1BSSVYs
IGV0Yy4pDQo+PiAqIGFkZGVkIHR0bSBidWZmZXIgdXNhZ2Ugc3RhdHMgKHBlciBjZ3JvdXAsIGZv
ciBzeXN0ZW0sIHR0LCB2cmFtLikNCj4+ICogYWRkZWQgdHRtIGJ1ZmZlciB1c2FnZSBsaW1pdCAo
cGVyIGNncm91cCwgZm9yIHZyYW0uKQ0KPj4gKiBhZGRlZCBwZXIgY2dyb3VwIGJhbmR3aWR0aCBz
dGF0cyBhbmQgbGltaXRpbmcgKGJ1cnN0IGFuZCBhdmVyYWdlIGJhbmR3aWR0aCkNCj4+DQo+PiB2
MjoNCj4+ICogUmVtb3ZlZCB0aGUgdmVuZG9yaW5nIGNvbmNlcHRzDQo+PiAqIEFkZCBsaW1pdCB0
byB0b3RhbCBidWZmZXIgYWxsb2NhdGlvbg0KPj4gKiBBZGQgbGltaXQgdG8gdGhlIG1heGltdW0g
c2l6ZSBvZiBhIGJ1ZmZlciBhbGxvY2F0aW9uDQo+Pg0KPj4gdjE6IGNvdmVyIGxldHRlcg0KPj4N
Cj4+IFRoZSBwdXJwb3NlIG9mIHRoaXMgcGF0Y2ggc2VyaWVzIGlzIHRvIHN0YXJ0IGEgZGlzY3Vz
c2lvbiBmb3IgYSBnZW5lcmljIGNncm91cA0KPj4gY29udHJvbGxlciBmb3IgdGhlIGRybSBzdWJz
eXN0ZW0uICBUaGUgZGVzaWduIHByb3Bvc2VkIGhlcmUgaXMgYSB2ZXJ5IGVhcmx5IG9uZS4NCj4+
IFdlIGFyZSBob3BpbmcgdG8gZW5nYWdlIHRoZSBjb21tdW5pdHkgYXMgd2UgZGV2ZWxvcCB0aGUg
aWRlYS4NCj4+DQo+Pg0KPj4gQmFja2dyb3VuZHMNCj4+ID09PT09PT09PT0NCj4+IENvbnRyb2wg
R3JvdXBzL2Nncm91cCBwcm92aWRlIGEgbWVjaGFuaXNtIGZvciBhZ2dyZWdhdGluZy9wYXJ0aXRp
b25pbmcgc2V0cyBvZg0KPj4gdGFza3MsIGFuZCBhbGwgdGhlaXIgZnV0dXJlIGNoaWxkcmVuLCBp
bnRvIGhpZXJhcmNoaWNhbCBncm91cHMgd2l0aCBzcGVjaWFsaXplZA0KPj4gYmVoYXZpb3VyLCBz
dWNoIGFzIGFjY291bnRpbmcvbGltaXRpbmcgdGhlIHJlc291cmNlcyB3aGljaCBwcm9jZXNzZXMg
aW4gYSBjZ3JvdXANCj4+IGNhbiBhY2Nlc3NbMV0uICBXZWlnaHRzLCBsaW1pdHMsIHByb3RlY3Rp
b25zLCBhbGxvY2F0aW9ucyBhcmUgdGhlIG1haW4gcmVzb3VyY2UNCj4+IGRpc3RyaWJ1dGlvbiBt
b2RlbHMuICBFeGlzdGluZyBjZ3JvdXAgY29udHJvbGxlcnMgaW5jbHVkZXMgY3B1LCBtZW1vcnks
IGlvLA0KPj4gcmRtYSwgYW5kIG1vcmUuICBjZ3JvdXAgaXMgb25lIG9mIHRoZSBmb3VuZGF0aW9u
YWwgdGVjaG5vbG9naWVzIHRoYXQgZW5hYmxlcyB0aGUNCj4+IHBvcHVsYXIgY29udGFpbmVyIGFw
cGxpY2F0aW9uIGRlcGxveW1lbnQgYW5kIG1hbmFnZW1lbnQgbWV0aG9kLg0KPj4NCj4+IERpcmVj
dCBSZW5kZXJpbmcgTWFuYWdlci9kcm0gY29udGFpbnMgY29kZSBpbnRlbmRlZCB0byBzdXBwb3J0
IHRoZSBuZWVkcyBvZg0KPj4gY29tcGxleCBncmFwaGljcyBkZXZpY2VzLiBHcmFwaGljcyBkcml2
ZXJzIGluIHRoZSBrZXJuZWwgbWF5IG1ha2UgdXNlIG9mIERSTQ0KPj4gZnVuY3Rpb25zIHRvIG1h
a2UgdGFza3MgbGlrZSBtZW1vcnkgbWFuYWdlbWVudCwgaW50ZXJydXB0IGhhbmRsaW5nIGFuZCBE
TUENCj4+IGVhc2llciwgYW5kIHByb3ZpZGUgYSB1bmlmb3JtIGludGVyZmFjZSB0byBhcHBsaWNh
dGlvbnMuICBUaGUgRFJNIGhhcyBhbHNvDQo+PiBkZXZlbG9wZWQgYmV5b25kIHRyYWRpdGlvbmFs
IGdyYXBoaWNzIGFwcGxpY2F0aW9ucyB0byBzdXBwb3J0IGNvbXB1dGUvR1BHUFUNCj4+IGFwcGxp
Y2F0aW9ucy4NCj4+DQo+Pg0KPj4gTW90aXZhdGlvbnMNCj4+ID09PT09PT09PQ0KPj4gQXMgR1BV
IGdyb3cgYmV5b25kIHRoZSByZWFsbSBvZiBkZXNrdG9wL3dvcmtzdGF0aW9uIGdyYXBoaWNzIGlu
dG8gYXJlYXMgbGlrZQ0KPj4gZGF0YSBjZW50ZXIgY2x1c3RlcnMgYW5kIElvVCwgdGhlcmUgYXJl
IGluY3JlYXNpbmcgbmVlZHMgdG8gbW9uaXRvciBhbmQgcmVndWxhdGUNCj4+IEdQVSBhcyBhIHJl
c291cmNlIGxpa2UgY3B1LCBtZW1vcnkgYW5kIGlvLg0KPj4NCj4+IE1hdHQgUm9wZXIgZnJvbSBJ
bnRlbCBiZWdhbiB3b3JraW5nIG9uIHNpbWlsYXIgaWRlYSBpbiBlYXJseSAyMDE4IFsyXSBmb3Ig
dGhlDQo+PiBwdXJwb3NlIG9mIG1hbmFnaW5nIEdQVSBwcmlvcml0eSB1c2luZyB0aGUgY2dyb3Vw
IGhpZXJhcmNoeS4gIFdoaWxlIHRoYXQNCj4+IHBhcnRpY3VsYXIgdXNlIGNhc2UgbWF5IG5vdCB3
YXJyYW50IGEgc3RhbmRhbG9uZSBkcm0gY2dyb3VwIGNvbnRyb2xsZXIsIHRoZXJlDQo+PiBhcmUg
b3RoZXIgdXNlIGNhc2VzIHdoZXJlIGhhdmluZyBvbmUgY2FuIGJlIHVzZWZ1bCBbM10uICBNb25p
dG9yaW5nIEdQVQ0KPj4gcmVzb3VyY2VzIHN1Y2ggYXMgVlJBTSBhbmQgYnVmZmVycywgQ1UgKGNv
bXB1dGUgdW5pdCBbQU1EJ3Mgbm9tZW5jbGF0dXJlXSkvRVUNCj4+IChleGVjdXRpb24gdW5pdCBb
SW50ZWwncyBub21lbmNsYXR1cmVdKSwgR1BVIGpvYiBzY2hlZHVsaW5nIFs0XSBjYW4gaGVscA0K
Pj4gc3lzYWRtaW5zIGdldCBhIGJldHRlciB1bmRlcnN0YW5kaW5nIG9mIHRoZSBhcHBsaWNhdGlv
bnMgdXNhZ2UgcHJvZmlsZS4gIEZ1cnRoZXINCj4+IHVzYWdlIHJlZ3VsYXRpb25zIG9mIHRoZSBh
Zm9yZW1lbnRpb25lZCByZXNvdXJjZXMgY2FuIGFsc28gaGVscCBzeXNhZG1pbnMNCj4+IG9wdGlt
aXplIHdvcmtsb2FkIGRlcGxveW1lbnQgb24gbGltaXRlZCBHUFUgcmVzb3VyY2VzLg0KPj4NCj4+
IFdpdGggdGhlIGluY3JlYXNlZCBpbXBvcnRhbmNlIG9mIG1hY2hpbmUgbGVhcm5pbmcsIGRhdGEg
c2NpZW5jZSBhbmQgb3RoZXINCj4+IGNsb3VkLWJhc2VkIGFwcGxpY2F0aW9ucywgR1BVcyBhcmUg
YWxyZWFkeSBpbiBwcm9kdWN0aW9uIHVzZSBpbiBkYXRhIGNlbnRlcnMNCj4+IHRvZGF5IFs1LDYs
N10uICBFeGlzdGluZyBHUFUgcmVzb3VyY2UgbWFuYWdlbWVudCBpcyB2ZXJ5IGNvdXJzZSBncmFp
biwgaG93ZXZlciwNCj4+IGFzIHN5c2FkbWlucyBhcmUgb25seSBhYmxlIHRvIGRpc3RyaWJ1dGUg
d29ya2xvYWQgb24gYSBwZXItR1BVIGJhc2lzIFs4XS4gIEFuDQo+PiBhbHRlcm5hdGl2ZSBpcyB0
byB1c2UgR1BVIHZpcnR1YWxpemF0aW9uICh3aXRoIG9yIHdpdGhvdXQgU1JJT1YpIGJ1dCBpdA0K
Pj4gZ2VuZXJhbGx5IGFjdHMgb24gdGhlIGVudGlyZSBHUFUgaW5zdGVhZCBvZiB0aGUgc3BlY2lm
aWMgcmVzb3VyY2VzIGluIGEgR1BVLg0KPj4gV2l0aCBhIGRybSBjZ3JvdXAgY29udHJvbGxlciwg
d2UgY2FuIGVuYWJsZSBhbHRlcm5hdGUsIGZpbmUtZ3JhaW4sIHN1Yi1HUFUNCj4+IHJlc291cmNl
IG1hbmFnZW1lbnQgKGluIGFkZGl0aW9uIHRvIHdoYXQgbWF5IGJlIGF2YWlsYWJsZSB2aWEgR1BV
DQo+PiB2aXJ0dWFsaXphdGlvbi4pDQo+Pg0KPj4gSW4gYWRkaXRpb24gdG8gcHJvZHVjdGlvbiB1
c2UsIHRoZSBEUk0gY2dyb3VwIGNhbiBhbHNvIGhlbHAgd2l0aCB0ZXN0aW5nDQo+PiBncmFwaGlj
cyBhcHBsaWNhdGlvbiByb2J1c3RuZXNzIGJ5IHByb3ZpZGluZyBhIG1lYW4gdG8gYXJ0aWZpY2lh
bGx5IGxpbWl0IERSTQ0KPj4gcmVzb3VyY2VzIGF2YWlsYmxlIHRvIHRoZSBhcHBsaWNhdGlvbnMu
DQo+Pg0KPj4NCj4+IENoYWxsZW5nZXMNCj4+ID09PT09PT09DQo+PiBXaGlsZSB0aGVyZSBhcmUg
Y29tbW9uIGluZnJhc3RydWN0dXJlIGluIERSTSB0aGF0IGlzIHNoYXJlZCBhY3Jvc3MgbWFueSB2
ZW5kb3JzDQo+PiAodGhlIHNjaGVkdWxlciBbNF0gZm9yIGV4YW1wbGUpLCB0aGVyZSBhcmUgYWxz
byBhc3BlY3RzIG9mIERSTSB0aGF0IGFyZSB2ZW5kb3INCj4+IHNwZWNpZmljLiAgVG8gYWNjb21t
b2RhdGUgdGhpcywgd2UgYm9ycm93ZWQgdGhlIG1lY2hhbmlzbSB1c2VkIGJ5IHRoZSBjZ3JvdXAg
dG8NCj4+IGhhbmRsZSBkaWZmZXJlbnQga2luZHMgb2YgY2dyb3VwIGNvbnRyb2xsZXIuDQo+Pg0K
Pj4gUmVzb3VyY2VzIGZvciBEUk0gYXJlIGFsc28gb2Z0ZW4gZGV2aWNlIChHUFUpIHNwZWNpZmlj
IGluc3RlYWQgb2Ygc3lzdGVtDQo+PiBzcGVjaWZpYyBhbmQgYSBzeXN0ZW0gbWF5IGNvbnRhaW4g
bW9yZSB0aGFuIG9uZSBHUFUuICBGb3IgdGhpcywgd2UgYm9ycm93ZWQgc29tZQ0KPj4gb2YgdGhl
IGlkZWFzIGZyb20gUkRNQSBjZ3JvdXAgY29udHJvbGxlci4NCj4+DQo+PiBBcHByb2FjaA0KPj4g
PT09PT09PQ0KPj4gVG8gZXhwZXJpbWVudCB3aXRoIHRoZSBpZGVhIG9mIGEgRFJNIGNncm91cCwg
d2Ugd291bGQgbGlrZSB0byBzdGFydCB3aXRoIGJhc2ljDQo+PiBhY2NvdW50aW5nIGFuZCBzdGF0
aXN0aWNzLCB0aGVuIGNvbnRpbnVlIHRvIGl0ZXJhdGUgYW5kIGFkZCByZWd1bGF0aW5nDQo+PiBt
ZWNoYW5pc21zIGludG8gdGhlIGRyaXZlci4NCj4+DQo+PiBbMV0gaHR0cHM6Ly93d3cua2VybmVs
Lm9yZy9kb2MvRG9jdW1lbnRhdGlvbi9jZ3JvdXAtdjEvY2dyb3Vwcy50eHQNCj4+IFsyXSBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9pbnRlbC1nZngvMjAxOC1KYW51YXJ5
LzE1MzE1Ni5odG1sDQo+PiBbM10gaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvY2dyb3Vw
cy9tc2cyMDcyMC5odG1sDQo+PiBbNF0gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgv
bGF0ZXN0L3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyDQo+PiBbNV0gaHR0cHM6Ly9r
dWJlcm5ldGVzLmlvL2RvY3MvdGFza3MvbWFuYWdlLWdwdXMvc2NoZWR1bGluZy1ncHVzLw0KPj4g
WzZdIGh0dHBzOi8vYmxvZy5vcGVuc2hpZnQuY29tL2dwdS1hY2NlbGVyYXRlZC1zcWwtcXVlcmll
cy13aXRoLXBvc3RncmVzcWwtcGctc3Ryb20taW4tb3BlbnNoaWZ0LTMtMTAvDQo+PiBbN10gaHR0
cHM6Ly9naXRodWIuY29tL1JhZGVvbk9wZW5Db21wdXRlL2s4cy1kZXZpY2UtcGx1Z2luDQo+PiBb
OF0gaHR0cHM6Ly9naXRodWIuY29tL2t1YmVybmV0ZXMva3ViZXJuZXRlcy9pc3N1ZXMvNTI3NTcN
Cj4+DQo+PiBLZW5ueSBIbyAoMTYpOg0KPj4gICAgZHJtOiBBZGQgZHJtX21pbm9yX2Zvcl9lYWNo
DQo+PiAgICBjZ3JvdXA6IEludHJvZHVjZSBjZ3JvdXAgZm9yIGRybSBzdWJzeXN0ZW0NCj4+ICAg
IGRybSwgY2dyb3VwOiBJbml0aWFsaXplIGRybWNnIHByb3BlcnRpZXMNCj4+ICAgIGRybSwgY2dy
b3VwOiBBZGQgdG90YWwgR0VNIGJ1ZmZlciBhbGxvY2F0aW9uIHN0YXRzDQo+PiAgICBkcm0sIGNn
cm91cDogQWRkIHBlYWsgR0VNIGJ1ZmZlciBhbGxvY2F0aW9uIHN0YXRzDQo+PiAgICBkcm0sIGNn
cm91cDogQWRkIEdFTSBidWZmZXIgYWxsb2NhdGlvbiBjb3VudCBzdGF0cw0KPj4gICAgZHJtLCBj
Z3JvdXA6IEFkZCB0b3RhbCBHRU0gYnVmZmVyIGFsbG9jYXRpb24gbGltaXQNCj4+ICAgIGRybSwg
Y2dyb3VwOiBBZGQgcGVhayBHRU0gYnVmZmVyIGFsbG9jYXRpb24gbGltaXQNCj4+ICAgIGRybSwg
Y2dyb3VwOiBBZGQgVFRNIGJ1ZmZlciBhbGxvY2F0aW9uIHN0YXRzDQo+PiAgICBkcm0sIGNncm91
cDogQWRkIFRUTSBidWZmZXIgcGVhayB1c2FnZSBzdGF0cw0KPj4gICAgZHJtLCBjZ3JvdXA6IEFk
ZCBwZXIgY2dyb3VwIGJ3IG1lYXN1cmUgYW5kIGNvbnRyb2wNCj4+ICAgIGRybSwgY2dyb3VwOiBB
ZGQgc29mdCBWUkFNIGxpbWl0DQo+PiAgICBkcm0sIGNncm91cDogQWxsb3cgbW9yZSBhZ2dyZXNz
aXZlIG1lbW9yeSByZWNsYWltDQo+PiAgICBkcm0sIGNncm91cDogSW50cm9kdWNlIGxncHUgYXMg
RFJNIGNncm91cCByZXNvdXJjZQ0KPj4gICAgZHJtLCBjZ3JvdXA6IGFkZCB1cGRhdGUgdHJpZ2dl
ciBhZnRlciBsaW1pdCBjaGFuZ2UNCj4+ICAgIGRybS9hbWRncHU6IEludGVncmF0ZSB3aXRoIERS
TSBjZ3JvdXANCj4+DQo+PiAgIERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvY2dyb3VwLXYyLnJz
dCAgICAgICB8ICAxNjMgKy0NCj4+ICAgRG9jdW1lbnRhdGlvbi9jZ3JvdXAtdjEvZHJtLnJzdCAg
ICAgICAgICAgICAgIHwgICAgMSArDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9hbWRrZmQuaCAgICB8ICAgIDQgKw0KPj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZHJ2LmMgICAgICAgfCAgIDI5ICsNCj4+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X29iamVjdC5jICAgIHwgICAgNiArLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgICAgICAgfCAgICAzICstDQo+PiAgIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMgICAgICB8ICAgIDYgKw0KPj4gICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oICAgICAgICAgfCAgICAzICsNCj4+ICAgLi4u
L2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3NfcXVldWVfbWFuYWdlci5jICAgIHwgIDE0MCArKw0KPj4g
ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2Rydi5jICAgICAgICAgICAgICAgICAgICAgfCAgIDI2ICsN
Cj4+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYyAgICAgICAgICAgICAgICAgICAgIHwgICAx
NiArLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2ludGVybmFsLmggICAgICAgICAgICAgICAg
fCAgICA0IC0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyAgICAgICAgICAgICAg
ICAgIHwgICA5MyArKw0KPj4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMgICAg
ICAgICAgICAgfCAgICA0ICsNCj4+ICAgaW5jbHVkZS9kcm0vZHJtX2Nncm91cC5oICAgICAgICAg
ICAgICAgICAgICAgIHwgIDEyMiArKw0KPj4gICBpbmNsdWRlL2RybS9kcm1fZGV2aWNlLmggICAg
ICAgICAgICAgICAgICAgICAgfCAgICA3ICsNCj4+ICAgaW5jbHVkZS9kcm0vZHJtX2Rydi5oICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgICAyMyArDQo+PiAgIGluY2x1ZGUvZHJtL2RybV9nZW0u
aCAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMTMgKy0NCj4+ICAgaW5jbHVkZS9kcm0vdHRt
L3R0bV9ib19hcGkuaCAgICAgICAgICAgICAgICAgIHwgICAgMiArDQo+PiAgIGluY2x1ZGUvZHJt
L3R0bS90dG1fYm9fZHJpdmVyLmggICAgICAgICAgICAgICB8ICAgMTAgKw0KPj4gICBpbmNsdWRl
L2xpbnV4L2Nncm91cF9kcm0uaCAgICAgICAgICAgICAgICAgICAgfCAgMTUxICsrDQo+PiAgIGlu
Y2x1ZGUvbGludXgvY2dyb3VwX3N1YnN5cy5oICAgICAgICAgICAgICAgICB8ICAgIDQgKw0KPj4g
ICBpbml0L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICA1ICsN
Cj4+ICAga2VybmVsL2Nncm91cC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgIHwgICAg
MSArDQo+PiAgIGtlcm5lbC9jZ3JvdXAvZHJtLmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8
IDEzNjcgKysrKysrKysrKysrKysrKysNCj4+ICAgMjUgZmlsZXMgY2hhbmdlZCwgMjE5MyBpbnNl
cnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3Vt
ZW50YXRpb24vY2dyb3VwLXYxL2RybS5yc3QNCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1
ZGUvZHJtL2RybV9jZ3JvdXAuaA0KPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51
eC9jZ3JvdXBfZHJtLmgNCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGtlcm5lbC9jZ3JvdXAvZHJt
LmMNCj4+DQo+PiAtLSANCj4+IDIuMjIuMA0KPj4NCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
