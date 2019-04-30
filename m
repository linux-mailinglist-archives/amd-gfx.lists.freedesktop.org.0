Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 604D7FCFF
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 17:36:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EDC589177;
	Tue, 30 Apr 2019 15:36:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790053.outbound.protection.outlook.com [40.107.79.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83E2389177
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 15:36:55 +0000 (UTC)
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (20.179.92.82) by
 BYAPR12MB2968.namprd12.prod.outlook.com (20.178.52.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Tue, 30 Apr 2019 15:36:54 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7%4]) with mapi id 15.20.1835.010; Tue, 30 Apr 2019
 15:36:54 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 27/27] drm/amdgpu: Fix GTT size calculation
Thread-Topic: [PATCH 27/27] drm/amdgpu: Fix GTT size calculation
Thread-Index: AQHU/ZYxPIKog0WHeUWa+2vMcdfmZqZTFL0AgACzGYCAAKw/gIAAZc6A
Date: Tue, 30 Apr 2019 15:36:53 +0000
Message-ID: <9f882acd-c48f-3bbd-2d90-659c2edead39@amd.com>
References: <20190428074331.30107-1-Felix.Kuehling@amd.com>
 <20190428074331.30107-28-Felix.Kuehling@amd.com>
 <86fa9fc3-7a8f-9855-ae1d-5c7ccf2b5260@gmail.com>
 <1b1ec993-1c4b-8661-9b3f-ac0ad8ae64c7@amd.com>
 <134a4999-776f-44c6-99a2-42e8b9366a73@gmail.com>
