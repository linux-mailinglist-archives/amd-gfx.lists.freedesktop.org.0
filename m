Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AA4F5479
	for <lists+amd-gfx@lfdr.de>; Fri,  8 Nov 2019 20:04:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C60F6FA55;
	Fri,  8 Nov 2019 19:04:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820081.outbound.protection.outlook.com [40.107.82.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE576FA55
 for <amd-gfx@lists.freedesktop.org>; Fri,  8 Nov 2019 19:04:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LNSySpwbYytDGolih5tazUdMo9PKvbttsV+AKWz8YPNRD3+PEkVfcc0Ijbv40GVLTCUeQSqGIZWfyLCK7z08q8ZvIEpax/EYL+7zWwMDvj56q4viio2/mz+igR7XZ4NQQNPk5aYZ4EMaiYh7F7yyiw5Iwg/qHy2+miFy7OrNdRCaGyLM9+/xXjtajqYAOJ/eSk8IT5BNxdut3cI2XgprkoMJy+iXkhVmL31x9bwqjVLSjMGiqFNZjhrQT2N24+qW+Nixblf46j3MWzOkvYD07qXoRozGjz/fYmEyBBJcTiDkqSZiMR5k6gGj0/q1tEGRT8JgaGXPWdiag+CoeLLi2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wtMpX8AI9Sgm1TBHWHYDBSS7WRqVsvcyIUkx4SQ1LNE=;
 b=POX64CwW71BgzK1wLNgCv7Xlw1jlW/jvgbpnjDSkQGee1h7T9/qboknpJKhE5sbOofKTJpMsjBbUSWCXJhy4pGNqlVroXq2YtEPyBjYOYuAUIcFK70ZHq6akjhOC8yd7MpYGA66Q0qlPT63PQDB9sNDPSzoefuMlhYkihGdQn8/Hcnvw85d96xc0aIyqxysdI1giLQDHgeO1F5SyeslP1l7yE8lSyRMwkLwSoD4ZN7owMfybXM9ejmJVeOJB7R8ZbYygVF9Nrs1WbDpwB/0S6SfKXOzJdwlNN/zI+3v9qTG7ROZ4rIbxkjJOKs0noNVVO3KLV4gu7V5GcS6ajPjsWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1648.namprd12.prod.outlook.com (10.172.56.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Fri, 8 Nov 2019 19:04:31 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::3963:88a3:88f1:4a1d]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::3963:88a3:88f1:4a1d%4]) with mapi id 15.20.2430.023; Fri, 8 Nov 2019
 19:04:31 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: "Deng, Emily" <Emily.Deng@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: Fix the null pointer issue for tdr
Thread-Topic: [PATCH] drm/amdgpu: Fix the null pointer issue for tdr
Thread-Index: AQHVlVXAEwwfm3S6pky3Qa8JiILfeKd/kjQAgAEDJACAAGPGAIAABBwAgAAJDICAAAC9AIAAB/+AgAAA/YCAAAI2AIAAAQqAgAABwgCAAADBAIAABTwAgACJBgA=
Date: Fri, 8 Nov 2019 19:04:30 +0000
Message-ID: <f821d3dd-49b8-d910-0ba8-f8cd7a5966a7@amd.com>
References: <1573122349-22080-1-git-send-email-Emily.Deng@amd.com>
 <9de32e5b-69a2-f43f-629f-fef3c30bf5a1@gmail.com>
 <MN2PR12MB2975D4E26CED960B82305F308F7B0@MN2PR12MB2975.namprd12.prod.outlook.com>
 <MN2PR12MB2975E26D8A8352863BA01FCA8F7B0@MN2PR12MB2975.namprd12.prod.outlook.com>
 <c01acb29-72ce-a109-3ca5-166706327d61@amd.com>
 <MN2PR12MB29755CFCE09CEC0D9EB999D18F7B0@MN2PR12MB2975.namprd12.prod.outlook.com>
 <70c2c1cc-40b8-30da-7aee-f59fbc4d0d42@amd.com>
 <DM6PR12MB2971859C1BF16EE7E65B35B18F7B0@DM6PR12MB2971.namprd12.prod.outlook.com>
 <d6f9c508-3c23-c797-1cbc-7502dc4c0b13@amd.com>
 <DM6PR12MB29714AB9AD16FA3ABD7D62C28F7B0@DM6PR12MB2971.namprd12.prod.outlook.com>
 <dcc1124b-5e19-b018-7449-659a8b7d74ea@amd.com>
 <DM6PR12MB29710DFE90F22F5903499AFE8F7B0@DM6PR12MB2971.namprd12.prod.outlook.com>
 <91f4a0c4-23e3-a399-5cb1-fb01da922784@amd.com>
 <DM6PR12MB2971D540D3000B67E44970AF8F7B0@DM6PR12MB2971.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB2971D540D3000B67E44970AF8F7B0@DM6PR12MB2971.namprd12.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0072.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::49) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 57bb1b8e-564b-4383-fc08-08d7647e7c1f
x-ms-traffictypediagnostic: MWHPR12MB1648:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB1648D50E37F8521EE27C5D0AEA7B0@MWHPR12MB1648.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 0215D7173F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(51234002)(199004)(189003)(13464003)(6506007)(66066001)(6512007)(5660300002)(25786009)(99286004)(11346002)(76176011)(31686004)(52116002)(66476007)(7736002)(6246003)(966005)(81166006)(110136005)(256004)(14454004)(305945005)(2906002)(81156014)(30864003)(31696002)(3846002)(6116002)(66574012)(71200400001)(316002)(8936002)(6486002)(14444005)(8676002)(6436002)(71190400001)(66946007)(186003)(486006)(2616005)(66446008)(53546011)(446003)(64756008)(36756003)(478600001)(66556008)(102836004)(476003)(86362001)(229853002)(2501003)(6306002)(386003)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1648;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EI9tdKdwUWqyoArmYz1gYQUMlygZPNzfu2lqvWjL5IzvJzz+jyLP95/JHHgkoOPwj0GiOosj9TNv120bkXy6eZLvhEO8Wf/+UmVFPkYMB4dmNPa1Z8Y3ms2Mye7BJzDeat8yP3xU5G+qnpqKhjL9DoSd4W3063M1GwRQIuLQe7VPtD9iz3LR/YlSsRRDsMgkpx1SbkeVEq3qQ9jMLbTDuphrAeBH6yH3EP/OqV4uKGg6wcHZIUEAM6ME24ODwT2zttlbEEPp7vDlYm1mc+Vp8kz5ZH/y3P8NRlNdlIqk0GC42xiJ9MCRUQxkUPaPjduWlacbm+HtalQ1AOWvUjzXMZ56y5IdPGS9NQy32IRwyGD+lYEKlEMaOtuLB42xlZ78iC0QZ3p9qAKGfCFGXPu5ycShacIfYZejTL7WU44EtqR6FquflLv++I/cnXm2de0ZNHiQGatvn3fsOAEvHLXSn7mYDc9alYc38REr5fz0tWc=
Content-ID: <340219BE47701540859913DE6DC01EF5@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57bb1b8e-564b-4383-fc08-08d7647e7c1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2019 19:04:30.9811 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QMi9Cym95WPOUYL5uojAM/NO8RTW27gwEhvvx+nNVtgttkQ+YUosGT+rNVOXGa22JqzwKbEPX2+P6tqGW3TcyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1648
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wtMpX8AI9Sgm1TBHWHYDBSS7WRqVsvcyIUkx4SQ1LNE=;
 b=AaBZEV0uWTRhr4+SBDzcZ7QpzNgtEBGgxyO3HzLjPwb/qbFBQRi71qJYw8rRjMROZZ6YwZCChpnNoxik3UyBS4sinuLV+SiFqhXxqjBKcB+reteunWcuqR5FtD/xw7e2NfkmYTPsiZ+kn4fuYEMRbddKsbGs3lmnigsZpHIAWls=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
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

