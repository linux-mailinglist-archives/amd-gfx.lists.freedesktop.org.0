Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D86D04638B
	for <lists+amd-gfx@lfdr.de>; Fri, 14 Jun 2019 18:00:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764C389AAD;
	Fri, 14 Jun 2019 16:00:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720041.outbound.protection.outlook.com [40.107.72.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 974B989A62;
 Fri, 14 Jun 2019 16:00:26 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1211.namprd12.prod.outlook.com (10.168.239.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.10; Fri, 14 Jun 2019 16:00:24 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935%6]) with mapi id 15.20.1987.013; Fri, 14 Jun 2019
 16:00:24 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Thread-Topic: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Thread-Index: AQHVFGTgR+jNVTHnhkq6fR69g1cCsaabKzyAgAAM3YCAADG2gIAAAe0A
Date: Fri, 14 Jun 2019 16:00:24 +0000
Message-ID: <84b3337c-0cdc-44d4-02c6-c56bd729ed47@amd.com>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <20190614120927.GA32412@arch-x1c3>
 <9dbdda6c-8916-e5ae-1676-86828b9890e7@amd.com>
 <20190614155325.GC32412@arch-x1c3>
In-Reply-To: <20190614155325.GC32412@arch-x1c3>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0182.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::26) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75bbc387-89b5-4dd3-1533-08d6f0e16907
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1211; 
x-ms-traffictypediagnostic: DM5PR12MB1211:
x-microsoft-antispam-prvs: <DM5PR12MB12116EA9751A4C165027AAB283EE0@DM5PR12MB1211.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0068C7E410
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(376002)(39860400002)(396003)(346002)(199004)(189003)(4326008)(446003)(102836004)(81156014)(72206003)(14454004)(5660300002)(14444005)(86362001)(66446008)(8936002)(64756008)(65806001)(256004)(66946007)(478600001)(73956011)(66556008)(81166006)(66476007)(31696002)(71200400001)(65956001)(6246003)(8676002)(58126008)(99286004)(6116002)(71190400001)(386003)(6506007)(46003)(2616005)(476003)(305945005)(11346002)(561944003)(7736002)(54906003)(316002)(6436002)(53936002)(6486002)(186003)(6916009)(2906002)(229853002)(52116002)(36756003)(64126003)(76176011)(6512007)(31686004)(25786009)(65826007)(486006)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1211;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AdpKAsYj0+xixPlMDecGVr/OHSsNi3BjobVUOe2Y/kZA7X4aR76QegliU4K2IkMpoIFG1LnE50CgqnFs825nPJL7tW28+Ih9yvQPz8+f21O+woeffy/zuSWMYPQuGqwP7c5QqkjyxFJoazwv2Rc0u6OqeeeBOloJ3NUXXWCxMDe6mObG94M30o7nF/K5Mf10lARHOONS2u5cIpgCAczk4gkmVHqp7OmM98/Stnzvai+bkpfHRyo1nUjNaa8sbbe2DrN+8HVG34VwOFK5PWujg/OKpSaF1iwlcpovq8GWFeOvP92FI+da48VSyaHSatKkX7o7HmP7ZfMFgIyGEe6dGkw1ZWalC7phD0G//jAhw67A3lxA7zAyTZCDS0mq9y6m+K2Cg9qcC5JfY3ojxCmT/UpQCWWECIt0bQV1j+AvkzQ=
Content-ID: <1569B6BF3B175E4598958194F3AFBEA5@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75bbc387-89b5-4dd3-1533-08d6f0e16907
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2019 16:00:24.4357 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1211
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l2sfJu1SoNhrExlb8QdrNLvBciB3VCoNFVcO/t4I6hI=;
 b=Vx64sMEPSDTtL5CfZTjg1zXbKywd0WWMpqlVDRfLkC3R5CdT0mkNqw1raOfsv+F7B9gwHZiy71ln1SKvUyOmMOavVe3xV+xopwlW/n2aRvn0PokIIISaWdY9NF44NIHZ7QDmISxow7KienSjA4C9ASzY2+wdIPwZ6n+G4jSIKgY=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTQuMDYuMTkgdW0gMTc6NTMgc2NocmllYiBFbWlsIFZlbGlrb3Y6DQo+IE9uIDIwMTkvMDYv
MTQsIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOg0KPj4gQW0gMTQuMDYuMTkgdW0gMTQ6MDkgc2No
cmllYiBFbWlsIFZlbGlrb3Y6DQo+Pj4gT24gMjAxOS8wNS8yNywgRW1pbCBWZWxpa292IHdyb3Rl
Og0KPj4+IFtTTklQXQ0KPj4+IEhpIENocmlzdGlhbiwNCj4+Pg0KPj4+DQo+Pj4gSW4gdGhlIGZv
bGxvd2luZywgSSB3b3VsZCBsaWtlIHRvIHN1bW1hcmlzZSBhbmQgZW1waGFzaXplIHRoZSBuZWVk
IGZvcg0KPj4+IERSTV9BVVRIIHJlbW92YWwuIEkgd291bGQga2luZGx5IGFzayB5b3UgdG8gc3Bl
bmQgYSBjb3VwbGUgb2YgbWludXRlcw0KPj4+IGV4dHJhIHJlYWRpbmcgaXQuDQo+Pj4NCj4+Pg0K
Pj4+IFRvZGF5IERSTSBkcml2ZXJzKiBkbyBub3QgbWFrZSBhbnkgZGlzdGluY3Rpb24gYmV0d2Vl
biBwcmltYXJ5IGFuZA0KPj4+IHJlbmRlciBub2RlIGNsaWVudHMuDQo+PiBUaGF0IGlzIGFjdHVh
bGx5IG5vdCAxMDAlIGNvcnJlY3QuIFdlIGhhdmUgYSBzcGVjaWFsIGNhc2Ugd2hlcmUgYSBEUk0N
Cj4+IG1hc3RlciBpcyBhbGxvd2VkIHRvIGNoYW5nZSB0aGUgcHJpb3JpdHkgb2YgcmVuZGVyIG5v
ZGUgY2xpZW50cy4NCj4+DQo+IENhbiB5b3UgcHJvdmlkZSBhIGxpbms/IEkgY2Fubm90IGZpbmQg
dGhhdCBjb2RlLg0KDQpTZWUgYW1kZ3B1X3NjaGVkX2lvY3RsKCkuDQoNCj4+PiBUaHVzIGZvciBh
IHJlbmRlciBjYXBhYmxlIGRyaXZlciwgYW55IHByZW1pc2Ugb2YNCj4+PiBzZXBhcmF0aW9uLCBz
ZWN1cml0eSBvciBvdGhlcndpc2UgaW1wb3NlZCB2aWEgRFJNX0FVVEggaXMgYSBmYWxsYWN5Lg0K
Pj4gWWVhaCwgdGhhdCdzIHdoYXQgSSBhZ3JlZSBvbi4gSSBqdXN0IGRvbid0IHRoaW5rIHRoYXQg
cmVtb3ZpbmcgRFJNX0FVVEgNCj4+IG5vdyBpcyB0aGUgcmlnaHQgZGlyZWN0aW9uIHRvIHRha2Uu
DQo+Pg0KPiBDb3VsZCBoYXZlIGJlZW4gY2xlYXJlciAtIEknbSB0YWxraW5nIGFib3V0IERSTV9B
VVRIIHwgRFJNX1JFTkRFUl9BTExPVw0KPiBpb2N0bHMuDQo+DQo+IFRoYXQgYXNpZGUsIGNhbiB5
b3UgcHJvcG9zZSBhbiBhbHRlcm5hdGl2ZSBzb2x1dGlvbiB0aGF0IGFkZHJlc3NlcyB0aGlzDQo+
IGFuZCB0aGUgc2Vjb25kIHBvaW50IGp1c3QgYmVsb3c/DQoNCkdpdmUgbWUgYSBmZXcgZGF5cyB0
byB3b3JrIG9uIHRoaXMsIGl0J3MgYWxyZWFkeSBGcmlkYXkgNnBtIGhlcmUuDQoNCkNocmlzdGlh
bi4NCg0KPg0KPj4+IENvbnNpZGVyaW5nIHRoZSBleGFtcGxlcyBvZiBmbGFreSBvciBvdXRyaWdo
dCBtaXNzaW5nIGRybUF1dGggaW4gcHJpbWUNCj4+PiBvcGVuLXNvdXJjZSBwcm9qZWN0cyAobWVz
YSwga21zY3ViZSwgbGlidmEpIHdlIGNhbiByZWFzb25hYmx5IGFzc3VtZQ0KPj4+IG90aGVyIHBy
b2plY3RzIGV4YmliaXQgdGhlIHNhbWUgcHJvYmxlbS4NCj4+Pg0KPj4+IEZvciB0aGVzZSBhbmQv
b3Igb3RoZXIgcmVhc29ucywgdHdvIERSTSBkcml2ZXJzIGhhdmUgZHJvcHBlZCBEUk1fQVVUSA0K
Pj4+IHNpbmNlIGRheSBvbmUuDQo+Pj4NCj4+PiBTaW5jZSB3ZSBhcmUgaW50ZXJlc3RlZCBpbiBw
cm92aWRpbmcgY29uc2lzdGVudCBhbmQgcHJlZGljdGFibGUNCj4+PiBiZWhhdmlvdXIgdG8gdXNl
ci1zcGFjZSwgZHJvcHBpbmcgRFJNX0FVVEggc2VlbXMgdG8gYmUgdGhlIG1vc3QNCj4+PiBlZmZl
Y3RpdmUgd2F5IGZvcndhcmQuDQo+PiBXZWxsIGFuZCB3aGF0IGRvIHlvdSBkbyB3aXRoIGRyaXZl
cnMgd2hpY2ggZG9lc24ndCBpbXBsZW1lbnQgcmVuZGVyIG5vZGVzPw0KPj4NCj4gQUZBSUNUIHRo
ZXJlIGlzIGEgc2luZ2xlIG5vbi1EQyBkcml2ZXIgd2hpY2ggZG9lcyBub3QgZXhwb3NlIC0gUVhM
Lg0KPiBJIHdvdWxkIGV4cGVjdCBpdCBydW5zIG9uIGEgcmF0aGVyIGN1c3RvbWlzZWQgc3RhY2su
DQo+DQo+IFdvdWxkIGJlIGdyZWF0IHRvIGZpeCB0aGF0LCBidXQgRVRJTUUgYW5kIGl0J3MgdGhl
IG9ubHkgZXhjZXB0aW9uIHRvIHRoZQ0KPiBydWxlLg0KPg0KPg0KPj4+IE9mIGNvdXJzZSwgSSdk
IGJlIG1vcmUgdGhhbiBoYXBweSB0byBoZWFyIGZvciBhbnkgb3RoZXIgd2F5IHRvIGFjaGlldmUN
Cj4+PiB0aGUgZ29hbCBvdXRsaW5lZC4NCj4+Pg0KPj4+IEJhc2VkIG9uIHRoZSBzZXJpZXMsIG90
aGVyIG1haW50YWluZXJzIGFncmVlIHdpdGggdGhlIGlkZWEvZ29hbCBoZXJlLg0KPj4+IEFtZGdw
dSBub3QgZm9sbG93aW5nIHRoZSBzYW1lIHBhdHRlcm4gd291bGQgY29tcHJvbWlzZSBwcmVkaWN0
YWJpbGl0eQ0KPj4+IGFjcm9zcyBkcml2ZXJzIGFuZCBjb21wbGljYXRlIHVzZXJzcGFjZSwgc28g
SSB3b3VsZCBraW5kbHkgYXNrIHlvdSB0bw0KPj4+IHJlY29uc2lkZXIuDQo+Pj4NCj4+PiBBbHRl
cm5hdGl2ZWx5LCBJIHNlZSB0d28gd2F5cyB0byBzcGVjaWFsIGNhc2U6DQo+Pj4gICAgLSBOZXcg
ZmxhZyBhbm5vdGF0aW5nIGFtZGdwdS9yYWRlb24gLSBha2luIHRvIHRoZSBvbmUgcHJvcG9zZWQg
ZWFybGllcg0KPj4+ICAgIC0gQ2hlY2sgZm9yIGFtZGdwdS9yYWRlb24gaW4gY29yZSBEUk0NCj4+
IEkgcGVyZmVjdGx5IGFncmVlIHRoYXQgSSBkb24ndCB3YW50IGFueSBzcGVjaWFsIGhhbmRsaW5n
IGZvciBhbWRncHUvcmFkZW9uLg0KPj4NCj4+IE15IGtleSBwb2ludCBpcyB0aGF0IHdpdGggRFJN
X0FVVEggd2UgY3JlYXRlZCBhbiBhdXRob3JpemF0aW9uIGFuZA0KPj4gYXV0aGVudGljYXRpb24g
bWVzcyBpbiBEUk0gd2hpY2ggaXMgZnVuY3Rpb25hbGl0eSB3aGljaCBkb2Vzbid0IGJlbG9uZw0K
Pj4gaW50byB0aGUgRFJNIHN1YnN5c3RlbSBpbiB0aGUgZmlyc3QgcGxhY2UuDQo+Pg0KPiBQcmVj
aXNlbHkgYW5kIEkndmUgb3V0bGluZWQgYmVsb3cgaG93IHRvIHJlc29sdmUgdGhpcyBpbiB0aGUg
bG9uZyBydW4uDQo+DQo+Pj4gTm93IG9uIHlvdXIgcGFpbiBwb2ludCAtIG5vdCBhbGxvd2luZyBy
ZW5kZXIgaW9jdHMgdmlhIHRoZSBwcmltYXJ5IG5vZGUsDQo+Pj4gYW5kIGhvdyB0aGlzIHBhdGNo
IGNvdWxkIG1ha2UgaXQgaGFyZGVyIHRvIGFjaGlldmUgdGhhdCBnb2FsLg0KPj4+DQo+Pj4gV2hp
bGUgSSBsb3ZlIHRoZSBpZGVhLCB0aGVyZSBhcmUgbnVtYmVyIG9mIG9ic3RhY2xlcyB0aGF0IHBy
ZXZlbnQgdXMNCj4+PiBmcm9tIGRvaW5nIHNvIGF0IHRoaXMgdGltZToNCj4+PiAgICAtIEVuc3Vy
aW5nIGJvdGggb2xkIGFuZCBuZXcgdXNlcnNwYWNlIGRvZXMgbm90IHJlZ3Jlc3MNCj4+IFllYWgs
IGFncmVlIHRvdGFsbHkuIFRoYXQncyB3aHkgSSBzYWlkIHdlIHNob3VsZCBwcm9iYWJseSBzdGFy
dCBkb2luZw0KPj4gdGhpcyBmb3Igb25seSBmb3IgdXBjb21pbmcgaGFyZHdhcmUgZ2VuZXJhdGlv
bnMuDQo+Pg0KPiBUaGF0IHdpbGwgc2lkZS1zdGVwIHRoZSByZWdyZXNzaW9uIGlzc3VlLCBidXQg
d2lsbCBlbmZvcmNlIGRyaXZlcg0KPiBzcGVjaWZpYyBiZWhhdmlvdXIgb3V0bGluZWQgYmVmb3Jl
Lg0KPg0KPj4+ICAgIC0gRHJpdmVycyAoUVhMLCBvdGhlcnM/KSBkbyBub3QgZXhwb3NlIGEgcmVu
ZGVyIG5vZGUNCj4+IFdlbGwgaXNuJ3QgdGhhdCBpcyBhIHJhdGhlciBiaWcgcHJvYmxlbSBmb3Ig
dGhlIHJlbW92YWwgb2YgRFJNX0FVVEggaW4NCj4+IGdlbmVyYWw/DQo+Pg0KPj4gRS5nLiBhdCBs
ZWFzdCBRWEwgd291bGQgdGhlbiBleHBvc2UgZnVuY3Rpb25hbGl0eSBvbiB0aGUgcHJpbWFyeSBu
b2RlDQo+PiB3aXRob3V0IGF1dGhlbnRpY2F0aW9uLg0KPj4NCj4gV2l0aCB0aGlzIHNlcmllcyBR
WEwgcmVtYWlucyBmdW5jdGlvbmFsbHkgdW5jaGFuZ2VkLiBJIHdvdWxkIGxvdmUgdG8gZml4DQo+
IHRoYXQgYXMgd2VsbCB5ZXQgRVRJTUUgYXMgbWVudGlvbmVkIGFib3ZlLg0KPg0KPj4+ICAgIC0g
V2Ugd2FudCB0byBhdm9pZCBkcml2ZXIgc3BlY2lmaWMgYmVoYXZpb3VyDQo+Pj4NCj4+PiBUaGUg
b25seSB3YXkgZm9yd2FyZCB0aGF0IEkgY2FuIHNlZSBpczoNCj4+PiAgICAtIEFkZHJlc3MgUVhM
L290aGVycyB0byBleHBvc2UgcmVuZGVyIG5vZGVzDQo+Pj4gICAgLSBBZGQgYSBLY29uZmlnIHRv
Z2dsZSB0byBkaXNhYmxlICFLTVMgaW9jdGxzIHZpYSB0aGUgcHJpbWFyeSBub2RlDQo+Pj4gICAg
LSBKdW1wLXN0YXJ0IF5eIHdpdGggZGlzdHJpYnV0aW9uIFgNCj4+PiAgICAtIEZpeCB1c2VyLXNw
YWNlIGZhbGxvdXRzDQo+Pj4gICAgLSBYIG1vbnRocyBkb3duIHRoZSBsaW5lLCBmbGlwIHRoZSBL
Y29uZmlnDQo+Pj4gICAgLSBJbiBjYXNlIG9mIHJlZ3Jlc3Npb25zIC0gcmV2ZXJ0IHRoZSBLQ29u
ZmlnLCBnb3RvIEZpeCB1c2VyLXNwYWNlLi4uDQo+PiBXZWxsIHRoYXQgYXQgbGVhc3Qgc291bmRz
IGxpa2UgYSBwbGFuIDopIExldCdzIHRvIHRoaXMhDQo+Pg0KPiBXZSdyZSB0YWxraW5nIGFib3V0
IG1vbnRocyBpZiBub3QgeWVhcnMgdW50aWwgaXQgY29tZXMgdG8gZnJ1aXRpb24uIFdlDQo+IG5l
ZWQgc29tZXRoaW5nIHF1aWNrZXIuDQo+DQo+IFRoYXQgc2FpZCwgSSdtIHF1aXRlIGhhcHB5IHRv
IHRha2UgdGhlIGZpcnN0IHN0YWIsIHlldCB0aGlzIGlzIG5vdCBhDQo+IHJlcGxhY2VtZW50IGZv
ciB0aGlzIHNlcmllcy4NCj4NCj4+PiBUaGF0IHNhaWQsIHRoZSBwcm9wb3NhbCB3aWxsIG5vdCBj
b25mbGljdCB3aXRoIHRoZSBEUk1fQVVUSCByZW1vdmFsLiBJZg0KPj4+IGFueXRoaW5nIGl0IGlz
IHN0ZXAgMC41IG9mIHRoZSBncmFuZCBtYXN0ZXIgcGxhbi4NCj4+IFRoYXQncyB0aGUgcG9pbnQg
SSBzdHJvbmdseSBkaXNhZ3JlZSBvbi4NCj4+DQo+PiBCeSBsb3dlcmluZyB0aGUgRFJNX0FVVEgg
cmVzdHJpY3Rpb24geW91IGFyZSBlbmNvdXJhZ2luZyB1c2Vyc3BhY2UgdG8NCj4+IHVzZSB0aGUg
c2hvcnRjdXQgYW5kIHVzZSB0aGUgcHJpbWFyeSBub2RlIGZvciByZW5kZXJpbmcgaW5zdGVhZCBv
Zg0KPj4gZml4aW5nIHRoZSBjb2RlIGFuZCB1c2luZyB0aGUgcmVuZGVyIG5vZGUuDQo+Pg0KPiBI
YXZlIHRvIGRpc2FncmVlIGhlcmUuIEFmdGVyIHdvcmtpbmcgb24gdGhlIHVzZXItc3BhY2Ugc2lk
ZSBhbmQgZml4aW5nDQo+IGlzc3VlcyBpbiB2YXJpb3VzIHByb2plY3RzIEkgY2FuIGhvbmVzdGx5
IHNheSB0aGF0IG1vc3QgdXNlci1zcGFjZSBpcw0KPiBzYW5lIGFuZCBkZXZlbG9wZXJzIF9jYXJl
XyBhYm91dCBkb2luZyB0aGluZ3MgY29ycmVjdGx5Lg0KPg0KPj4gU28gYXQgdGhlIGVuZCBvZiB0
aGUgZGF5IHVzZXJzcGFjZSB3aWxsIG1vc3QgbGlrZWx5IGNvbXBsZXRlbHkgZHJvcA0KPj4gc3Vw
cG9ydCBmb3IgdGhlIHJlbmRlciBub2RlLCBzaW1wbHkgZm9yIHRoZSByZWFzb24gdGhhdCBpdCBi
ZWNhbWUNCj4+IHN1cGVyZmx1b3VzLiBZb3UgY2FuIGp1c3Qgb3BlbiB1cCB0aGUgcHJpbWFyeSBu
b2RlIGFuZCBnZXQgdGhlIHNhbWUNCj4+IGZ1bmN0aW9uYWxpdHkuDQo+Pg0KPiBJIHRoaW5rIHlv
dSdyZSBiZWluZyBvdmVybHkgcGVzc2ltaXN0aWMgaGVyZS4gVGhpcyBpcyBjb21pbmcgZnJvbSBh
DQo+IHBlcnNvbiB3aG8gaXMgb2Z0ZW4gY2xvc2VyIHRvIHRoZSBwZXNzaW1pc3RpYyBzaWRlIG9m
IHRoaW5ncy4NCj4NCj4gQXMgYSBtaWRkbGUgZ3JvdW5kIGhvdyBhYm91dCB3ZSBkbyB0aGUgZm9s
bG93aW5nOg0KPiAgIC0gR2V0IHRoaXMgc2VyaWVzIGFzLWlzLCBhbG9uZ3NpZGUNCj4gICAtIHBp
Y2tpbmcgdGhlIGZpcnN0IHRocmVlIGl0ZW1zIGZyb20gdGhlIGdyYW5kIG1hc3RlciBwbGFuDQo+
ICAgICAtIGhhcHB5IHRvIHN0YXJ0IGEgZGlzY3Vzc2lvbiBhYm91dCBRWEwNCj4gICAgIC0gYSBw
YXRjaCBmb3IgdGhlIEtjb25maWcgdG9nZ2xlLCBpcyBjb21pbmcgaW4gYSBmZXcgbWludXRlcw0K
PiAgICAgLSBoYXBweSB0byBwcm9kIG15IGRpc3RyaWJ1dGlvbiBvZiBjaG9pY2UgKEFyY2gpIGFu
ZCB3b3JrIHdpdGggdGhlbQ0KPg0KPiBXaGF0IGRvIHlvdSB0aGluaz8NCj4NCj4gVGhhbmtzDQo+
IEVtaWwNCj4NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
