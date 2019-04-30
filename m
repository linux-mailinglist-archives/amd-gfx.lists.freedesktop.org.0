Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6502FE5B
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 19:03:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4614089214;
	Tue, 30 Apr 2019 17:03:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700072.outbound.protection.outlook.com [40.107.70.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3A989208
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 17:03:28 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1196.namprd12.prod.outlook.com (10.168.237.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Tue, 30 Apr 2019 17:03:27 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::70fc:f26c:1e22:73ba]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::70fc:f26c:1e22:73ba%10]) with mapi id 15.20.1835.018; Tue, 30 Apr
 2019 17:03:27 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 27/27] drm/amdgpu: Fix GTT size calculation
Thread-Topic: [PATCH 27/27] drm/amdgpu: Fix GTT size calculation
Thread-Index: AQHU/ZYxPIKog0WHeUWa+2vMcdfmZqZTFL0AgACzGYCAAKw/gIAAZc6AgAAYKIA=
Date: Tue, 30 Apr 2019 17:03:26 +0000
Message-ID: <f5c698ad-2aff-b3c5-2041-05a10983438a@amd.com>
References: <20190428074331.30107-1-Felix.Kuehling@amd.com>
 <20190428074331.30107-28-Felix.Kuehling@amd.com>
 <86fa9fc3-7a8f-9855-ae1d-5c7ccf2b5260@gmail.com>
 <1b1ec993-1c4b-8661-9b3f-ac0ad8ae64c7@amd.com>
 <134a4999-776f-44c6-99a2-42e8b9366a73@gmail.com>
 <9f882acd-c48f-3bbd-2d90-659c2edead39@amd.com>
In-Reply-To: <9f882acd-c48f-3bbd-2d90-659c2edead39@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM3PR04CA0127.eurprd04.prod.outlook.com (2603:10a6:207::11)
 To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 166ff745-8301-44e3-9cc1-08d6cd8dc2f4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1196; 
