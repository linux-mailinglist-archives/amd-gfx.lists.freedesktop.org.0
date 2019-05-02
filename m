Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B3C119BC
	for <lists+amd-gfx@lfdr.de>; Thu,  2 May 2019 15:06:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F082C894DD;
	Thu,  2 May 2019 13:06:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770040.outbound.protection.outlook.com [40.107.77.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F171E894DD
 for <amd-gfx@lists.freedesktop.org>; Thu,  2 May 2019 13:06:51 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB2566.namprd12.prod.outlook.com (52.132.141.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Thu, 2 May 2019 13:06:49 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::70fc:f26c:1e22:73ba]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::70fc:f26c:1e22:73ba%10]) with mapi id 15.20.1856.008; Thu, 2 May 2019
 13:06:49 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 27/27] drm/amdgpu: Fix GTT size calculation
Thread-Topic: [PATCH 27/27] drm/amdgpu: Fix GTT size calculation
Thread-Index: AQHU/ZYxPIKog0WHeUWa+2vMcdfmZqZTFL0AgACzGYCAAKw/gIAAZc6AgAAYKICAAAYWAIAC3HmA
Date: Thu, 2 May 2019 13:06:49 +0000
Message-ID: <763ca7eb-1d24-1adf-b98b-325b92621861@amd.com>
References: <20190428074331.30107-1-Felix.Kuehling@amd.com>
 <20190428074331.30107-28-Felix.Kuehling@amd.com>
 <86fa9fc3-7a8f-9855-ae1d-5c7ccf2b5260@gmail.com>
 <1b1ec993-1c4b-8661-9b3f-ac0ad8ae64c7@amd.com>
 <134a4999-776f-44c6-99a2-42e8b9366a73@gmail.com>
 <9f882acd-c48f-3bbd-2d90-659c2edead39@amd.com>
 <f5c698ad-2aff-b3c5-2041-05a10983438a@amd.com>
 <8ba952ab-4836-4ca3-cd80-99f7367a7979@amd.com>