DQpPbiAxMS84LzE5IDU6NTQgQU0sIERlbmcsIEVtaWx5IHdyb3RlOg0KPiBIaSBDaHJpc3RpYW4s
DQo+ICAgICAgIFNvcnJ5LCBzZWVtcyBJIHVuZGVyc3RhbmQgd3JvbmcuIEFuZCBmcm9tIHRoZSBw
cmludCwgdGhlIGZyZWUgam9iJ3MgdGhyZWFkIGlzIHRoZSBzYW1lIGFzIGpvYiB0aW1lb3V0IHRo
cmVhZC4gU28gc2VlbXMgaGF2ZSBzb21lIGlzc3VlIGluIGZ1bmN0aW9uIGFtZGdwdV9kZXZpY2Vf
Z3B1X3JlY292ZXIuDQoNCkkgZG9uJ3QgdGhpbmsgaXQncyBjb3JyZWN0LCBzZWVtcyB5b3VyIHBy
aW50cyBqdXN0IGRvbid0IHByaW50IHRoZSBwaWRzIA0KYmVjYXVzZSBpdCdzIGFsbCB6ZXJvcyB3
aGljaCBjYW5ub3QgYmUgdHJ1ZSBmb3IgYW55IGtlcm5lbCBvciB1c2VyIG1vZGUgDQp0aHJlYWQu
IEluIGZhY3QgbG9va2luZyBhdCB0aGUgT09QcyBpIHNlZSB0aGUgYWN0dWFsIFREUiBqb2IgcGlk
IHdoaWNoIGlzIDU1DQoNCkNQVTogMyBQSUQ6IDU1IENvbW06IGt3b3JrZXIvMzoxIFRhaW50ZWQN
Cg0KQW5kcmV5DQoNCg0KPg0KPg0KPiBCZXN0IHdpc2hlcw0KPiBFbWlseSBEZW5nDQo+DQo+DQo+
DQo+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4gRnJvbTogS29lbmlnLCBDaHJpc3Rp
YW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4NCj4+IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIg
OCwgMjAxOSA2OjM1IFBNDQo+PiBUbzogRGVuZywgRW1pbHkgPEVtaWx5LkRlbmdAYW1kLmNvbT47
IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+PiBTdWJqZWN0OiBSZTogW1BBVENIXSBk
cm0vYW1kZ3B1OiBGaXggdGhlIG51bGwgcG9pbnRlciBpc3N1ZSBmb3IgdGRyDQo+Pg0KPj4gSGkg
RW1pbHksDQo+Pg0KPj4gZXhhY3RseSB0aGF0IGNhbid0IGhhcHBlbi4gU2VlIGhlcmU6DQo+Pg0K
Pj4+ICDCoMKgwqDCoMKgwqDCoCAvKiBEb24ndCBkZXN0cm95IGpvYnMgd2hpbGUgdGhlIHRpbWVv
dXQgd29ya2VyIGlzIHJ1bm5pbmcgKi8NCj4+PiAgwqDCoMKgwqDCoMKgwqAgaWYgKHNjaGVkLT50
aW1lb3V0ICE9IE1BWF9TQ0hFRFVMRV9USU1FT1VUICYmDQo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgIWNhbmNlbF9kZWxheWVkX3dvcmsoJnNjaGVkLT53b3JrX3RkcikpDQo+Pj4gIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gTlVMTDsNCj4+IFdlIG5ldmVyIGZyZWUg
am9icyB3aGlsZSB0aGUgdGltZW91dCB3b3JraW5nIGlzIHJ1bm5pbmcgdG8gcHJldmVudCBleGFj
dGx5DQo+PiB0aGF0IGlzc3VlLg0KPj4NCj4+IFJlZ2FyZHMsDQo+PiBDaHJpc3RpYW4uDQo+Pg0K
Pj4gQW0gMDguMTEuMTkgdW0gMTE6MzIgc2NocmllYiBEZW5nLCBFbWlseToNCj4+PiBIaSBDaHJp
c3RpYW4sDQo+Pj4gICAgICAgIFRoZSBkcm1fc2NoZWRfam9iX3RpbWVkb3V0LT4gYW1kZ3B1X2pv
Yl90aW1lZG91dCBjYWxsDQo+PiBhbWRncHVfZGV2aWNlX2dwdV9yZWNvdmVyLiBJIG1lYW4gdGhl
IG1haW4gc2NoZWR1bGVyIGZyZWUgdGhlIGpvYnMgd2hpbGUNCj4+IGluIGFtZGdwdV9kZXZpY2Vf
Z3B1X3JlY292ZXIsIGFuZCBiZWZvcmUgY2FsbGluZyBkcm1fc2NoZWRfc3RvcC4NCj4+PiBCZXN0
IHdpc2hlcw0KPj4+IEVtaWx5IERlbmcNCj4+Pg0KPj4+DQo+Pj4NCj4+Pj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4+Pj4gRnJvbTogS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5L
b2VuaWdAYW1kLmNvbT4NCj4+Pj4gU2VudDogRnJpZGF5LCBOb3ZlbWJlciA4LCAyMDE5IDY6MjYg
UE0NCj4+Pj4gVG86IERlbmcsIEVtaWx5IDxFbWlseS5EZW5nQGFtZC5jb20+OyBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4+PiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vYW1kZ3B1
OiBGaXggdGhlIG51bGwgcG9pbnRlciBpc3N1ZSBmb3IgdGRyDQo+Pj4+DQo+Pj4+IEhpIEVtaWx5
LA0KPj4+Pg0KPj4+PiB3ZWxsIHdobyBpcyBjYWxsaW5nIGFtZGdwdV9kZXZpY2VfZ3B1X3JlY292
ZXIoKSBpbiB0aGlzIGNhc2U/DQo+Pj4+DQo+Pj4+IFdoZW4gaXQncyBub3QgdGhlIHNjaGVkdWxl
ciB3ZSBzaG91bGRuJ3QgaGF2ZSBhIGd1aWx0eSBqb2IgaW4gdGhlIGZpcnN0IHBsYWNlLg0KPj4+
Pg0KPj4+PiBSZWdhcmRzLA0KPj4+PiBDaHJpc3RpYW4uDQo+Pj4+DQo+Pj4+IEFtIDA4LjExLjE5
IHVtIDExOjIyIHNjaHJpZWIgRGVuZywgRW1pbHk6DQo+Pj4+PiBIaSBDaHJpc2l0YW4sDQo+Pj4+
PiAgICAgICAgIE5vLCBJIGFtIHdpdGggdGhlIG5ldyBicmFuY2ggYW5kIGFsc28gaGFzIHRoZSBw
YXRjaC4gRXZlbiBpdA0KPj4+Pj4gYXJlIGZyZWVkIGJ5DQo+Pj4+IG1haW4gc2NoZWR1bGVyLCBo
b3cgd2UgY291bGQgYXZvaWQgbWFpbiBzY2hlZHVsZXIgdG8gZnJlZSBqb2JzIHdoaWxlDQo+Pj4+
IGVudGVyIHRvIGZ1bmN0aW9uIGFtZGdwdV9kZXZpY2VfZ3B1X3JlY292ZXI/DQo+Pj4+PiBCZXN0
IHdpc2hlcw0KPj4+Pj4gRW1pbHkgRGVuZw0KPj4+Pj4NCj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+Pj4+Pj4gRnJvbTogS29lbmlnLCBDaHJpc3RpYW4g
PENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4NCj4+Pj4+PiBTZW50OiBGcmlkYXksIE5vdmVtYmVy
IDgsIDIwMTkgNjoxNSBQTQ0KPj4+Pj4+IFRvOiBEZW5nLCBFbWlseSA8RW1pbHkuRGVuZ0BhbWQu
Y29tPjsgYW1kLQ0KPj4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4+Pj4+IFN1YmplY3Q6
IFJlOiBbUEFUQ0hdIGRybS9hbWRncHU6IEZpeCB0aGUgbnVsbCBwb2ludGVyIGlzc3VlIGZvciB0
ZHINCj4+Pj4+Pg0KPj4+Pj4+IEhpIEVtaWx5LA0KPj4+Pj4+DQo+Pj4+Pj4gaW4gdGhpcyBjYXNl
IHlvdSBhcmUgb24gYW4gb2xkIGNvZGUgYnJhbmNoLg0KPj4+Pj4+DQo+Pj4+Pj4gSm9icyBhcmUg
ZnJlZWQgbm93IGJ5IHRoZSBtYWluIHNjaGVkdWxlciB0aHJlYWQgYW5kIG9ubHkgaWYgbm8NCj4+
Pj4+PiB0aW1lb3V0IGhhbmRsZXIgaXMgcnVubmluZy4NCj4+Pj4+Pg0KPj4+Pj4+IFNlZSB0aGlz
IHBhdGNoIGhlcmU6DQo+Pj4+Pj4+IGNvbW1pdCA1OTE4MDQ1YzRlZDQ5MmZiNTgxM2Y5ODBkY2Y4
OWE5MGZlZmQwYTRlDQo+Pj4+Pj4+IEF1dGhvcjogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPg0KPj4+Pj4+PiBEYXRlOsKgwqAgVGh1IEFwciAxOCAxMTowMDoyMSAy
MDE5IC0wNDAwDQo+Pj4+Pj4+DQo+Pj4+Pj4+ICAgIMKgwqDCoCBkcm0vc2NoZWR1bGVyOiByZXdv
cmsgam9iIGRlc3RydWN0aW9uDQo+Pj4+Pj4gUmVnYXJkcywNCj4+Pj4+PiBDaHJpc3RpYW4uDQo+
Pj4+Pj4NCj4+Pj4+PiBBbSAwOC4xMS4xOSB1bSAxMToxMSBzY2hyaWViIERlbmcsIEVtaWx5Og0K
Pj4+Pj4+PiBIaSBDaHJpc3RpYW4sDQo+Pj4+Pj4+ICAgICAgICAgIFBsZWFzZSByZWZlciB0byBm
b2xsb3cgbG9nLCB3aGVuIGl0IGVudGVyIHRvDQo+Pj4+Pj4+IGFtZGdwdV9kZXZpY2VfZ3B1X3Jl
Y292ZXINCj4+Pj4+PiBmdW5jdGlvbiwgdGhlIGJhZCBqb2IgMDAwMDAwMDA1MDg2ODc5ZSBpcyBm
cmVlaW5nIGluIGZ1bmN0aW9uDQo+Pj4+Pj4gYW1kZ3B1X2pvYl9mcmVlX2NiICBhdCB0aGUgc2Ft
ZSB0aW1lLCBiZWNhdXNlIG9mIHRoZSBoYXJkd2FyZSBmZW5jZQ0KPj4+PiBzaWduYWwuDQo+Pj4+
Pj4gQnV0IGFtZGdwdV9kZXZpY2VfZ3B1X3JlY292ZXIgZ29lcyBmYXN0ZXIsIGF0IHRoaXMgY2Fz
ZSwgdGhlDQo+Pj4+Pj4gc19mZW5jZSBpcyBhbHJlYWR5IGZyZWVkLCBidXQgam9iIGlzIG5vdCBm
cmVlZCBpbiB0aW1lLiBUaGVuIHRoaXMgaXNzdWUNCj4+IG9jY3Vycy4NCj4+Pj4+Pj4gWyAgNDQ5
Ljc5MjE4OV0gW2RybTphbWRncHVfam9iX3RpbWVkb3V0IFthbWRncHVdXSAqRVJST1IqIHJpbmcN
Cj4+Pj4gc2RtYTANCj4+Pj4+Pj4gdGltZW91dCwgc2lnbmFsZWQgc2VxPTI0ODEsIGVtaXR0ZWQg
c2VxPTI0ODMgWyAgNDQ5Ljc5MzIwMl0NCj4+Pj4+Pj4gW2RybTphbWRncHVfam9iX3RpbWVkb3V0
IFthbWRncHVdXSAqRVJST1IqIFByb2Nlc3MgaW5mb3JtYXRpb246DQo+Pj4+Pj4gcHJvY2VzcyAg
cGlkIDAgdGhyZWFkICBwaWQgMCwgc19qb2I6MDAwMDAwMDA1MDg2ODc5ZSBbICA0NDkuNzk0MTYz
XQ0KPj4+Pj4+IGFtZGdwdQ0KPj4+Pj4+IDAwMDA6MDA6MDguMDogR1BVIHJlc2V0IGJlZ2luIQ0K
Pj4+Pj4+PiBbICA0NDkuNzk0MTc1XSBFbWlseTphbWRncHVfam9iX2ZyZWVfY2IsUHJvY2VzcyBp
bmZvcm1hdGlvbjoNCj4+Pj4+Pj4gcHJvY2VzcyBwaWQgMCB0aHJlYWQgIHBpZCAwLCBzX2pvYjow
MDAwMDAwMDUwODY4NzllIFsgIDQ0OS43OTQyMjFdDQo+Pj4+Pj4+IEVtaWx5OmFtZGdwdV9qb2Jf
ZnJlZV9jYixQcm9jZXNzIGluZm9ybWF0aW9uOiBwcm9jZXNzICBwaWQgMA0KPj4+Pj4+PiB0aHJl
YWQgcGlkIDAsIHNfam9iOjAwMDAwMDAwNjZlYjc0YWIgWyAgNDQ5Ljc5NDIyMl0NCj4+Pj4+Pj4g
RW1pbHk6YW1kZ3B1X2pvYl9mcmVlX2NiLFByb2Nlc3MgaW5mb3JtYXRpb246IHByb2Nlc3MgIHBp
ZCAwDQo+Pj4+Pj4+IHRocmVhZCBwaWQgMCwgc19qb2I6MDAwMDAwMDBkNDQzOGFkOSBbICA0NDku
Nzk0MjU1XQ0KPj4+Pj4+PiBFbWlseTphbWRncHVfam9iX2ZyZWVfY2IsUHJvY2VzcyBpbmZvcm1h
dGlvbjogcHJvY2VzcyAgcGlkIDANCj4+Pj4+Pj4gdGhyZWFkIHBpZCAwLCBzX2pvYjowMDAwMDAw
MGI2ZDY5YzY1IFsgIDQ0OS43OTQyNTddDQo+Pj4+Pj4+IEVtaWx5OmFtZGdwdV9qb2JfZnJlZV9j
YixQcm9jZXNzIGluZm9ybWF0aW9uOiBwcm9jZXNzICBwaWQgMA0KPj4+Pj4+PiB0aHJlYWQgcGlk
IDAsDQo+Pj4+Pj4gc19qb2I6MDAwMDAwMDBlYTg1ZTkyMiBbICA0NDkuNzk0Mjg3XQ0KPj4+Pj4+
IEVtaWx5OmFtZGdwdV9qb2JfZnJlZV9jYixQcm9jZXNzDQo+Pj4+Pj4gaW5mb3JtYXRpb246IHBy
b2Nlc3MgIHBpZCAwIHRocmVhZCAgcGlkIDAsIHNfam9iOjAwMDAwMDAwZWQzYTVhYzYgWw0KPj4+
Pj4+IDQ0OS43OTQzNjZdIEJVRzogdW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgTlVMTCBwb2ludGVy
IGRlcmVmZXJlbmNlDQo+Pj4+Pj4gYXQNCj4+Pj4+PiAwMDAwMDAwMDAwMDAwMGMwIFsgIDQ0OS44
MDA4MThdIFBHRCAwIFA0RCAwIFsgIDQ0OS44MDEwNDBdIE9vcHM6DQo+Pj4+Pj4gMDAwMCBbIzFd
IFNNUCBQVEkNCj4+Pj4+Pj4gWyAgNDQ5LjgwMTMzOF0gQ1BVOiAzIFBJRDogNTUgQ29tbToga3dv
cmtlci8zOjEgVGFpbnRlZDogRyAgICAgICAgICAgT0UNCj4+Pj4+PiA0LjE4LjAtMTUtZ2VuZXJp
YyAjMTZ+MTguMDQuMS1VYnVudHUNCj4+Pj4+Pj4gWyAgNDQ5LjgwMjE1N10gSGFyZHdhcmUgbmFt
ZTogUUVNVSBTdGFuZGFyZCBQQyAoaTQ0MEZYICsgUElJWCwNCj4+Pj4+Pj4gMTk5NiksIEJJT1Mg
VWJ1bnR1LTEuOC4yLTF1YnVudHUxIDA0LzAxLzIwMTQgWyAgNDQ5LjgwMjk0NF0NCj4+Pj4+Pj4g
V29ya3F1ZXVlOiBldmVudHMgZHJtX3NjaGVkX2pvYl90aW1lZG91dCBbYW1kX3NjaGVkXSBbDQo+
Pj4+Pj4+IDQ0OS44MDM0ODhdDQo+Pj4+IFJJUDoNCj4+Pj4+PiAwMDEwOmFtZGdwdV9kZXZpY2Vf
Z3B1X3JlY292ZXIrMHgxZGEvMHhiNjAgW2FtZGdwdV0NCj4+Pj4+Pj4gWyAgNDQ5LjgwNDAyMF0g
Q29kZTogZGQgZmYgZmYgNDkgMzkgYzUgNDggODkgNTUgYTggMGYgODUgNTYgZmYgZmYNCj4+Pj4+
Pj4gZmYNCj4+Pj4+Pj4gNDUgODUgZTQgMGYNCj4+Pj4+PiA4NSBhMSAwMCAwMCAwMCA0OCA4YiA0
NSBiMCA0OCA4NSBjMCAwZiA4NCA2MCAwMSAwMCAwMCA0OCA4YiA0MCAxMA0KPj4+Pj4+IDw0OD4g
OGINCj4+Pj4gOTgNCj4+Pj4+PiBjMCAwMCAgICAgICAgIDAwIDAwIDQ4IDg1IGRiIDBmIDg0IDRj
IDAxIDAwIDAwIDQ4IDhiIDQzIDQ4IGE4IDAxDQo+Pj4+Pj4+IFsgIDQ0OS44MDU1OTNdIFJTUDog
MDAxODpmZmZmYjRjN2MwOGY3ZDY4IEVGTEFHUzogMDAwMTAyODYgWw0KPj4+Pj4+PiA0NDkuODA2
MDMyXSBSQVg6IDAwMDAwMDAwMDAwMDAwMDAgUkJYOiAwMDAwMDAwMDAwMDAwMDAwIFJDWDoNCj4+
Pj4+Pj4gMDAwMDAwMDAwMDAwMDAwMCBbICA0NDkuODA2NjI1XSBSRFg6IGZmZmZiNGM3YzA4ZjVh
YzAgUlNJOg0KPj4+Pj4+PiAwMDAwMDAwZmZmZmZmZmUwIFJESTogMDAwMDAwMDAwMDAwMDI0NiBb
ICA0NDkuODA3MjI0XSBSQlA6DQo+Pj4+Pj4+IGZmZmZiNGM3YzA4ZjdkZTAgUjA4OiAwMDAwMDA2
OGI5ZDU0MDAwIFIwOTogMDAwMDAwMDAwMDAwMDAwMCBbDQo+Pj4+Pj4+IDQ0OS44MDc4MThdIFIx
MDogMDAwMDAwMDAwMDAwMDAwMCBSMTE6IDAwMDAwMDAwMDAwMDAxNDggUjEyOg0KPj4+Pj4+PiAw
MDAwMDAwMDAwMDAwMDAwIFsgIDQ0OS44MDg0MTFdIFIxMzogZmZmZmI0YzdjMDhmN2RhMCBSMTQ6
DQo+Pj4+Pj4+IGZmZmY4ZDgyYjg1MjVkNDAgUjE1OiBmZmZmOGQ4MmI4NTI1ZDQwIFsgIDQ0OS44
MDkwMDRdIEZTOg0KPj4+Pj4+PiAwMDAwMDAwMDAwMDAwMDAwKDAwMDApIEdTOmZmZmY4ZDgyYmZk
ODAwMDAoMDAwMCkNCj4+Pj4+Pj4ga25sR1M6MDAwMDAwMDAwMDAwMDAwMCBbICA0NDkuODA5Njc0
XSBDUzogIDAwMTAgRFM6IDAwMDAgRVM6IDAwMDANCj4+IENSMDoNCj4+Pj4+Pj4gMDAwMDAwMDA4
MDA1MDAzMyBbICA0NDkuODEwMTUzXSBDUjI6IDAwMDAwMDAwMDAwMDAwYzAgQ1IzOg0KPj4+Pj4+
PiAwMDAwMDAwMDNjYzBhMDAxIENSNDogMDAwMDAwMDAwMDM2MDZlMCBbICA0NDkuODEwNzQ3XSBE
UjA6DQo+Pj4+Pj4gMDAwMDAwMDAwMDAwMDAwMCBEUjE6IDAwMDAwMDAwMDAwMDAwMDAgRFIyOiAw
MDAwMDAwMDAwMDAwMDAwIFsNCj4+Pj4+PiA0NDkuODExMzQ0XSBEUjM6IDAwMDAwMDAwMDAwMDAw
MDAgRFI2OiAwMDAwMDAwMGZmZmUwZmYwIERSNzoNCj4+Pj4+PiAwMDAwMDAwMDAwMDAwNDAwIFsg
IDQ0OS44MTE5MzddIENhbGwgVHJhY2U6DQo+Pj4+Pj4+IFsgIDQ0OS44MTIyMDZdICBhbWRncHVf
am9iX3RpbWVkb3V0KzB4MTE0LzB4MTQwIFthbWRncHVdIFsNCj4+Pj4+Pj4gNDQ5LjgxMjYzNV0g
IGRybV9zY2hlZF9qb2JfdGltZWRvdXQrMHg0NC8weDkwIFthbWRfc2NoZWRdIFsNCj4+Pj4+Pj4g
NDQ5LjgxMzEzOV0gID8gYW1kZ3B1X2Nnc19kZXN0cm95X2RldmljZSsweDEwLzB4MTAgW2FtZGdw
dV0gWw0KPj4+Pj4+PiA0NDkuODEzNjA5XSAgPyBkcm1fc2NoZWRfam9iX3RpbWVkb3V0KzB4NDQv
MHg5MCBbYW1kX3NjaGVkXSBbDQo+Pj4+Pj4+IDQ0OS44MTQwNzddICBwcm9jZXNzX29uZV93b3Jr
KzB4MWZkLzB4M2YwIFsgIDQ0OS44MTQ0MTddDQo+Pj4+Pj4+IHdvcmtlcl90aHJlYWQrMHgzNC8w
eDQxMCBbICA0NDkuODE0NzI4XSAga3RocmVhZCsweDEyMS8weDE0MCBbDQo+Pj4+Pj4+IDQ0OS44
MTUwMDRdICA/IHByb2Nlc3Nfb25lX3dvcmsrMHgzZjAvMHgzZjAgWyAgNDQ5LjgxNTM3NF0gID8N
Cj4+Pj4+Pj4ga3RocmVhZF9jcmVhdGVfd29ya2VyX29uX2NwdSsweDcwLzB4NzANCj4+Pj4+Pj4g
WyAgNDQ5LjgxNTc5OV0gIHJldF9mcm9tX2ZvcmsrMHgzNS8weDQwDQo+Pj4+Pj4+DQo+Pj4+Pj4+
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4+Pj4+Pj4gRnJvbTogS29lbmlnLCBDaHJp
c3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4NCj4+Pj4+Pj4+IFNlbnQ6IEZyaWRheSwg
Tm92ZW1iZXIgOCwgMjAxOSA1OjQzIFBNDQo+Pj4+Pj4+PiBUbzogRGVuZywgRW1pbHkgPEVtaWx5
LkRlbmdAYW1kLmNvbT47IGFtZC0NCj4+Pj4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4+
Pj4+Pj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2FtZGdwdTogRml4IHRoZSBudWxsIHBvaW50
ZXIgaXNzdWUgZm9yDQo+Pj4+Pj4+PiB0ZHINCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBBbSAwOC4xMS4x
OSB1bSAxMDozOSBzY2hyaWViIERlbmcsIEVtaWx5Og0KPj4+Pj4+Pj4+IFNvcnJ5LCBwbGVhc2Ug
dGFrZSB5b3VyIHRpbWUuDQo+Pj4+Pj4+PiBIYXZlIHlvdSBzZWVuIG15IG90aGVyIHJlc3BvbnNl
IGEgYml0IGJlbG93Pw0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IEkgY2FuJ3QgZm9sbG93IGhvdyBpdCB3
b3VsZCBiZSBwb3NzaWJsZSBmb3Igam9iLT5zX2ZlbmNlIHRvIGJlDQo+Pj4+Pj4+PiBOVUxMIHdp
dGhvdXQgdGhlIGpvYiBhbHNvIGJlaW5nIGZyZWVkLg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IFNvIGl0
IGxvb2tzIGxpa2UgdGhpcyBwYXRjaCBpcyBqdXN0IHBhcGVyaW5nIG92ZXIgc29tZSBiaWdnZXIg
aXNzdWVzLg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IFJlZ2FyZHMsDQo+Pj4+Pj4+PiBDaHJpc3RpYW4u
DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+IEJlc3Qgd2lzaGVzDQo+Pj4+Pj4+Pj4gRW1pbHkgRGVuZw0K
Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPj4+Pj4+Pj4+PiBGcm9tOiBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0
aWFuLktvZW5pZ0BhbWQuY29tPg0KPj4+Pj4+Pj4+PiBTZW50OiBGcmlkYXksIE5vdmVtYmVyIDgs
IDIwMTkgNTowOCBQTQ0KPj4+Pj4+Pj4+PiBUbzogRGVuZywgRW1pbHkgPEVtaWx5LkRlbmdAYW1k
LmNvbT47IGFtZC0NCj4+Pj4+PiBnZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+Pj4+Pj4+Pj4+
IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS9hbWRncHU6IEZpeCB0aGUgbnVsbCBwb2ludGVyIGlz
c3VlIGZvcg0KPj4+Pj4+Pj4+PiB0ZHINCj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4gQW0gMDguMTEu
MTkgdW0gMDk6NTIgc2NocmllYiBEZW5nLCBFbWlseToNCj4+Pj4+Pj4+Pj4+IFBpbmcuLi4uLg0K
Pj4+Pj4+Pj4+PiBZb3UgbmVlZCB0byBnaXZlIG1lIGF0IGxlYXN0IGVub3VnaCB0aW1lIHRvIHdh
a2UgdXAgOikNCj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4+IEJlc3Qgd2lzaGVzDQo+Pj4+Pj4+Pj4+
PiBFbWlseSBEZW5nDQo+Pj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4+DQo+Pj4+
Pj4+Pj4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+Pj4+Pj4+Pj4+PiBGcm9tOiBh
bWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbg0KPj4+PiBC
ZWhhbGYNCj4+Pj4+Pj4+Pj4+PiBPZiBEZW5nLCBFbWlseQ0KPj4+Pj4+Pj4+Pj4+IFNlbnQ6IEZy
aWRheSwgTm92ZW1iZXIgOCwgMjAxOSAxMDo1NiBBTQ0KPj4+Pj4+Pj4+Pj4+IFRvOiBLb2VuaWcs
IENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPjsgYW1kLQ0KPj4+Pj4+Pj4+Pj4+
IGdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+Pj4+Pj4+Pj4+PiBTdWJqZWN0OiBSRTogW1BB
VENIXSBkcm0vYW1kZ3B1OiBGaXggdGhlIG51bGwgcG9pbnRlciBpc3N1ZQ0KPj4+Pj4+Pj4+Pj4+
IGZvciB0ZHINCj4+Pj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+Pj4+PiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPj4+Pj4+Pj4+Pj4+PiBGcm9tOiBDaHJpc3RpYW4gS8O2bmlnIDxja29lbmlnLmxl
aWNodHp1bWVya2VuQGdtYWlsLmNvbT4NCj4+Pj4+Pj4+Pj4+Pj4gU2VudDogVGh1cnNkYXksIE5v
dmVtYmVyIDcsIDIwMTkgNzoyOCBQTQ0KPj4+Pj4+Pj4+Pj4+PiBUbzogRGVuZywgRW1pbHkgPEVt
aWx5LkRlbmdAYW1kLmNvbT47DQo+Pj4+Pj4+Pj4+Pj4+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQo+Pj4+Pj4+Pj4+Pj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS9hbWRncHU6IEZp
eCB0aGUgbnVsbCBwb2ludGVyIGlzc3VlDQo+Pj4+Pj4+Pj4+Pj4+IGZvciB0ZHINCj4+Pj4+Pj4+
Pj4+Pj4NCj4+Pj4+Pj4+Pj4+Pj4gQW0gMDcuMTEuMTkgdW0gMTE6MjUgc2NocmllYiBFbWlseSBE
ZW5nOg0KPj4+Pj4+Pj4+Pj4+Pj4gV2hlbiB0aGUgam9iIGlzIGFscmVhZHkgc2lnbmFsZWQsIHRo
ZSBzX2ZlbmNlIGlzIGZyZWVkLg0KPj4+Pj4+Pj4+Pj4+Pj4gVGhlbiBpdCB3aWxsIGhhcyBudWxs
IHBvaW50ZXIgaW4gYW1kZ3B1X2RldmljZV9ncHVfcmVjb3Zlci4NCj4+Pj4+Pj4+Pj4+Pj4gTkFL
LCB0aGUgc19mZW5jZSBpcyBvbmx5IHNldCB0byBOVUxMIHdoZW4gdGhlIGpvYiBpcyBkZXN0cm95
ZWQuDQo+Pj4+Pj4+Pj4+Pj4+IFNlZSBkcm1fc2NoZWRfam9iX2NsZWFudXAoKS4NCj4+Pj4+Pj4+
Pj4+PiBJIGtub3cgaXQgaXMgc2V0IHRvIE5VTEwgaW4gZHJtX3NjaGVkX2pvYl9jbGVhbnVwLiBC
dXQgaW4gb25lDQo+Pj4+Pj4+Pj4+Pj4gY2FzZSwgd2hlbiBpdCBlbnRlciBpbnRvIHRoZSBhbWRn
cHVfZGV2aWNlX2dwdV9yZWNvdmVyLCBpdA0KPj4+Pj4+Pj4+Pj4+IGFscmVhZHkgaW4gZHJtX3Nj
aGVkX2pvYl9jbGVhbnVwLCBhbmQgYXQgdGhpcyB0aW1lLCBpdCB3aWxsDQo+Pj4+Pj4+Pj4+Pj4g
Z28gdG8gZnJlZQ0KPj4+Pj4+IGpvYi4NCj4+Pj4+Pj4+Pj4+PiBCdXQgdGhlIGFtZGdwdV9kZXZp
Y2VfZ3B1X3JlY292ZXIgc29tZXRpbWVzIGlzIGZhc3Rlci4gQXQNCj4+Pj4+Pj4+Pj4+PiB0aGF0
IHRpbWUsIGpvYiBpcyBub3QgZnJlZWQsIGJ1dCBzX2ZlbmNlIGlzIGFscmVhZHkgTlVMTC4NCj4+
Pj4+Pj4+Pj4gTm8sIHRoYXQgY2FzZSBjYW4ndCBoYXBwZW4uIFNlZSBoZXJlOg0KPj4+Pj4+Pj4+
Pg0KPj4+Pj4+Pj4+Pj4gICAgICDCoMKgwqDCoMKgwqDCoCBkcm1fc2NoZWRfam9iX2NsZWFudXAo
c19qb2IpOw0KPj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4+ICAgICAgwqDCoMKgwqDCoMKgwqAgYW1k
Z3B1X3JpbmdfcHJpb3JpdHlfcHV0KHJpbmcsIHNfam9iLT5zX3ByaW9yaXR5KTsNCj4+Pj4+Pj4+
Pj4+ICAgICAgwqDCoMKgwqDCoMKgwqAgZG1hX2ZlbmNlX3B1dChqb2ItPmZlbmNlKTsNCj4+Pj4+
Pj4+Pj4+ICAgICAgwqDCoMKgwqDCoMKgwqAgYW1kZ3B1X3N5bmNfZnJlZSgmam9iLT5zeW5jKTsN
Cj4+Pj4+Pj4+Pj4+ICAgICAgwqDCoMKgwqDCoMKgwqAgYW1kZ3B1X3N5bmNfZnJlZSgmam9iLT5z
Y2hlZF9zeW5jKTsNCj4+Pj4+Pj4+Pj4+ICAgICAgwqDCoMKgwqDCoMKgwqAga2ZyZWUoam9iKTsN
Cj4+Pj4+Pj4+Pj4gVGhlIGpvYiBpdHNlbGYgaXMgZnJlZWQgdXAgZGlyZWN0bHkgYWZ0ZXIgZnJl
ZWluZyB0aGUgcmVmZXJlbmNlDQo+Pj4+Pj4+Pj4+IHRvIHRoZQ0KPj4+Pj4+IHNfZmVuY2UuDQo+
Pj4+Pj4+Pj4+IFNvIHlvdSBhcmUganVzdCBwYXBlcmluZyBvdmVyIGEgbXVjaCBiaWdnZXIgcHJv
YmxlbSBoZXJlLiBUaGlzDQo+Pj4+Pj4+Pj4+IHBhdGNoIGlzIGEgY2xlYXIgTkFLLg0KPj4+Pj4+
Pj4+Pg0KPj4+Pj4+Pj4+PiBSZWdhcmRzLA0KPj4+Pj4+Pj4+PiBDaHJpc3RpYW4uDQo+Pj4+Pj4+
Pj4+DQo+Pj4+Pj4+Pj4+Pj4+IFdoZW4geW91IHNlZSBhIGpvYiB3aXRob3V0IGFuIHNfZmVuY2Ug
dGhlbiB0aGF0IG1lYW5zIHRoZQ0KPj4+Pj4+Pj4+Pj4+PiBwcm9ibGVtIGlzIHNvbWV3aGVyZSBl
bHNlLg0KPj4+Pj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+Pj4+PiBSZWdhcmRzLA0KPj4+Pj4+Pj4+Pj4+
PiBDaHJpc3RpYW4uDQo+Pj4+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5
OiBFbWlseSBEZW5nIDxFbWlseS5EZW5nQGFtZC5jb20+DQo+Pj4+Pj4+Pj4+Pj4+PiAtLS0NCj4+
Pj4+Pj4+Pj4+Pj4+ICAgICAgICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rl
dmljZS5jIHwgIDIgKy0NCj4+Pj4+Pj4+Pj4+Pj4+ICAgICAgICAgZHJpdmVycy9ncHUvZHJtL3Nj
aGVkdWxlci9zY2hlZF9tYWluLmMgICAgIHwgMTEgKysrKysrLS0tDQo+PiAtLQ0KPj4+Pj4+Pj4+
Pj4+Pj4gICAgICAgICAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlv
bnMoLSkNCj4+Pj4+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQo+Pj4+Pj4+Pj4+Pj4+PiBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0KPj4+Pj4+Pj4+Pj4+Pj4g
aW5kZXggZTZjZTk0OS4uNWE4ZjA4ZSAxMDA2NDQNCj4+Pj4+Pj4+Pj4+Pj4+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0KPj4+Pj4+Pj4+Pj4+Pj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQo+Pj4+Pj4+Pj4+
Pj4+PiBAQCAtNDA3NSw3ICs0MDc1LDcgQEAgaW50DQo+Pj4+IGFtZGdwdV9kZXZpY2VfZ3B1X3Jl
Y292ZXIoc3RydWN0DQo+Pj4+Pj4+Pj4+Pj4+IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+Pj4+Pj4+
Pj4+Pj4+PiAgICAgICAgIAkgKg0KPj4+Pj4+Pj4+Pj4+Pj4gICAgICAgICAJICogam9iLT5iYXNl
IGhvbGRzIGEgcmVmZXJlbmNlIHRvIHBhcmVudCBmZW5jZQ0KPj4+Pj4+Pj4+Pj4+Pj4gICAgICAg
ICAJICovDQo+Pj4+Pj4+Pj4+Pj4+PiAtCWlmIChqb2IgJiYgam9iLT5iYXNlLnNfZmVuY2UtPnBh
cmVudCAmJg0KPj4+Pj4+Pj4+Pj4+Pj4gKwlpZiAoam9iICYmIGpvYi0+YmFzZS5zX2ZlbmNlICYm
IGpvYi0+YmFzZS5zX2ZlbmNlLQ0KPj4+IHBhcmVudA0KPj4+Pj4+Pj4gJiYNCj4+Pj4+Pj4+Pj4+
Pj4+ICAgICAgICAgCSAgICBkbWFfZmVuY2VfaXNfc2lnbmFsZWQoam9iLT5iYXNlLnNfZmVuY2Ut
PnBhcmVudCkpDQo+Pj4+Pj4+Pj4+Pj4+PiAgICAgICAgIAkJam9iX3NpZ25hbGVkID0gdHJ1ZTsN
Cj4+Pj4+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMNCj4+Pj4+Pj4+Pj4+Pj4+IGIvZHJpdmVycy9ncHUv
ZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMNCj4+Pj4+Pj4+Pj4+Pj4+IGluZGV4IDMxODA5Y2Eu
LjU2Y2MxMGUgMTAwNjQ0DQo+Pj4+Pj4+Pj4+Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2No
ZWR1bGVyL3NjaGVkX21haW4uYw0KPj4+Pj4+Pj4+Pj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3NjaGVkdWxlci9zY2hlZF9tYWluLmMNCj4+Pj4+Pj4+Pj4+Pj4+IEBAIC0zMzQsOCArMzM0LDgg
QEAgdm9pZA0KPj4gZHJtX3NjaGVkX2luY3JlYXNlX2thcm1hKHN0cnVjdA0KPj4+Pj4+Pj4+Pj4+
PiBkcm1fc2NoZWRfam9iDQo+Pj4+Pj4+Pj4+Pj4+PiAqYmFkKQ0KPj4+Pj4+Pj4+Pj4+Pj4NCj4+
Pj4+Pj4+Pj4+Pj4+ICAgICAgICAgCQkJc3Bpbl9sb2NrKCZycS0+bG9jayk7DQo+Pj4+Pj4+Pj4+
Pj4+PiAgICAgICAgIAkJCWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShlbnRpdHksIHRtcCwNCj4+
Pj4gJnJxLQ0KPj4+Pj4+Pj4+IGVudGl0aWVzLA0KPj4+Pj4+Pj4+Pj4+PiBsaXN0KSB7DQo+Pj4+
Pj4+Pj4+Pj4+PiAtCQkJCWlmIChiYWQtPnNfZmVuY2UtDQo+Pj4gc2NoZWR1bGVkLmNvbnRleHQN
Cj4+Pj4+Pj4+ID09DQo+Pj4+Pj4+Pj4+Pj4+PiAtCQkJCSAgICBlbnRpdHktPmZlbmNlX2NvbnRl
eHQpIHsNCj4+Pj4+Pj4+Pj4+Pj4+ICsJCQkJaWYgKGJhZC0+c19mZW5jZSAmJiAoYmFkLQ0KPj4+
IHNfZmVuY2UtDQo+Pj4+Pj4+Pj4+Pj4+PiBzY2hlZHVsZWQuY29udGV4dCA9PQ0KPj4+Pj4+Pj4+
Pj4+Pj4gKwkJCQkgICAgZW50aXR5LT5mZW5jZV9jb250ZXh0KSkgew0KPj4+Pj4+Pj4+Pj4+Pj4g
ICAgICAgICAJCQkJCWlmIChhdG9taWNfcmVhZCgmYmFkLQ0KPj4+Pj4+Pj4+IGthcm1hKSA+DQo+
Pj4+Pj4+Pj4+Pj4+PiAgICAgICAgIAkJCQkJICAgIGJhZC0+c2NoZWQtDQo+Pj4+PiBoYW5nX2xp
bWl0KQ0KPj4+Pj4+Pj4+Pj4+Pj4gICAgICAgICAJCQkJCQlpZiAoZW50aXR5LQ0KPj4+Pj4gZ3Vp
bHR5KSBAQCAtMzc2LDcgKzM3Niw3IEBAIHZvaWQNCj4+Pj4+Pj4+Pj4+Pj4+IGRybV9zY2hlZF9z
dG9wKHN0cnVjdA0KPj4+Pj4+Pj4gZHJtX2dwdV9zY2hlZHVsZXINCj4+Pj4+Pj4+Pj4+Pj4gKnNj
aGVkLCBzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqYmFkKQ0KPj4+Pj4+Pj4+Pj4+Pj4gICAgICAgICAJ
ICogVGhpcyBpdGVyYXRpb24gaXMgdGhyZWFkIHNhZmUgYXMgc2NoZWQgdGhyZWFkIGlzDQo+Pj4+
IHN0b3BwZWQuDQo+Pj4+Pj4+Pj4+Pj4+PiAgICAgICAgIAkgKi8NCj4+Pj4+Pj4+Pj4+Pj4+ICAg
ICAgICAgCWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZV9yZXZlcnNlKHNfam9iLCB0bXAsDQo+Pj4+
Pj4+Pj4+Pj4+PiAmc2NoZWQtIHJpbmdfbWlycm9yX2xpc3QsIG5vZGUpIHsNCj4+Pj4+Pj4+Pj4+
Pj4+IC0JCWlmIChzX2pvYi0+c19mZW5jZS0+cGFyZW50ICYmDQo+Pj4+Pj4+Pj4+Pj4+PiArCQlp
ZiAoc19qb2ItPnNfZmVuY2UgJiYgc19qb2ItPnNfZmVuY2UtPnBhcmVudA0KPj4gJiYNCj4+Pj4+
Pj4+Pj4+Pj4+ICAgICAgICAgCQkgICAgZG1hX2ZlbmNlX3JlbW92ZV9jYWxsYmFjayhzX2pvYi0N
Cj4+Pj4+IHNfZmVuY2UtDQo+Pj4+Pj4+Pj4gcGFyZW50LA0KPj4+Pj4+Pj4+Pj4+Pj4gICAgICAg
ICAJCQkJCSAgICAgICZzX2pvYi0+Y2IpKSB7DQo+Pj4+Pj4+Pj4+Pj4+PiAgICAgICAgIAkJCWF0
b21pY19kZWMoJnNjaGVkLT5od19ycV9jb3VudCk7DQo+Pj4+IEBAIC0NCj4+Pj4+Pj4+IDM5NSw3
DQo+Pj4+Pj4+Pj4+Pj4gKzM5NSw4IEBAIHZvaWQNCj4+Pj4+Pj4+Pj4+Pj4+IGRybV9zY2hlZF9z
dG9wKHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlcg0KPj4+Pj4+Pj4+Pj4+PiAqc2NoZWQsIHN0cnVj
dCBkcm1fc2NoZWRfam9iICpiYWQpDQo+Pj4+Pj4+Pj4+Pj4+PiAgICAgICAgIAkJCSAqDQo+Pj4+
Pj4+Pj4+Pj4+PiAgICAgICAgIAkJCSAqIEpvYiBpcyBzdGlsbCBhbGl2ZSBzbyBmZW5jZSByZWZj
b3VudCBhdA0KPj4+PiBsZWFzdCAxDQo+Pj4+Pj4+Pj4+Pj4+PiAgICAgICAgIAkJCSAqLw0KPj4+
Pj4+Pj4+Pj4+Pj4gLQkJCWRtYV9mZW5jZV93YWl0KCZzX2pvYi0+c19mZW5jZS0NCj4+PiBmaW5p
c2hlZCwNCj4+Pj4+Pj4+IGZhbHNlKTsNCj4+Pj4+Pj4+Pj4+Pj4+ICsJCQlpZiAoc19qb2ItPnNf
ZmVuY2UpDQo+Pj4+Pj4+Pj4+Pj4+PiArCQkJCWRtYV9mZW5jZV93YWl0KCZzX2pvYi0NCj4+PiBz
X2ZlbmNlLQ0KPj4+Pj4+Pj4+IGZpbmlzaGVkLA0KPj4+Pj4+Pj4+Pj4+PiBmYWxzZSk7DQo+Pj4+
Pj4+Pj4+Pj4+PiAgICAgICAgIAkJCS8qDQo+Pj4+Pj4+Pj4+Pj4+PiAgICAgICAgIAkJCSAqIFdl
IG11c3Qga2VlcCBiYWQgam9iIGFsaXZlIGZvciBsYXRlcg0KPj4+PiB1c2UNCj4+Pj4+Pj4+IGR1
cmluZyBAQA0KPj4+Pj4+Pj4+Pj4+PiAtNDM4LDcNCj4+Pj4+Pj4+Pj4+Pj4+ICs0MzksNyBAQCB2
b2lkIGRybV9zY2hlZF9zdGFydChzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXINCj4+Pj4+PiAqc2No
ZWQsDQo+Pj4+Pj4+Pj4+Pj4+PiArYm9vbA0KPj4+Pj4+Pj4+Pj4+PiBmdWxsX3JlY292ZXJ5KQ0K
Pj4+Pj4+Pj4+Pj4+Pj4gICAgICAgICAJICogR1BVIHJlY292ZXJzIGNhbid0IHJ1biBpbiBwYXJh
bGxlbC4NCj4+Pj4+Pj4+Pj4+Pj4+ICAgICAgICAgCSAqLw0KPj4+Pj4+Pj4+Pj4+Pj4gICAgICAg
ICAJbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKHNfam9iLCB0bXAsDQo+Pj4+Pj4+Pj4+Pj4+PiAm
c2NoZWQtPnJpbmdfbWlycm9yX2xpc3QsDQo+Pj4+Pj4+Pj4+Pj4+PiBub2RlKQ0KPj4+Pj4+Pj4+
Pj4+PiB7DQo+Pj4+Pj4+Pj4+Pj4+PiAtCQlzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSA9IHNfam9i
LT5zX2ZlbmNlLQ0KPj4+IHBhcmVudDsNCj4+Pj4+Pj4+Pj4+Pj4+ICsJCXN0cnVjdCBkbWFfZmVu
Y2UgKmZlbmNlID0gc19qb2ItPnNfZmVuY2UgPw0KPj4gc19qb2ItDQo+Pj4+Pj4+Pj4gc19mZW5j
ZS0NCj4+Pj4+Pj4+Pj4+Pj4+IHBhcmVudCA6DQo+Pj4+Pj4+Pj4+Pj4+PiArTlVMTDsNCj4+Pj4+
Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+Pj4+PiAgICAgICAgIAkJYXRvbWljX2luYygmc2NoZWQtPmh3
X3JxX2NvdW50KTsNCj4+Pj4+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+Pj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4+Pj4+Pj4+Pj4+PiBhbWQtZ2Z4IG1h
aWxpbmcgbGlzdA0KPj4+Pj4+Pj4+Pj4+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+
Pj4+Pj4+Pj4+Pj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4DQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fDQo+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
