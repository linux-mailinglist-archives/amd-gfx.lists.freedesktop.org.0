Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD608653B
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Aug 2019 17:10:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A5896E859;
	Thu,  8 Aug 2019 15:10:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790059.outbound.protection.outlook.com [40.107.79.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D8B6E859
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Aug 2019 15:10:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hxEUOcTznjJL4AvvfPbqVl4x81huLdk4B+OF/V/3sEPwba6HkdK9GddvtJ/17xZnxkmGRqkl70sYYVdgbqeYQy6eZpWMATd0Xzeh57WtWU4RSBGstjbaJLWJtclGoivKsMOEhMIdNuLWYMHAG6eFyYiUk6Bc45oQvVFYfKmuRjlEDShJsYAef7v5QDlGY9xooFu5GMJyTpfrdCSwHVA4Qw0egXQLikAO4Np1PEHAepD1r4rFdtdAOXGxCZxWzQtl6QNPpU7OZ7FTQLpx4pBnFcrPi0CwPPgIUpIZyMTTqOdNts0poXGa3zQHXIGzF+zXdPDAR5WWk0TUXuBfbvlPQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYMxD0OLIG59OfUL4ybRcqFZIrOa80syIKcRK9OpsA0=;
 b=D6I5cI+dxKd+r0G3r/FnluGmtrBJoVGz4A9bSZ4twlyJWbsTg04yLQHC6KKN6/F48nPyY5Czhtx5hOv629fwn87DoMC5X2diDSYKLrMq0BOgy9NZ+589YEGojZ4CWkIhCC7gvaDxO5tXE9qd2mnIP6IDV1el7mGwwiCntyHEsnl9yLtk3iarEKKy8BMyjgmPI8xouhoqQW8vUi7iYS1IA/lmwnKNa6mHmFFEJUxmNDOGTBMZkHIz6L2ZDoezi9AsA/2KJf80VLLYIGihl7EEfva27HmMNYoIgfoQD7EKoqasf86mqLYq0u4OQBzxV3igDUj9mF5xfqTk/CmzlFAcZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1563.namprd12.prod.outlook.com (10.172.37.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Thu, 8 Aug 2019 15:10:35 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89%12]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 15:10:35 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "Russell, Kent"
 <Kent.Russell@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Freehill, Chris" <Chris.Freehill@amd.com>
Subject: Re: [PATCH] drm/amdgpu: update ras sysfs feature info
Thread-Topic: [PATCH] drm/amdgpu: update ras sysfs feature info
Thread-Index: AQHVS2Rt1iYG/yilwEGD8WZ3EfxSkabsNOFAgAUEOoCAAA1/4IAADKqAgAABaxCAAAtcgA==
Date: Thu, 8 Aug 2019 15:10:35 +0000
Message-ID: <d09024c8-c723-1524-b43f-625a7807ae9b@amd.com>
References: <20190805080408.20770-1-tao.zhou1@amd.com>
 <DM5PR12MB14183A68E61B70184BEC459FFCDA0@DM5PR12MB1418.namprd12.prod.outlook.com>
 <BN6PR12MB16188930BC2E19E50B0EDB9185D70@BN6PR12MB1618.namprd12.prod.outlook.com>
 <DM5PR12MB141855615C68E69C503AC4B7FCD70@DM5PR12MB1418.namprd12.prod.outlook.com>
 <eeb641a8-2336-e177-cb8b-bcf6c21acdef@gmail.com>
 <DM5PR12MB141892A269179BD41156EFBEFCD70@DM5PR12MB1418.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB141892A269179BD41156EFBEFCD70@DM5PR12MB1418.namprd12.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR2P264CA0021.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::33)
 To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aefbdde3-2f9b-4cdc-995a-08d71c12903b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1563; 