x-ms-traffictypediagnostic: DM5PR12MB1196:
x-microsoft-antispam-prvs: <DM5PR12MB1196BFA0F0A12B30536D0BA8833A0@DM5PR12MB1196.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(136003)(396003)(376002)(366004)(199004)(189003)(6486002)(186003)(2616005)(71190400001)(6506007)(102836004)(386003)(93886005)(53546011)(71200400001)(229853002)(5660300002)(305945005)(8676002)(65956001)(8936002)(81156014)(81166006)(476003)(446003)(11346002)(486006)(31686004)(6436002)(68736007)(66574012)(65806001)(58126008)(64126003)(86362001)(99286004)(97736004)(2906002)(316002)(110136005)(6512007)(46003)(65826007)(25786009)(4326008)(6246003)(76176011)(53936002)(14444005)(72206003)(478600001)(7736002)(6116002)(256004)(2501003)(52116002)(66476007)(66556008)(64756008)(66446008)(36756003)(31696002)(66946007)(14454004)(73956011)(375104003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1196;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jplXjSAn1q601BvvRRiQm/yELy96EevHJwPRV2p+QA5MFUZ41umeTagwRHqfngkbaFePsY0jg2RUC1ZkbCN+KCTUJNQQJ7/4xmU4xzw07WuPWyCK7RQoCEsYBFw1N7VeN8pmGfog87v+kkAAg9ym5yRZQj4BTMY3syX2bz6sTrv138EnUqYo1tHgzbpCQgKQ0O5ujepHgkyJUz+HhQNsHKHxY1fJf2f9PZriJ9RotKOg4IX9aRrrDqf4iGmTBi/rGsfXgKg5a6cLPi0MyVwYA+QcXHlGJNLBNGJjM3UOGDlajnHgG4bV+gam9gPTIVN9CnwhMSaSywxAc7coPE3pk2p1CYnh/cUWtY7VnlwkYUT7bX6PvJgb4XtGB0cb5T7WTLudwOL+AJd6HEoGFCmEorYS9zu8NEOgAhJippQoM5Y=
Content-ID: <44720CDFAA96244E8AE67FEF8457802C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 166ff745-8301-44e3-9cc1-08d6cd8dc2f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 17:03:26.8901 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1196
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uuh1NoV3L5B1na7gMmlepMlfq7qN38b0aUedbJ9Djw4=;
 b=BNhtiBKuDr9ntl8l6fFG+eSbR4BeWDt7ZmCcBnxKZ6HxTOg09OJvrhGkxwOM7WE3iLSbvwg6Jmh7jo7ffziBViYPC8TjcshzVYjkZfih2unnEBja51O2VwNxrroxl7U0j0Kd2OJVVptjRDccRF3wV3c6vD+8NEE4gjwCQ+nUVR8=
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
Cc: "Russell, Kent" <Kent.Russell@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMzAuMDQuMTkgdW0gMTc6MzYgc2NocmllYiBLdWVobGluZywgRmVsaXg6DQo+IE9uIDIwMTkt
MDQtMzAgNTozMiBhLm0uLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOg0KPj4gW0NBVVRJT046IEV4
dGVybmFsIEVtYWlsXQ0KPj4NCj4+IEFtIDMwLjA0LjE5IHVtIDAxOjE2IHNjaHJpZWIgS3VlaGxp
bmcsIEZlbGl4Og0KPj4+IE9uIDIwMTktMDQtMjkgODozNCBhLm0uLCBDaHJpc3RpYW4gS8O2bmln
IHdyb3RlOg0KPj4+PiBBbSAyOC4wNC4xOSB1bSAwOTo0NCBzY2hyaWViIEt1ZWhsaW5nLCBGZWxp
eDoNCj4+Pj4+IEZyb206IEtlbnQgUnVzc2VsbCA8a2VudC5ydXNzZWxsQGFtZC5jb20+DQo+Pj4+
Pg0KPj4+Pj4gR1RUIHNpemUgaXMgY3VycmVudGx5IGxpbWl0ZWQgdG8gdGhlIG1pbmltdW0gb2Yg
VlJBTSBzaXplIG9yIDMvNCBvZg0KPj4+Pj4gc3lzdGVtIG1lbW9yeS4gVGhpcyBzZXZlcmVseSBs
aW1pdHMgdGhlIHF1YW5pdGl0eSBvZiBzeXN0ZW0gbWVtb3J5DQo+Pj4+PiB0aGF0IGNhbiBiZSB1
c2VkIGJ5IFJPQ20gYXBwbGljYXRpb24uDQo+Pj4+Pg0KPj4+Pj4gSW5jcmVhc2UgR1RUIHNpemUg
dG8gdGhlIG1heGltdW0gb2YgVlJBTSBzaXplIG9yIHN5c3RlbSBtZW1vcnkgc2l6ZS4NCj4+Pj4g
V2VsbCwgTkFLLg0KPj4+Pg0KPj4+PiBUaGlzIGxpbWl0IHdhcyBkb25lIG9uIHB1cnBvc2UgYmVj
YXVzZSB3ZSBvdGhlcndpc2UgdGhlDQo+Pj4+IG1heC10ZXh0dXJlLXNpemUgd291bGQgYmUgY3Jh
c2hpbmcgdGhlIHN5c3RlbSBiZWNhdXNlIHRoZSBPT00ga2lsbGVyDQo+Pj4+IHdvdWxkIGJlIGNh
dXNpbmcgYSBzeXN0ZW0gcGFuaWMuDQo+Pj4+DQo+Pj4+IFVzaW5nIG1vcmUgdGhhbiA3NSUgb2Yg
c3lzdGVtIG1lbW9yeSBieSB0aGUgR1BVIGF0IHRoZSBzYW1lIHRpbWUgbWFrZXMNCj4+Pj4gdGhl
IHN5c3RlbSB1bnN0YWJsZSBhbmQgc28gd2UgY2FuJ3QgYWxsb3cgdGhhdCBieSBkZWZhdWx0Lg0K
Pj4+IExpa2Ugd2UgZGlzY3Vzc2VkLCB0aGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBpcyB0b28g
bGltaXRpbmcuIE9uIGEgRmlqaQ0KPj4+IHN5c3RlbSB3aXRoIDRHQiBWUkFNIGFuZCAzMkdCIHN5
c3RlbSBtZW1vcnksIGl0IGxpbWl0cyBzeXN0ZW0gbWVtb3J5DQo+Pj4gYWxsb2NhdGlvbnMgdG8g
NEdCLiBJIHRoaW5rIHRoaXMgd29ya2Fyb3VuZCB3YXMgZml4ZWQgb25jZSBiZWZvcmUgYW5kDQo+
Pj4gcmV2ZXJ0ZWQgYmVjYXVzZSBpdCBicm9rZSBhIENaIHN5c3RlbSB3aXRoIDFHQiBzeXN0ZW0g
bWVtb3J5LiBTbyBJDQo+Pj4gc3VzcGVjdCB0aGF0IHRoaXMgaXMgYW4gaXNzdWUgYWZmZWN0aW5n
IHNtYWxsIG1lbW9yeSBzeXN0ZW1zIHdoZXJlIG1heWJlDQo+Pj4gdGhlIDEvMiBzeXN0ZW0gbWVt
b3J5IGxpbWl0IGluIFRUTSBpc24ndCBzdWZmaWNpZW50IHRvIHByb3RlY3QgZnJvbSBPT00NCj4+
PiBwYW5pY3MuDQo+PiBXZWxsIGl0IG5vdCBvbmx5IGJyb2tlIG9uIGEgMUdCIENaIHN5c3RlbSwg
dGhpcyB3YXMganVzdCB3aGVyZSBBbmRyZXkNCj4+IHJlcHJvZHVjZWQgaXQuIFdlIGdvdCByZXBv
cnRzIGZyb20gYWxsIGtpbmQgb2Ygc3lzdGVtcy4NCj4gSSdkIGxpa2UgdG8gc2VlIHRob3NlIHJl
cG9ydHMuIFRoaXMgcGF0Y2ggaGFzIGJlZW4gaW5jbHVkZWQgaW4gTGludXggUHJvDQo+IHJlbGVh
c2VzIHNpbmNlIDE4LjIwLiBJJ20gbm90IGF3YXJlIHRoYXQgYW55b25lIGNvbXBsYWluZWQgYWJv
dXQgaXQuDQoNCldlbGwgdG8gYmUgaG9uZXN0IG91ciBQcm8gZHJpdmVyIGlzIGFjdHVhbGx5IG5v
dCB1c2VkIHRoYXQgd2lkZWx5IGFuZCANCm9ubHkgdXNlZCBvbiByYXRoZXIgaG9tb2dlbmVvdXMg
c3lzdGVtcy4NCg0KV2hpY2ggaXMgbm90IHJlYWxseSBzdXJwcmlzaW5nIHNpbmNlIHdlIG9ubHkg
YWR2aXNlIHRvIHVzZSBpdCBvbiANCnByb2Zlc3Npb25hbCB1c2UgY2FzZXMuDQoNCj4+PiBUaGUg
T09NIGtpbGxlciBwcm9ibGVtIGlzIGEgbW9yZSBnZW5lcmFsIHByb2JsZW0gdGhhdCBwb3RlbnRp
YWxseQ0KPj4+IGFmZmVjdHMgb3RoZXIgZHJpdmVycyB0b28uIEtlZXBpbmcgdGhpcyBHVFQgbGlt
aXQgYnJva2VuIGluIEFNREdQVSBpcyBhbg0KPj4+IGluYWRlcXVhdGUgd29ya2Fyb3VuZCBhdCBi
ZXN0LiBJJ2QgbGlrZSB0byBsb29rIGZvciBhIGJldHRlciBzb2x1dGlvbiwNCj4+PiBwcm9iYWJs
eSBzb21lIGFkanVzdG1lbnQgb2YgdGhlIFRUTSBzeXN0ZW0gbWVtb3J5IGxpbWl0cyBvbiBzeXN0
ZW1zIHdpdGgNCj4+PiBzbWFsbCBtZW1vcnksIHRvIGF2b2lkIE9PTSBwYW5pY3Mgb24gc3VjaCBz
eXN0ZW1zLg0KPj4gVGhlIGNvcmUgcHJvYmxlbSBoZXJlIGlzIHRoYXQgdGhlIE9PTSBraWxsZXIg
ZXhwbGljaXRseSBkb2Vzbid0IHdhbnQgdG8NCj4+IGJsb2NrIGZvciBzaGFkZXJzIHRvIGZpbmlz
aCB3aGF0ZXZlciBpdCBpcyBkb2luZy4NCj4+DQo+PiBTbyBjdXJyZW50bHkgYXMgc29vbiBhcyB0
aGUgaGFyZHdhcmUgaXMgdXNpbmcgc29tZSBtZW1vcnkgaXQgY2FuJ3QgYmUNCj4+IHJlY2xhaW1l
ZCBpbW1lZGlhdGVseS4NCj4+DQo+PiBUaGUgb3JpZ2luYWwgbGltaXQgaW4gVFRNIHdhcyAyLzMg
b2Ygc3lzdGVtIG1lbW9yeSBhbmQgdGhhdCB3b3JrZWQNCj4+IHJlYWxseSByZWxpYWJsZSBhbmQg
d2UgcmFuIGludG8gcHJvYmxlbXMgb25seSBhZnRlciByYWlzaW5nIGl0IHRvIDMvNC4NCj4gVGhl
IFRUTSBzeXN0ZW0gbWVtb3J5IGxpbWl0IGlzIHN0aWxsIDMvOCBzb2Z0IGFuZCAxLzIgaGFyZCwg
My80IGZvcg0KPiBlbWVyZ2VuY2llcy4gU2VlIHR0bV9tZW1faW5pdF9rZXJuZWxfem9uZS4gQUZB
SUNULCB0aGUgZW1lcmdlbmN5IGxpbWl0DQo+IGlzIG9ubHkgYXZhaWxhYmxlIHRvIHJvb3QuDQoN
CkFoISBJIHRoaW5rIEkga25vdyB3aHkgdGhvc2UgbGltaXRzIGRvZXNuJ3Qga2ljayBpbiBoZXJl
IQ0KDQpXaGVuIEdUVCBzcGFjZSBpcyB1c2VkIGJ5IGV2aWN0aW9ucyBmcm9tIFZSQU0gdGhlbiB3
ZSB3aWxsIHVzZSB0aGUgDQplbWVyZ2VuY3kgbGltaXQgYXMgd2VsbC4NCg0KPiBUaGlzIEdUVCBs
aW1pdCBraWNrcyBpbiBiZWZvcmUgSSBnZXQgYW55d2hlcmUgY2xvc2UgdG8gdGhlIFRUTSBsaW1p
dC4NCj4gVGhhdCdzIHdoeSBJIHRoaW5rIGl0IGlzIGJvdGggYnJva2VuIGFuZCByZWR1bmRhbnQu
DQoNClRoYXQgd2FzIGFsc28gdGhlIGFyZ3VtZW50IHdoZW4gd2UgcmVtb3ZlZCBpdCB0aGUgbGFz
dCB0aW1lLCBidXQgaXQgZ290IA0KaW1tZWRpYXRlbHkgcmV2ZXJ0ZWQuDQoNCj4+IFRvIHN1bSBp
dCB1cCB0aGUgcmVxdWlyZW1lbnQgb2YgdXNpbmcgYWxtb3N0IGFsbCBzeXN0ZW0gbWVtb3J5IGJ5
IGEgR1BVDQo+PiBpcyBzaW1wbHkgbm90IHBvc3NpYmxlIHVwc3RyZWFtIGFuZCBldmVuIGluIGFu
eSBwcm9kdWN0aW9uIHN5c3RlbSByYXRoZXINCj4+IHF1ZXN0aW9uYWJsZS4NCj4gSXQgc2hvdWxk
IGJlIGRvYWJsZSB3aXRoIHVzZXJwdHIsIHdoaWNoIG5vdyB1c2VzIHVucGlubmVkIHBhZ2VzIHRo
cm91Z2gNCj4gSE1NLiBDdXJyZW50bHkgdGhlIEdUVCBsaW1pdCBhZmZlY3RzIHRoZSBsYXJnZXN0
IHBvc3NpYmxlIHVzZXJwdHINCj4gYWxsb2NhdGlvbiwgdGhvdWdoIG5vdCB0aGUgdG90YWwgc3Vt
IG9mIGFsbCB1c2VycHRyIGFsbG9jYXRpb25zLiBNYXliZQ0KPiBtYWtpbmcgdXNlcnB0ciBjb21w
bGV0ZWx5IGluZGVwZW5kZW50IG9mIEdUVCBzaXplIHdvdWxkIGJlIGFuIGVhc2llcg0KPiBwcm9i
bGVtIHRvIHRhY2tsZS4gVGhlbiBJIGNhbiBsZWF2ZSB0aGUgR1RUIGxpbWl0IGFsb25lLg0KDQpX
ZWxsIHRoaXMgd2F5IHdlIHdvdWxkIG9ubHkgYXZvaWQgdGhlIHN5bXB0b21zLCBidXQgbm90IHRo
ZSByZWFsIHByb2JsZW0uDQoNCj4+IFRoZSBvbmx5IHJlYWwgc29sdXRpb24gSSBjYW4gc2VlIGlz
IHRvIGJlIGFibGUgdG8gcmVsaWFibGUga2lsbCBzaGFkZXJzDQo+PiBpbiBhbiBPT00gc2l0dWF0
aW9uLg0KPiBXZWxsLCB3ZSBjYW4gaW4gZmFjdCBwcmVlbXB0IG91ciBjb21wdXRlIHNoYWRlcnMg
d2l0aCBsb3cgbGF0ZW5jeS4NCj4gS2lsbGluZyBhIEtGRCBwcm9jZXNzIHdpbGwgZG8gZXhhY3Rs
eSB0aGF0Lg0KDQpJJ3ZlIHRha2VuIGEgbG9vayBhdCB0aGF0IHRoaW5nIGFzIHdlbGwgYW5kIHRv
IGJlIGhvbmVzdCBpdCBpcyBub3QgZXZlbiANCnJlbW90ZWx5IHN1ZmZpY2llbnQuDQoNCldlIG5l
ZWQgc29tZXRoaW5nIHdoaWNoIHN0b3BzIHRoZSBoYXJkd2FyZSAqaW1tZWRpYXRlbHkqIGZyb20g
YWNjZXNzaW5nIA0Kc3lzdGVtIG1lbW9yeSwgYW5kIG5vdCB3YWl0IGZvciB0aGUgU1EgdG8ga2ls
bCBhbGwgd2F2ZXMsIGZsdXNoIGNhY2hlcyANCmV0Yy4uLg0KDQpPbmUgcG9zc2liaWxpdHkgSSdt
IHBsYXlpbmcgYXJvdW5kIHdpdGggZm9yIGEgd2hpbGUgaXMgdG8gcmVwbGFjZSB0aGUgDQpyb290
IFBEIGZvciB0aGUgVk1JRHMgaW4gcXVlc3Rpb24gb24gdGhlIGZseS4gRS5nLiB3ZSBqdXN0IGxl
dCBpdCBwb2ludCANCnRvIHNvbWUgZHVtbXkgd2hpY2ggcmVkaXJlY3RzIGV2ZXJ5dGhpbmcgaW50
byBuaXJ2YW5hLg0KDQpCdXQgaW1wbGVtZW50aW5nIHRoaXMgaXMgZWFzaWVyIHNhaWQgdGhhbiBk
b25lLi4uDQoNClJlZ2FyZHMsDQpDaHJpc3RpYW4uDQoNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