In-Reply-To: <8ba952ab-4836-4ca3-cd80-99f7367a7979@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM3PR05CA0129.eurprd05.prod.outlook.com
 (2603:10a6:207:2::31) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d18e40f-0547-43b9-1cbb-08d6ceff0996
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2566; 
x-ms-traffictypediagnostic: DM5PR12MB2566:
x-microsoft-antispam-prvs: <DM5PR12MB2566683344CCE5EC8429C0D583340@DM5PR12MB2566.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0025434D2D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(136003)(376002)(346002)(366004)(51444003)(199004)(189003)(99286004)(2501003)(4326008)(110136005)(46003)(76176011)(53936002)(316002)(72206003)(14454004)(58126008)(65826007)(5660300002)(6246003)(446003)(11346002)(65956001)(65806001)(476003)(25786009)(8936002)(6506007)(81156014)(81166006)(7736002)(6512007)(305945005)(102836004)(386003)(186003)(486006)(8676002)(52116002)(2616005)(64126003)(31696002)(6486002)(229853002)(36756003)(2906002)(86362001)(31686004)(6116002)(6436002)(256004)(14444005)(66476007)(66556008)(64756008)(71190400001)(71200400001)(478600001)(68736007)(66446008)(66946007)(73956011)(375104003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2566;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sii7o87P6kZKeYfXUF6zDvJp+U1/mhyo3z5QsDbpQ/4FsIWMq0/NxmnCRqUqDrb/9307q/8sILadn7l2VVKzsoo0bcT79bQ0fqL4r4xIcltrHTzARe1bTnsvRlxc7IdldiTdg3GtBsQIalvXQhzV1kb18rrc5/IUIn0Scu3Qzh2VTEBts20yDe8GCs9HCnypIb4LbCCKRt6YSEMb9HCbzjqLF1D+Cw+OrkHF2dg3czRH6Q6zQgjYouuAnffn5k3E34JEnbXnoNCkY0CZPtV3gc0Xkd1sjK5f+4eUKLoIhnbGjZUznnvYSVMB2xaWXMd8gN29LY8MwDnuilqltXibJERZ3S2TIr/ZicOxmX9DNh6dh1w7x7jcYecm3lVnQw89G9NCGzEDA4i+yiUjcGv9SNH5BfjNCx5Lq47eT2FMArM=
Content-ID: <0238C1F2EA7BED4693F76E16FCE08C5A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d18e40f-0547-43b9-1cbb-08d6ceff0996
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2019 13:06:49.4991 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2566
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nOK/WRQpZ+jJGIxCNzomyf9SLgZBtrE0jUgLga/mWAE=;
 b=1f1NlO3H15pHPQUDY3G4XeLHL10GQUWgDZR+Wj1bufadBIAisULshVVkqWp+uDp6xF6cX1k6V9Wxn0P+7DYpz5pPhwqCDp8WaadQghRqX1un3IKZ8dxlj2NYNagfKSbP29tO5UR0KZnpPT4JQKSbsNrnQan5zxzJDDTtwPzLyS8=
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

QW0gMzAuMDQuMTkgdW0gMTk6MjUgc2NocmllYiBLdWVobGluZywgRmVsaXg6DQo+IFtTTklQXQ0K
Pj4+PiBUbyBzdW0gaXQgdXAgdGhlIHJlcXVpcmVtZW50IG9mIHVzaW5nIGFsbW9zdCBhbGwgc3lz
dGVtIG1lbW9yeSBieSBhIEdQVQ0KPj4+PiBpcyBzaW1wbHkgbm90IHBvc3NpYmxlIHVwc3RyZWFt
IGFuZCBldmVuIGluIGFueSBwcm9kdWN0aW9uIHN5c3RlbSByYXRoZXINCj4+Pj4gcXVlc3Rpb25h
YmxlLg0KPj4+IEl0IHNob3VsZCBiZSBkb2FibGUgd2l0aCB1c2VycHRyLCB3aGljaCBub3cgdXNl
cyB1bnBpbm5lZCBwYWdlcyB0aHJvdWdoDQo+Pj4gSE1NLiBDdXJyZW50bHkgdGhlIEdUVCBsaW1p
dCBhZmZlY3RzIHRoZSBsYXJnZXN0IHBvc3NpYmxlIHVzZXJwdHINCj4+PiBhbGxvY2F0aW9uLCB0
aG91Z2ggbm90IHRoZSB0b3RhbCBzdW0gb2YgYWxsIHVzZXJwdHIgYWxsb2NhdGlvbnMuIE1heWJl
DQo+Pj4gbWFraW5nIHVzZXJwdHIgY29tcGxldGVseSBpbmRlcGVuZGVudCBvZiBHVFQgc2l6ZSB3
b3VsZCBiZSBhbiBlYXNpZXINCj4+PiBwcm9ibGVtIHRvIHRhY2tsZS4gVGhlbiBJIGNhbiBsZWF2
ZSB0aGUgR1RUIGxpbWl0IGFsb25lLg0KPj4gV2VsbCB0aGlzIHdheSB3ZSB3b3VsZCBvbmx5IGF2
b2lkIHRoZSBzeW1wdG9tcywgYnV0IG5vdCB0aGUgcmVhbCBwcm9ibGVtLg0KPiBJdCBhbGxvY2F0
ZXMgcGFnZXMgaW4gdXNlciBtb2RlIHJhdGhlciB0aGFuIGtlcm5lbCBtb2RlLiBUaGF0IG1lYW5z
LCBPT00NCj4gc2l0dWF0aW9ucyB0YWtlIGEgY29tcGxldGVseSBkaWZmZXJlbnQgY29kZSBwYXRo
LiBCZWZvcmUgcnVubmluZyBvdXQgb2YNCj4gbWVtb3J5IGNvbXBsZXRlbHksIHRyaWdnZXJpbmcg
dGhlIE9PTSBraWxsZXIsIHRoZSBrZXJuZWwgd291bGQgc3RhcnQNCj4gc3dhcHBpbmcgcGFnZXMs
IHdoaWNoIHdvdWxkIHRyaWdnZXIgdGhlIE1NVSBub3RpZmllciB0byBzdG9wIHRoZSB1c2VyDQo+
IG1vZGUgcXVldWVzIG9yIGludmFsaWRhdGUgR1BVIHBhZ2UgdGFibGUgZW50cmllcywgYW5kIGFs
bG93IHRoZSBwYWdlcyB0bw0KPiBiZSBzd2FwcGVkIG91dC4NCg0KV2VsbCBpdCBhdCBsZWFzdCBy
ZW1vdmVzIHRoZSBleHRyYSBsYXllciBpbiBUVE0gd2UgaGF2ZSBoZXJlLg0KDQpCdXQgd2hhdCBJ
IG1lYW50IGlzIHRoYXQgaXQgc3RpbGwgZG9lc24ndCBmaXggb3VyIHVuZGVybHlpbmcgcHJvYmxl
bSBvZiANCnN0b3BwaW5nIHRoZSBoYXJkd2FyZSBpbW1lZGlhdGVseS4NCg0KPj4+PiBUaGUgb25s
eSByZWFsIHNvbHV0aW9uIEkgY2FuIHNlZSBpcyB0byBiZSBhYmxlIHRvIHJlbGlhYmxlIGtpbGwg
c2hhZGVycw0KPj4+PiBpbiBhbiBPT00gc2l0dWF0aW9uLg0KPj4+IFdlbGwsIHdlIGNhbiBpbiBm
YWN0IHByZWVtcHQgb3VyIGNvbXB1dGUgc2hhZGVycyB3aXRoIGxvdyBsYXRlbmN5Lg0KPj4+IEtp
bGxpbmcgYSBLRkQgcHJvY2VzcyB3aWxsIGRvIGV4YWN0bHkgdGhhdC4NCj4+IEkndmUgdGFrZW4g
YSBsb29rIGF0IHRoYXQgdGhpbmcgYXMgd2VsbCBhbmQgdG8gYmUgaG9uZXN0IGl0IGlzIG5vdCBl
dmVuDQo+PiByZW1vdGVseSBzdWZmaWNpZW50Lg0KPj4NCj4+IFdlIG5lZWQgc29tZXRoaW5nIHdo
aWNoIHN0b3BzIHRoZSBoYXJkd2FyZSAqaW1tZWRpYXRlbHkqIGZyb20gYWNjZXNzaW5nDQo+PiBz
eXN0ZW0gbWVtb3J5LCBhbmQgbm90IHdhaXQgZm9yIHRoZSBTUSB0byBraWxsIGFsbCB3YXZlcywg
Zmx1c2ggY2FjaGVzDQo+PiBldGMuLi4NCj4gSXQncyBhcHBhcmVudGx5IHN1ZmZpY2llbnQgdG8g
dXNlIGluIG91ciBNTVUgbm90aWZpZXIuIFRoZXJlIGlzIGFsc28gYQ0KPiB3YXkgdG8gZGlzYWJs
ZSB0aGUgZ3JhY2UgcGVyaW9kIHRoYXQgYWxsb3dzIHNob3J0IHdhdmVzIHRvIGNvbXBsZXRlDQo+
IGJlZm9yZSBiZWluZyBwcmVlbXB0ZWQsIHRob3VnaCB3ZSdyZSBub3QgdXNpbmcgdGhhdCBhdCB0
aGUgbW9tZW50Lg0KPg0KPg0KPj4gT25lIHBvc3NpYmlsaXR5IEknbSBwbGF5aW5nIGFyb3VuZCB3
aXRoIGZvciBhIHdoaWxlIGlzIHRvIHJlcGxhY2UgdGhlDQo+PiByb290IFBEIGZvciB0aGUgVk1J
RHMgaW4gcXVlc3Rpb24gb24gdGhlIGZseS4gRS5nLiB3ZSBqdXN0IGxldCBpdCBwb2ludA0KPj4g
dG8gc29tZSBkdW1teSB3aGljaCByZWRpcmVjdHMgZXZlcnl0aGluZyBpbnRvIG5pcnZhbmEuDQo+
IEV2ZW4gdGhhdCdzIG5vdCBzdWZmaWNpZW50LiBZb3UnbGwgYWxzbyBuZWVkIHRvIGZyZWUgdGhl
IHBhZ2VzDQo+IGltbWVkaWF0ZWx5LiBGb3IgS0ZEIHByb2Nlc3NlcywgY2xlYW5pbmcgdXAgb2Yg
bWVtb3J5IGlzIGRvbmUgaW4gYQ0KPiB3b3JrZXIgdGhyZWFkIHRoYXQgZ2V0cyBraWNrZWQgb2Zm
IGJ5IGEgcmVsZWFzZSBNTVUgbm90aWZpZXIgd2hlbiB0aGUNCj4gcHJvY2VzcycgbW1fc3RydWN0
IGlzIHRha2VuIGRvd24uDQoNClllYWgsIHRoYXQgd29ya2VyIGlzIHdoYXQgSSBtZWFudCB3aXRo
IHRoYXQgdGhpcyB3aG9sZSB0aGluZyBpcyBub3QgDQpzdWZmaWNpZW50LiBCVFc6IEhvdyBkb2Vz
IHRoYXQgc3RpbGwgd29yayB3aXRoIEhNTT8gSSBtZWFuIEhNTSBkb2Vzbid0IA0KdGFrZSBhIHJl
ZmVyZW5jZSB0byB0aGUgcGFnZXMgYW55IG1vcmUuDQoNCkJ1dCBsZXQgbWUgc2F5IGl0IGRpZmZl
cmVudGx5OiBXaGVuIHdlIHdhbnQgdGhlIE9PTSBraWxsZXIgdG8gd29yayANCmNvcnJlY3RseSB3
ZSBuZWVkIHRvIGhhdmUgYSBzaG9ydCBjdXQgcGF0aCB3aGljaCBkb2Vzbid0IHRha2VzIGFueSBs
b2NrcyANCm9yIGFsbG9jYXRlcyBtZW1vcnkuDQoNCldoYXQgd2UgY2FuIGRvIGlzOiBXcml0ZSBz
b21lIHJlZ2lzdGVycyBhbmQgdGhlbiBtYXliZSBidXN5IHdhaXQgZm9yIHRoZSANClRMQiBmbHVz
aCB0byBjb21wbGV0ZS4NCg0KV2hhdCB3ZSBjYW4ndCBkbyBpczogV2FpdGluZyBmb3IgdGhlIFNR
IHRvIGtpbGwgd2F2ZXMsIHdhaXRpbmcgZm9yIA0KZmVuY2VzIGV0Yy4uLg0KDQo+IFRoZW4gdGhl
cmUgaXMgc3RpbGwgVFRNJ3MgZGVsYXllZCBmcmVlaW5nIG9mIEJPcyB0aGF0IHdhaXRzIGZvciBm
ZW5jZXMuDQo+IFNvIHlvdSdkIG5lZWQgdG8gc2lnbmFsIGFsbCB0aGUgQk8gZmVuY2VzIHRvIGFs
bG93IHRoZW0gdG8gYmUgcmVsZWFzZWQuDQoNCkFjdHVhbGx5IHRoYXQgZG9lc24ndCBhcHBseSBp
biB0aGUgY3JpdGljYWwgY29kZSBwYXRoLiBJbiB0aGlzIHNpdHVhdGlvbiANClRUTSB0cmllcyB0
byBmcmVlIHRoaW5ncyB1cCBpdCBkb2Vzbid0IG5lZWQgdG8gd2FpdCBmb3IgaW1tZWRpYXRlbHku
DQoNCldoYXQgd2UgYXJlIG1pc3NpbmcgaGVyZSBpcyBzb21ldGhpbmcgbGlrZSBhIGtpbGwgaW50
ZXJmYWNlIGZvciBmZW5jZXMgDQptYXliZS4uLg0KDQo+IFRCSCwgSSBkb24ndCB1bmRlcnN0YW5k
IHdoeSB3YWl0aW5nIGlzIG5vdCBhbiBvcHRpb24sIGlmIHRoZSBhbHRlcm5hdGl2ZQ0KPiBpcyBh
IGtlcm5lbCBwYW5pYy4gSWYgeW91ciBPT00ga2lsbGVyIGtpY2tzIGluLCB5b3VyIHN5c3RlbSBp
cyBiYXNpY2FsbHkNCj4gZGVhZC4gV2FpdGluZyBmb3IgYSBmcmFjdGlvbiBvZiBhIHNlY29uZCB0
byBsZXQgYSBHUFUgZmluaXNoIGl0cyBtZW1vcnkNCj4gYWNjZXNzIHNob3VsZCBiZSBhIHNtYWxs
IHByaWNlIHRvIHBheSBpbiB0aGF0IHNpdHVhdGlvbi4NCg0KT2gsIHllYWggdGhhdCBpcyByZWFs
bHkgZ29vZCBwb2ludCBhcyB3ZWxsLg0KDQpJIHRoaW5rIHRoYXQgdGhpcyByZXN0cmljdGlvbiB3
YXMgY3JlYXRlZCB0byBtYWtlIHN1cmUgdGhhdCB0aGUgT09NIA0Ka2lsbGVyIGFsd2F5cyBtYWtl
cyBwcm9ncmVzcyBhbmQgZG9lc24ndCB3YWl0cyBmb3IgdGhpbmdzIGxpa2UgbmV0d29yayANCmNv
bmdlc3Rpb24uDQoNCk5vdyB0aGUgTGludXggTU0gaXMgbm90IHJlYWxseSBtYWRlIGZvciBsb25n
IHRlcm0gSS9PIG1hcHBpbmdzIGFueXdheS4gDQpBbmQgdGhhdCB3YXMgYWxzbyByZWNlbnRseSBh
IHRvcGljIG9uIHRoZSBsaXN0cyBpbiB0aGUgY29udGV4dCBvZiBITU0gDQoodGhlcmUgaXMgYSBM
V04gc3VtbWFyeSBhYm91dCBpdCkuIFByb2JhYmx5IHdvcnRoIGJyaW5naW5nIHRoYXQgDQpkaXNj
dXNzaW9uIHVwIG9uY2UgbW9yZS4NCg0KQ2hyaXN0aWFuLg0KDQo+DQo+IFJlZ2FyZHMsDQo+ICAg
wqAgRmVsaXgNCj4NCj4NCj4+IEJ1dCBpbXBsZW1lbnRpbmcgdGhpcyBpcyBlYXNpZXIgc2FpZCB0
aGFuIGRvbmUuLi4NCj4+DQo+PiBSZWdhcmRzLA0KPj4gQ2hyaXN0aWFuLg0KPj4NCg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