x-ms-traffictypediagnostic: DM5PR12MB1563:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1563E5FF2E6D83FD8D18340F83D70@DM5PR12MB1563.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(366004)(136003)(39860400002)(376002)(199004)(13464003)(189003)(6636002)(53936002)(256004)(486006)(966005)(102836004)(15650500001)(58126008)(66574012)(65806001)(65826007)(65956001)(110136005)(6116002)(316002)(229853002)(186003)(46003)(31696002)(76176011)(71190400001)(52116002)(71200400001)(14444005)(31686004)(2906002)(64126003)(99286004)(476003)(8676002)(36756003)(5660300002)(81156014)(53546011)(66476007)(64756008)(2501003)(6246003)(14454004)(66446008)(25786009)(66946007)(6436002)(66556008)(2616005)(6512007)(305945005)(86362001)(6486002)(7736002)(11346002)(478600001)(386003)(446003)(6506007)(81166006)(8936002)(6306002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1563;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IHd1V/uXbEfMFSKRB2aEOoA70ZLR/e/QLIk6c7YjucwDiE3B3UAXfO1HOBXJ8/cjBRXCZ1/8w0PQyV5B/MHEZs5LOCKn+feh2PK/SLdtCQD/iv3FtdcJLFShy4HqzSOlJXbBPRUa7ytZMQrNgjkdk6QuI8Xgujj8/QlplhXCtwTRj5qk+Kewa4OBOm+4uO4mEFQ/ow1VzozoNdRAWanwoxDNg7aGHsEWeR1XE9jOBHZlO17M9cdBPsdwK69/ylGn8O9hemyaHoQ2OqnOltb0dO9MQLSzuqCYySAj3tbZ7zB76cZg2aykzrmVzTXYC9EkQ8T4GNcYLKSUNI/PJZQcZQyJB3uDuQulur6eHohVOxKhHW1WqtbmedZn/OdxcVCWnW41JlmFLfQNrNOm6Dby7/CWPZZLTcdanfXq9TE0dTs=
Content-ID: <A46E65D6738FD44D9B5F52B7934178F4@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aefbdde3-2f9b-4cdc-995a-08d71c12903b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 15:10:35.4307 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: do0fm7MUsX86xykjew4izXAY9/99Ilo54qX+7EXxJmb9z3dfe6D2FwTdaYIzOmzZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1563
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYMxD0OLIG59OfUL4ybRcqFZIrOa80syIKcRK9OpsA0=;
 b=0yea40Tv1D7x/oA77PY6bblHotvoNTkceYkim9L3dW4jlL+Dn3VmCZXW8ZecRk68iSSjuAlm4/U6Q35s8r9gcK4+A6/ea61aZwLgx0NARVXN3I6DyV0dyinNzuYEdc0SFV7VEGFEayltt9zHNR4iy46nRnxi/ik/6qtbWY5OeYU=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgSGF3a2luZywNCg0KYSBtdWx0aSBsaW5lIHZhbHVlIGlzIG5vdCB0aGUgcHJvYmxlbSwgYnV0
IGhlcmUgeW91IGhhdmUgbXVsdGlwbGUgdmFsdWVzLg0KDQpFLmcuIGluIHRoZSBjYXNlIG9mIHRo
ZSBwcCB0YWJsZXMgdGhhdCBpcyBvbmUgYmlnIGFycmF5IG9mIHBvd2VyIA0KcHJvZmlsZXMgYW5k
IHdlIGFjdHVhbGx5IGhhZCBhIGRpc2N1c3Npb24gaWYgZXhwb3NpbmcgdGhlbSBsaWtlIHRoaXMg
aXMgDQpvayBvciBub3QuDQoNCkJ1dCBpbiB0aGUgY2FzZSBvZiB0aGUgcmFzIGZlYXR1cmVzIHlv
dSBnb3QgbXVsdGlwbGUgZGlmZmVyZW50IHRoaW5ncyBpbiANCnRoZSBzYW1lIGZpbGUuIEFuZCB0
aGF0IGluIHR1cm4gaXMgYSBjbGVhciB2aW9sYXRpb24gb2YgdGhlIHN5c2ZzIHJ1bGVzLg0KDQpJ
IGRvbid0IHRoaW5rIHdlIGNhbid0IHVwc3RyZWFtIHRoZSBpbnRlcmZhY2UgbGlrZSB0aGlzLiBT
ZWUgaGVyZSBmb3IgYSANCmdvb2Qgc3VtbWFyeSBvZiB0aGUgcnVsZXMgYXMgd2VsbDogaHR0cHM6
Ly9sd24ubmV0L0FydGljbGVzLzM3ODg4NC8NCg0KUmVnYXJkcywNCkNocmlzdGlhbi4NCg0KQW0g
MDguMDguMTkgdW0gMTc6MDAgc2NocmllYiBaaGFuZywgSGF3a2luZzoNCj4gSGkgQ2hyaXMsDQo+
DQo+IEknbSBub3QgYXdhcmUgb2YgaG93IFJPQ00gU01JIHVzaW5nIGZlYXR1cmUgbm9kZXMuIGJ1
dCBub3QgYWxsIHRoZSBzeXNmcyBhcmUgaW50ZW5kZWQgdG8gYmUgdXNlZCBieSB1cHBlciBsZXZl
bCBhcHBzL2xpYnMuDQo+DQo+IFRoZXJlIGFyZSBidW5jaGVzIG9mIHN5c2ZzIGVudHJpZXMgdGhh
dCBoYXZlIG11bHRpcGxlIGxpbmUgdmFsdWUuIFRoZSBtb3N0IGNvbXBsaWNhdGUgb25lIHdvdWxk
IGJlIHBwX3Bvd2VyX3Byb2ZpbGVfbW9kZSwgd2hpY2ggbG9va3MgbGlrZS4NCj4NCj4gMCBCT09U
VVBfREVGQVVMVCo6DQo+ICAgICAgICAgICAgICAgICAgICAgIDAoICAgICAgIEdGWENMSykgICAg
ICAgMCAgICAgICAwICAgICAgIDEgICAgICAgMCAgICAgICA0ICAgICA4MDAgNDU4NzUyMCAgLTY1
NTM2ICAgICAgIDANCj4gICAgICAgICAgICAgICAgICAgICAgMSggICAgICAgU09DQ0xLKSAgICAg
ICAwICAgICAgIDAgICAgICAgMSAgICAgICAwICAgICAgIDQgICAgIDgwMCAgMzI3NjgwICAgLTY1
NTMgICAgICAgMA0KPiAgICAgICAgICAgICAgICAgICAgICAyKCAgICAgICAgIFVDTEspICAgICAg
IDAgICAgICAgMCAgICAgICAxICAgICAgIDAgICAgICAgNCAgICAgODAwICAzMjc2ODAgIC02NTUz
NiAgICAgICAwDQo+IC4uLi4uLi4NCj4gMSAzRF9GVUxMX1NDUkVFTiA6DQo+ICAgICAgICAgICAg
ICAgICAgICAgIDAoICAgICAgIEdGWENMSykgICAgICAgMCAgICAgICAxICAgICAgIDEgICAgICAg
MCAgICAgICA0ICAgICA4MDAgNDU4NzUyMCAgLTY1NTM2ICAgICAgIDANCj4gICAgICAgICAgICAg
ICAgICAgICAgMSggICAgICAgU09DQ0xLKSAgICAgICAwICAgICAgIDEgICAgICAgNCAgICAgODUw
ICAgICAgIDQgICAgIDgwMCAgMzI3NjgwICAtNjU1MzYgICAgICAgMA0KPg0KPiBSZWdhcmRzLA0K
PiBIYXdraW5nDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IENocmlzdGlh
biBLw7ZuaWcgPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPg0KPiBTZW50OiAyMDE5
5bm0OOaciDjml6UgMjI6MjUNCj4gVG86IFpoYW5nLCBIYXdraW5nIDxIYXdraW5nLlpoYW5nQGFt
ZC5jb20+OyBSdXNzZWxsLCBLZW50IDxLZW50LlJ1c3NlbGxAYW1kLmNvbT47IFpob3UxLCBUYW8g
PFRhby5aaG91MUBhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFBhbiwg
WGluaHVpIDxYaW5odWkuUGFuQGFtZC5jb20+OyBGcmVlaGlsbCwgQ2hyaXMgPENocmlzLkZyZWVo
aWxsQGFtZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS9hbWRncHU6IHVwZGF0ZSBy
YXMgc3lzZnMgZmVhdHVyZSBpbmZvDQo+DQo+IEhpIEhhd2tpbmcsDQo+DQo+IGxvb2tzIGxpa2Ug
eW91IHNraXBwZWQgbXkgcmVzcG9uc2UuDQo+DQo+IEV2ZW4gdGhlIGN1cnJlbnQgd2F5IGhvdyBz
eXNmcyBpcyB1c2VkIGluIHRoZSByYXMgY29kZSBpcyBhIGNsZWFyIE5PLUdPIGFuZCBzaG91bGQg
YmUgZml4ZWQgYmVmb3JlIHRoaXMgaXMgcHVzaGVkIHVwc3RyZWFtLg0KPg0KPiBBIHN5c2ZzIGVu
dHJ5IHNob3VsZCBzZXJpb3VzbHkgTk9UIHJldHVybiBhIG11bHRpIGxpbmUgdmFsdWUgd2hpY2gg
bmVlZHMgdG8gYmUgZXh0ZW5zaXZlbHkgcGFyc2VkIGJ5IHRoZSBhcHBsaWNhdGlvbi4NCj4NCj4g
UmVnYXJkcywNCj4gQ2hyaXN0aWFuLg0KPg0KPiBBbSAwOC4wOC4xOSB1bSAxNTo1MCBzY2hyaWVi
IFpoYW5nLCBIYXdraW5nOg0KPj4gVW5kZXJzdG9vZCBhbmQgYWdyZWUgd2Ugc2hvdWxkIGtlZXAg
c3RhYmxlIGludGVyZmFjZXMuDQo+Pg0KPj4gQnV0IHRoZSBpbmZvcm1hdGlvbiBpbiBmZWF0dXJl
IG5vZGUgaXMgbm90IGNvcnJlY3QgYW5kIG1ha2VzIHBlb3BsZSBjb25mdXNpbmcuIEJhc2ljYWxs
eSwgZWFjaCBJUCBibG9ja3MgY2FuIHN1cHBvcnQgYWxsIHRoZSBmb3VyIGVycm9yIHR5cGVzLCBu
b3QganVzdCBtdWx0aS11bmNvcnJlY3RhYmxlLiBBcyBhIHJlc3VsdCwgYW55IHVwcGVyIGxldmVs
IGFwcHMvbGlicyB0aGF0IHJlYWQgZnJvbSB0aGlzIGZpbGUgd2lsbCBqdXN0IGdldCBjb25mdXNp
bmcgaW5mb3JtYXRpb24gYXMgd2VsbC4gVGhlIGZlYXR1cmUgbWFzayBpcyBhbHJlYWR5IGdvb2Qg
ZW5vdWdoIGZvciB0aGlzIG5vZGUuDQo+Pg0KPj4gUmVnYXJkcywNCj4+IEhhd2tpbmcNCj4+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+PiBGcm9tOiBSdXNzZWxsLCBLZW50IDxLZW50LlJ1
c3NlbGxAYW1kLmNvbT4NCj4+IFNlbnQ6IDIwMTnlubQ45pyIOOaXpSAyMDo1MQ0KPj4gVG86IFpo
YW5nLCBIYXdraW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+OyBaaG91MSwgVGFvDQo+PiA8VGFv
Llpob3UxQGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgUGFuLCBYaW5o
dWkNCj4+IDxYaW5odWkuUGFuQGFtZC5jb20+OyBGcmVlaGlsbCwgQ2hyaXMgPENocmlzLkZyZWVo
aWxsQGFtZC5jb20+DQo+PiBDYzogWmhvdTEsIFRhbyA8VGFvLlpob3UxQGFtZC5jb20+DQo+PiBT
dWJqZWN0OiBSRTogW1BBVENIXSBkcm0vYW1kZ3B1OiB1cGRhdGUgcmFzIHN5c2ZzIGZlYXR1cmUg
aW5mbw0KPj4NCj4+ICtDaHJpcyBGcmVlaGlsbA0KPj4NCj4+IFdoaWxlIEkgY2FuIHVuZGVyc3Rh
bmQgdGhpcyBjaGFuZ2UsIHRoaXMgYnJva2Ugb3VyIFNNSSBpbnRlcmZhY2UsIHdoaWNoIHdhcyBl
eHBlY3RpbmcgYSBzcGVjaWZpYyBzdHJpbmcgZm9ybWF0IGZvciB0aGUgcmFzL2ZlYXR1cmVzIGZp
bGUuIFRoaXMgaGFzIGhhcHBlbmVkIGEgZmV3IHRpbWVzIG5vdywgd2hlcmUgY2hhbmdlcyB0byB0
aGUgUkFTIHN5c2ZzIGZpbGVzIGhhcyBicm9rZSB0aGUgU01JIENMSSBhbmQvb3IgU01JIExJQi4g
Q2FuIHdlIHBsZWFzZSBnZXQgYSBzdGFibGUgaW50ZXJmYWNlIGFuZCBzeXNmcyBmb3JtYXQgc2V0
IHVwIGJlZm9yZSBwdWJsaXNoaW5nIHBhdGNoZXM/IFRoaXMgaXMgY3JlYXRpbmcgYSBsb3Qgb2Yg
ZXh0cmEgd29yayBmb3IgZGV2ZWxvcGVycyB3aXRoIHRoZSBTTUkgdG8gY29uc3RhbnRseSBrZWVw
IHVwIHdpdGggdGhlIGNoYW5nZXMgYmVpbmcgbWFkZSB0byBzeXNmcyBmaWxlcy4gVGhhbmsgeW91
Lg0KPj4NCj4+ICAgIEtlbnQNCj4+DQo+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4g
RnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24g
QmVoYWxmIE9mDQo+PiBaaGFuZywgSGF3a2luZw0KPj4gU2VudDogTW9uZGF5LCBBdWd1c3QgNSwg
MjAxOSA0OjE1IEFNDQo+PiBUbzogWmhvdTEsIFRhbyA8VGFvLlpob3UxQGFtZC5jb20+OyBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj4+IFBhbiwgWGluaHVpIDxYaW5odWkuUGFuQGFt
ZC5jb20+DQo+PiBDYzogWmhvdTEsIFRhbyA8VGFvLlpob3UxQGFtZC5jb20+DQo+PiBTdWJqZWN0
OiBSRTogW1BBVENIXSBkcm0vYW1kZ3B1OiB1cGRhdGUgcmFzIHN5c2ZzIGZlYXR1cmUgaW5mbw0K
Pj4NCj4+IFJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+
DQo+Pg0KPj4gUmVnYXJkcywNCj4+IEhhd2tpbmcNCj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+PiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnPiBPbiBCZWhhbGYgT2YgVGFvDQo+PiBaaG91DQo+PiBTZW50OiAyMDE55bm0OOaciDXml6Ug
MTY6MDQNCj4+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgUGFuLCBYaW5odWkg
PFhpbmh1aS5QYW5AYW1kLmNvbT47DQo+PiBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0Bh
bWQuY29tPg0KPj4gQ2M6IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29tPg0KPj4gU3ViamVj
dDogW1BBVENIXSBkcm0vYW1kZ3B1OiB1cGRhdGUgcmFzIHN5c2ZzIGZlYXR1cmUgaW5mbw0KPj4N
Cj4+IHJlbW92ZSBjb25mdXNlZCByYXMgZXJyb3IgdHlwZSBpbmZvDQo+Pg0KPj4gU2lnbmVkLW9m
Zi1ieTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPg0KPj4gLS0tDQo+PiAgICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgfCAxNyArKysrKy0tLS0tLS0tLS0tLQ0K
Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pDQo+
Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMu
Yw0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMNCj4+IGluZGV4
IGQyZThhODVmNmUzOC4uMzY5NjUxMjQ3YjIzIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcmFzLmMNCj4+IEBAIC03ODcsMjUgKzc4NywxOCBAQCBzdGF0aWMgc3Np
emVfdCBhbWRncHVfcmFzX3N5c2ZzX2ZlYXR1cmVzX3JlYWQoc3RydWN0IGRldmljZSAqZGV2LA0K
Pj4gICAgCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gZGRldi0+ZGV2X3ByaXZhdGU7DQo+
PiAgICAJc3RydWN0IHJhc19jb21tb25faWYgaGVhZDsNCj4+ICAgIAlpbnQgcmFzX2Jsb2NrX2Nv
dW50ID0gQU1ER1BVX1JBU19CTE9DS19DT1VOVDsNCj4+IC0JaW50IGk7DQo+PiArCWludCBpLCBl
bmFibGVkOw0KPj4gICAgCXNzaXplX3QgczsNCj4+IC0Jc3RydWN0IHJhc19tYW5hZ2VyICpvYmo7
DQo+PiAgICANCj4+ICAgIAlzID0gc2NucHJpbnRmKGJ1ZiwgUEFHRV9TSVpFLCAiZmVhdHVyZSBt
YXNrOiAweCV4XG4iLA0KPj4gY29uLT5mZWF0dXJlcyk7DQo+PiAgICANCj4+ICAgIAlmb3IgKGkg
PSAwOyBpIDwgcmFzX2Jsb2NrX2NvdW50OyBpKyspIHsNCj4+ICAgIAkJaGVhZC5ibG9jayA9IGk7
DQo+PiArCQllbmFibGVkID0gYW1kZ3B1X3Jhc19pc19mZWF0dXJlX2VuYWJsZWQoYWRldiwgJmhl
YWQpOw0KPj4gICAgDQo+PiAtCQlpZiAoYW1kZ3B1X3Jhc19pc19mZWF0dXJlX2VuYWJsZWQoYWRl
diwgJmhlYWQpKSB7DQo+PiAtCQkJb2JqID0gYW1kZ3B1X3Jhc19maW5kX29iaihhZGV2LCAmaGVh
ZCk7DQo+PiAtCQkJcyArPSBzY25wcmludGYoJmJ1ZltzXSwgUEFHRV9TSVpFIC0gcywNCj4+IC0J
CQkJCSIlczogJXNcbiIsDQo+PiAtCQkJCQlyYXNfYmxvY2tfc3RyKGkpLA0KPj4gLQkJCQkJcmFz
X2Vycl9zdHIob2JqLT5oZWFkLnR5cGUpKTsNCj4+IC0JCX0gZWxzZQ0KPj4gLQkJCXMgKz0gc2Nu
cHJpbnRmKCZidWZbc10sIFBBR0VfU0laRSAtIHMsDQo+PiAtCQkJCQkiJXM6IGRpc2FibGVkXG4i
LA0KPj4gLQkJCQkJcmFzX2Jsb2NrX3N0cihpKSk7DQo+PiArCQlzICs9IHNjbnByaW50ZigmYnVm
W3NdLCBQQUdFX1NJWkUgLSBzLA0KPj4gKwkJCQkiJXMgcmFzIGZlYXR1cmUgbWFzazogJXNcbiIs
DQo+PiArCQkJCXJhc19ibG9ja19zdHIoaSksIGVuYWJsZWQ/Im9uIjoib2ZmIik7DQo+PiAgICAJ
fQ0KPj4gICAgDQo+PiAgICAJcmV0dXJuIHM7DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