In-Reply-To: <134a4999-776f-44c6-99a2-42e8b9366a73@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-clientproxiedby: YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::48) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:133::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 70e5e1c7-8bbb-4ca3-c244-08d6cd81abc5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2968; 
x-ms-traffictypediagnostic: BYAPR12MB2968:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR12MB2968BEACE9183E9F8DD78103923A0@BYAPR12MB2968.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(39860400002)(396003)(346002)(376002)(199004)(189003)(6116002)(97736004)(6486002)(36756003)(65806001)(65956001)(66066001)(6246003)(6512007)(446003)(2616005)(3846002)(186003)(6306002)(53936002)(14454004)(11346002)(2501003)(31686004)(66946007)(486006)(64756008)(66556008)(66476007)(66446008)(26005)(256004)(68736007)(966005)(53546011)(386003)(6506007)(72206003)(14444005)(476003)(229853002)(73956011)(102836004)(478600001)(71200400001)(71190400001)(316002)(76176011)(52116002)(99286004)(58126008)(7736002)(4326008)(305945005)(86362001)(110136005)(65826007)(6436002)(5660300002)(66574012)(2906002)(64126003)(25786009)(8676002)(8936002)(81166006)(93886005)(31696002)(81156014)(375104003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2968;
 H:BYAPR12MB3176.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HkngIlFalUHGv/kX94X5nodAGKFzHIeDM3G2TZ0vt42XxE6fSoYiyRo8vI4LY8g2mhup0ljj9576enftcTDzCgOZxxu55Xv9lzrIUhUa+GbCogNiR/eItBADk7rMMkPG19nVbZyAd3yoKo5dufvfi3bYbx9et+Tj1jHV3Prw2ZipHMrgxI/62JeoOhVcMcAxMG9olu/EU0/0MuWxZgJGiv5CDuCA/XVQnNMaVeiOfVpiszVag8rzy3QOeteAWX+Ugb2IpwaTiakO272nTGzD2SBRs6h7y7wGGFHnvGDPlcmK4Ik3mAN+AU0bSQUq52y58KLQ2U03buMjQTVL+WQXkoYxyJvygGOF+OWysoAtPx3FCpaR1WTL+eXV4YLfeJq9Nn0JF+gNWsIiouH1wUL+KrVUCCu/UT0wgnDN0VSmvL8=
Content-ID: <134981679AD08F4BAAFDD0EF52D335E3@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70e5e1c7-8bbb-4ca3-c244-08d6cd81abc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 15:36:53.9626 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2968
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=14LtTT3xnnb3gUvE8YJXuCMaMxZoTfFIbw5BUczIePc=;
 b=auRyNmLGBpYQIMqUTKf33zUfvAmBOfGwq+YIAxZ0pUW7CntyKKUenfoOsblQmUdKwcpJAoHDj2DpY2e9xWmUc5FvxgBK6WGP858tcP3RYodDaWJI2YH4C8JKPyp8T4ZUhhRG6Bzm0ZSYrkQw1fRhzo9iCWAHGAUVCzq3UBmFwV8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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

DQpPbiAyMDE5LTA0LTMwIDU6MzIgYS5tLiwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToNCj4gW0NB
VVRJT046IEV4dGVybmFsIEVtYWlsXQ0KPg0KPiBBbSAzMC4wNC4xOSB1bSAwMToxNiBzY2hyaWVi
IEt1ZWhsaW5nLCBGZWxpeDoNCj4+IE9uIDIwMTktMDQtMjkgODozNCBhLm0uLCBDaHJpc3RpYW4g
S8O2bmlnIHdyb3RlOg0KPj4+IEFtIDI4LjA0LjE5IHVtIDA5OjQ0IHNjaHJpZWIgS3VlaGxpbmcs
IEZlbGl4Og0KPj4+PiBGcm9tOiBLZW50IFJ1c3NlbGwgPGtlbnQucnVzc2VsbEBhbWQuY29tPg0K
Pj4+Pg0KPj4+PiBHVFQgc2l6ZSBpcyBjdXJyZW50bHkgbGltaXRlZCB0byB0aGUgbWluaW11bSBv
ZiBWUkFNIHNpemUgb3IgMy80IG9mDQo+Pj4+IHN5c3RlbSBtZW1vcnkuIFRoaXMgc2V2ZXJlbHkg
bGltaXRzIHRoZSBxdWFuaXRpdHkgb2Ygc3lzdGVtIG1lbW9yeQ0KPj4+PiB0aGF0IGNhbiBiZSB1
c2VkIGJ5IFJPQ20gYXBwbGljYXRpb24uDQo+Pj4+DQo+Pj4+IEluY3JlYXNlIEdUVCBzaXplIHRv
IHRoZSBtYXhpbXVtIG9mIFZSQU0gc2l6ZSBvciBzeXN0ZW0gbWVtb3J5IHNpemUuDQo+Pj4gV2Vs
bCwgTkFLLg0KPj4+DQo+Pj4gVGhpcyBsaW1pdCB3YXMgZG9uZSBvbiBwdXJwb3NlIGJlY2F1c2Ug
d2Ugb3RoZXJ3aXNlIHRoZQ0KPj4+IG1heC10ZXh0dXJlLXNpemUgd291bGQgYmUgY3Jhc2hpbmcg
dGhlIHN5c3RlbSBiZWNhdXNlIHRoZSBPT00ga2lsbGVyDQo+Pj4gd291bGQgYmUgY2F1c2luZyBh
IHN5c3RlbSBwYW5pYy4NCj4+Pg0KPj4+IFVzaW5nIG1vcmUgdGhhbiA3NSUgb2Ygc3lzdGVtIG1l
bW9yeSBieSB0aGUgR1BVIGF0IHRoZSBzYW1lIHRpbWUgbWFrZXMNCj4+PiB0aGUgc3lzdGVtIHVu
c3RhYmxlIGFuZCBzbyB3ZSBjYW4ndCBhbGxvdyB0aGF0IGJ5IGRlZmF1bHQuDQo+PiBMaWtlIHdl
IGRpc2N1c3NlZCwgdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gaXMgdG9vIGxpbWl0aW5nLiBP
biBhIEZpamkNCj4+IHN5c3RlbSB3aXRoIDRHQiBWUkFNIGFuZCAzMkdCIHN5c3RlbSBtZW1vcnks
IGl0IGxpbWl0cyBzeXN0ZW0gbWVtb3J5DQo+PiBhbGxvY2F0aW9ucyB0byA0R0IuIEkgdGhpbmsg
dGhpcyB3b3JrYXJvdW5kIHdhcyBmaXhlZCBvbmNlIGJlZm9yZSBhbmQNCj4+IHJldmVydGVkIGJl
Y2F1c2UgaXQgYnJva2UgYSBDWiBzeXN0ZW0gd2l0aCAxR0Igc3lzdGVtIG1lbW9yeS4gU28gSQ0K
Pj4gc3VzcGVjdCB0aGF0IHRoaXMgaXMgYW4gaXNzdWUgYWZmZWN0aW5nIHNtYWxsIG1lbW9yeSBz
eXN0ZW1zIHdoZXJlIG1heWJlDQo+PiB0aGUgMS8yIHN5c3RlbSBtZW1vcnkgbGltaXQgaW4gVFRN
IGlzbid0IHN1ZmZpY2llbnQgdG8gcHJvdGVjdCBmcm9tIE9PTQ0KPj4gcGFuaWNzLg0KPg0KPiBX
ZWxsIGl0IG5vdCBvbmx5IGJyb2tlIG9uIGEgMUdCIENaIHN5c3RlbSwgdGhpcyB3YXMganVzdCB3
aGVyZSBBbmRyZXkNCj4gcmVwcm9kdWNlZCBpdC4gV2UgZ290IHJlcG9ydHMgZnJvbSBhbGwga2lu
ZCBvZiBzeXN0ZW1zLg0KDQpJJ2QgbGlrZSB0byBzZWUgdGhvc2UgcmVwb3J0cy4gVGhpcyBwYXRj
aCBoYXMgYmVlbiBpbmNsdWRlZCBpbiBMaW51eCBQcm8gDQpyZWxlYXNlcyBzaW5jZSAxOC4yMC4g
SSdtIG5vdCBhd2FyZSB0aGF0IGFueW9uZSBjb21wbGFpbmVkIGFib3V0IGl0Lg0KDQoNCj4NCj4+
IFRoZSBPT00ga2lsbGVyIHByb2JsZW0gaXMgYSBtb3JlIGdlbmVyYWwgcHJvYmxlbSB0aGF0IHBv
dGVudGlhbGx5DQo+PiBhZmZlY3RzIG90aGVyIGRyaXZlcnMgdG9vLiBLZWVwaW5nIHRoaXMgR1RU
IGxpbWl0IGJyb2tlbiBpbiBBTURHUFUgaXMgYW4NCj4+IGluYWRlcXVhdGUgd29ya2Fyb3VuZCBh
dCBiZXN0LiBJJ2QgbGlrZSB0byBsb29rIGZvciBhIGJldHRlciBzb2x1dGlvbiwNCj4+IHByb2Jh
Ymx5IHNvbWUgYWRqdXN0bWVudCBvZiB0aGUgVFRNIHN5c3RlbSBtZW1vcnkgbGltaXRzIG9uIHN5
c3RlbXMgd2l0aA0KPj4gc21hbGwgbWVtb3J5LCB0byBhdm9pZCBPT00gcGFuaWNzIG9uIHN1Y2gg
c3lzdGVtcy4NCj4NCj4gVGhlIGNvcmUgcHJvYmxlbSBoZXJlIGlzIHRoYXQgdGhlIE9PTSBraWxs
ZXIgZXhwbGljaXRseSBkb2Vzbid0IHdhbnQgdG8NCj4gYmxvY2sgZm9yIHNoYWRlcnMgdG8gZmlu
aXNoIHdoYXRldmVyIGl0IGlzIGRvaW5nLg0KPg0KPiBTbyBjdXJyZW50bHkgYXMgc29vbiBhcyB0
aGUgaGFyZHdhcmUgaXMgdXNpbmcgc29tZSBtZW1vcnkgaXQgY2FuJ3QgYmUNCj4gcmVjbGFpbWVk
IGltbWVkaWF0ZWx5Lg0KPg0KPiBUaGUgb3JpZ2luYWwgbGltaXQgaW4gVFRNIHdhcyAyLzMgb2Yg
c3lzdGVtIG1lbW9yeSBhbmQgdGhhdCB3b3JrZWQNCj4gcmVhbGx5IHJlbGlhYmxlIGFuZCB3ZSBy
YW4gaW50byBwcm9ibGVtcyBvbmx5IGFmdGVyIHJhaXNpbmcgaXQgdG8gMy80Lg0KDQpUaGUgVFRN
IHN5c3RlbSBtZW1vcnkgbGltaXQgaXMgc3RpbGwgMy84IHNvZnQgYW5kIDEvMiBoYXJkLCAzLzQg
Zm9yIA0KZW1lcmdlbmNpZXMuIFNlZSB0dG1fbWVtX2luaXRfa2VybmVsX3pvbmUuIEFGQUlDVCwg
dGhlIGVtZXJnZW5jeSBsaW1pdCANCmlzIG9ubHkgYXZhaWxhYmxlIHRvIHJvb3QuDQoNClRoaXMg
R1RUIGxpbWl0IGtpY2tzIGluIGJlZm9yZSBJIGdldCBhbnl3aGVyZSBjbG9zZSB0byB0aGUgVFRN
IGxpbWl0LiANClRoYXQncyB3aHkgSSB0aGluayBpdCBpcyBib3RoIGJyb2tlbiBhbmQgcmVkdW5k
YW50Lg0KDQoNCj4NCj4gVG8gc3VtIGl0IHVwIHRoZSByZXF1aXJlbWVudCBvZiB1c2luZyBhbG1v
c3QgYWxsIHN5c3RlbSBtZW1vcnkgYnkgYSBHUFUNCj4gaXMgc2ltcGx5IG5vdCBwb3NzaWJsZSB1
cHN0cmVhbSBhbmQgZXZlbiBpbiBhbnkgcHJvZHVjdGlvbiBzeXN0ZW0gcmF0aGVyDQo+IHF1ZXN0
aW9uYWJsZS4NCg0KSXQgc2hvdWxkIGJlIGRvYWJsZSB3aXRoIHVzZXJwdHIsIHdoaWNoIG5vdyB1
c2VzIHVucGlubmVkIHBhZ2VzIHRocm91Z2ggDQpITU0uIEN1cnJlbnRseSB0aGUgR1RUIGxpbWl0
IGFmZmVjdHMgdGhlIGxhcmdlc3QgcG9zc2libGUgdXNlcnB0ciANCmFsbG9jYXRpb24sIHRob3Vn
aCBub3QgdGhlIHRvdGFsIHN1bSBvZiBhbGwgdXNlcnB0ciBhbGxvY2F0aW9ucy4gTWF5YmUgDQpt
YWtpbmcgdXNlcnB0ciBjb21wbGV0ZWx5IGluZGVwZW5kZW50IG9mIEdUVCBzaXplIHdvdWxkIGJl
IGFuIGVhc2llciANCnByb2JsZW0gdG8gdGFja2xlLiBUaGVuIEkgY2FuIGxlYXZlIHRoZSBHVFQg
bGltaXQgYWxvbmUuDQoNCg0KPg0KPiBUaGUgb25seSByZWFsIHNvbHV0aW9uIEkgY2FuIHNlZSBp
cyB0byBiZSBhYmxlIHRvIHJlbGlhYmxlIGtpbGwgc2hhZGVycw0KPiBpbiBhbiBPT00gc2l0dWF0
aW9uLg0KDQpXZWxsLCB3ZSBjYW4gaW4gZmFjdCBwcmVlbXB0IG91ciBjb21wdXRlIHNoYWRlcnMg
d2l0aCBsb3cgbGF0ZW5jeS4gDQpLaWxsaW5nIGEgS0ZEIHByb2Nlc3Mgd2lsbCBkbyBleGFjdGx5
IHRoYXQuDQoNClJlZ2FyZHMsDQogwqAgRmVsaXgNCg0KDQo+DQo+IFJlZ2FyZHMsDQo+IENocmlz
dGlhbi4NCj4NCj4+DQo+PiBSZWdhcmRzLA0KPj4gwqDCoMKgIEZlbGl4DQo+Pg0KPj4NCj4+PiBX
aGF0IGNvdWxkIG1heWJlIHdvcmsgaXMgdG8gcmVkdWNlIGFtb3VudCBvZiBzeXN0ZW0gbWVtb3J5
IGJ5IGEgZml4ZWQNCj4+PiBmYWN0b3IsIGJ1dCBJIG9mIGhhbmQgZG9uJ3Qgc2VlIGEgd2F5IG9m
IGZpeGluZyB0aGlzIGluIGdlbmVyYWwuDQo+Pj4NCj4+PiBSZWdhcmRzLA0KPj4+IENocmlzdGlh
bi4NCj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBLZW50IFJ1c3NlbGwgPGtlbnQucnVzc2VsbEBh
bWQuY29tPg0KPj4+PiBSZXZpZXdlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5n
QGFtZC5jb20+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVo
bGluZ0BhbWQuY29tPg0KPj4+PiAtLS0NCj4+Pj4gwqDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdHRtLmMgfCA5ICsrKystLS0tLQ0KPj4+PiDCoMKgIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMNCj4+Pj4gYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMNCj4+Pj4gaW5kZXggYzE0MTk4NzM3ZGNk
Li5lOWVjYzM5NTM2NzMgMTAwNjQ0DQo+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV90dG0uYw0KPj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdHRtLmMNCj4+Pj4gQEAgLTE3NDAsMTEgKzE3NDAsMTAgQEAgaW50IGFtZGdwdV90dG1f
aW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSANCj4+Pj4gKmFkZXYpDQo+Pj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHN0cnVjdCBzeXNpbmZvIHNpOw0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgc2lfbWVtaW5mbygmc2kpOw0KPj4+PiAtwqDCoMKgwqDCoMKgwqAgZ3R0X3NpemUgPSBtaW4o
bWF4KChBTURHUFVfREVGQVVMVF9HVFRfU0laRV9NQiA8PCAyMCksDQo+Pj4+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYWRldi0+Z21jLm1jX3ZyYW1fc2l6ZSksDQo+Pj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKCh1aW50NjRfdClzaS50b3Rh
bHJhbSAqIHNpLm1lbV91bml0ICogMy80KSk7DQo+Pj4+IC3CoMKgwqAgfQ0KPj4+PiAtwqDCoMKg
IGVsc2UNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGd0dF9zaXplID0gbWF4MygoQU1ER1BVX0RFRkFV
TFRfR1RUX1NJWkVfTUIgPDwgMjApLA0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGFkZXYtPmdtYy5tY192cmFtX3NpemUsDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgKCh1aW50NjRfdClzaS50b3RhbHJhbSAqIHNpLm1lbV91bml0KSk7DQo+Pj4+ICvC
oMKgwqAgfSBlbHNlDQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIGd0dF9zaXplID0gKHVpbnQ2
NF90KWFtZGdwdV9ndHRfc2l6ZSA8PCAyMDsNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCAvKiBJbml0
aWFsaXplIEdUVCBtZW1vcnkgcG9vbCAqLw0KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18NCj4+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+PiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQo+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
