Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A51D743160
	for <lists+amd-gfx@lfdr.de>; Wed, 12 Jun 2019 23:13:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C245489020;
	Wed, 12 Jun 2019 21:13:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700069.outbound.protection.outlook.com [40.107.70.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D11D89020
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 21:13:53 +0000 (UTC)
Received: from DM5PR1201MB0155.namprd12.prod.outlook.com (10.174.106.148) by
 DM5PR1201MB2504.namprd12.prod.outlook.com (10.172.87.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.15; Wed, 12 Jun 2019 21:13:52 +0000
Received: from DM5PR1201MB0155.namprd12.prod.outlook.com
 ([fe80::dde4:7ea4:1b9b:45ae]) by DM5PR1201MB0155.namprd12.prod.outlook.com
 ([fe80::dde4:7ea4:1b9b:45ae%9]) with mapi id 15.20.1987.012; Wed, 12 Jun 2019
 21:13:51 +0000
From: "Yang, Philip" <Philip.Yang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: only use kernel zone if need_dma32 is not
 required
Thread-Topic: [PATCH] drm/amdgpu: only use kernel zone if need_dma32 is not
 required
Thread-Index: AQHVITFaKjzrw3xsHkSdhatf91RqQKaYZ8eAgAAdTAA=
Date: Wed, 12 Jun 2019 21:13:51 +0000
Message-ID: <8af5593f-10aa-5654-76d3-7be9622dae4e@amd.com>
References: <20190612151250.816-1-Philip.Yang@amd.com>
 <5eae5f5a-73f3-4d6e-2a20-892aed285359@gmail.com>
In-Reply-To: <5eae5f5a-73f3-4d6e-2a20-892aed285359@gmail.com>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0027.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::40) To DM5PR1201MB0155.namprd12.prod.outlook.com
 (2603:10b6:4:55::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 12dfa66e-f3f0-4f14-5ab9-08d6ef7ade59
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR1201MB2504; 
x-ms-traffictypediagnostic: DM5PR1201MB2504:
x-microsoft-antispam-prvs: <DM5PR1201MB25047EA36CDDDD0DAFA52D4FE6EC0@DM5PR1201MB2504.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(346002)(376002)(136003)(366004)(199004)(189003)(31696002)(52116002)(81156014)(36756003)(6246003)(7736002)(26005)(6512007)(68736007)(31686004)(6506007)(71190400001)(99286004)(53546011)(66446008)(3846002)(71200400001)(186003)(8936002)(110136005)(6436002)(2501003)(76176011)(316002)(386003)(53936002)(8676002)(6116002)(6486002)(229853002)(81166006)(102836004)(305945005)(66476007)(14454004)(64756008)(5660300002)(66574012)(476003)(14444005)(25786009)(2906002)(86362001)(486006)(478600001)(66946007)(73956011)(2616005)(11346002)(72206003)(446003)(256004)(66066001)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB2504;
 H:DM5PR1201MB0155.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2N4+dwEw12mFrDRg+ytXujO23hShZ4UzJRhfvLGd8FK8d6JLjnwYjopl7e7Ecotx7/GRwvOfc2QoUGeh4YglezkXoIqqFHTykI+Kz4+GTnJStvfPPtXP0VOUb6GfN4j+CLyPSEAqrJmk6tiUI/zEGczBrsIVj8tgDRV2cjwepgeIhTKcpkxSfs2m9AguJU2gRIYsYYDe0kG6vLGIOzrwQIfcJj9QyBU5EbynKelRrBL1ZUNjDKLmQcD0eNj+5mpVpr4Yp4Y1kKFHtSlsc9mDR10YBMwZOdsRibGm56RAlVYdKB8DjDGY9Tff7nSnN7oQPhLqmmj7lLCmLB6qr60odD9NyjRplft6DSQjwSlLaxPyUoyiVFd5cEOLuq4hr4xS09l24Gw5/Qxnef3MOaLbXPR7BRnLE+FBKK4AxPIBgxk=
Content-ID: <8A6C728549B8D74C9E2D08191E6D64E2@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12dfa66e-f3f0-4f14-5ab9-08d6ef7ade59
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 21:13:51.8963 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yangp@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2504
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLwYtAyEGij1E5go+UGD2OgGDfCsvqTGPCXDT1aAgsU=;
 b=axJhWpE57/iWYt4TFGUzXxnwDTV9JqsSAQneV3687HUHMg229+FJen+8omlJw8NVcn2yhyDegRNyFif7XdoAZnu29FBJUSkmvxdsKrSS08DhaaHhajsx4RNUF8rGYwvEIpS4aQ4kO8P6OOF+5Era/TcKkOe+dkyyJETmlRh7sbc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Philip.Yang@amd.com; 
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

DQpPbiAyMDE5LTA2LTEyIDM6MjggcC5tLiwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToNCj4gQW0g
MTIuMDYuMTkgdW0gMTc6MTMgc2NocmllYiBZYW5nLCBQaGlsaXA6DQo+PiBUVE0gY3JlYXRlIHR3
byB6b25lcywga2VybmVsIHpvbmUgYW5kIGRtYTMyIHpvbmUgZm9yIHN5c3RlbSBtZW1vcnkuIElm
DQo+PiBzeXN0ZW0gbWVtb3J5IGFkZHJlc3MgYWxsb2NhdGVkIGlzIGJlbG93IDRHQiwgdGhpcyBh
Y2NvdW50IHRvIGRtYTMyIHpvbmUNCj4+IGFuZCB3aWxsIGV4aGF1c3QgZG1hMzIgem9uZSBhbmQg
dHJpZ2dlciB1bm5lc3NzYXJ5IFRUTSBldmljdGlvbi4NCj4+DQo+PiBQYXRjaCAiZHJtL3R0bTog
QWNjb3VudCBmb3Iga2VybmVsIGFsbG9jYXRpb25zIGluIGtlcm5lbCB6b25lIG9ubHkiIG9ubHkN
Cj4+IGhhbmRsZSB0aGUgYWxsb2NhdGlvbiBmb3IgYWNjX3NpemUsIHRoZSBzeXN0ZW0gbWVtb3J5
IHBhZ2UgYWxsb2NhdGlvbiBpcw0KPj4gdGhyb3VnaCB0dG1fbWVtX2dsb2JhbF9hbGxvY19wYWdl
IHdoaWNoIHN0aWxsIGFjY291bnQgdG8gZG1hMzIgem9uZSBpZg0KPj4gcGFnZSBpcyBiZWxvdyA0
R0IuDQo+IA0KPiBOQUssIGFzIHRoZSBuYW1lIHNheXMgdGhlIG1lbV9nbG9iIGlzIGdsb2JhbCBm
b3IgYWxsIGRldmljZXMgaW4gdGhlIHN5c3RlbS4NCj4gDQo+IFNvIHRoaXMgd2lsbCBicmVhayBp
ZiB5b3UgbWl4IERNQTMyIGFuZCBub24gRE1BMzIgaW4gdGhlIHNhbWUgc3lzdGVtIA0KPiB3aGlj
aCBpcyBleGFjdGx5IHRoZSBjb25maWd1cmF0aW9uIG15IGxhcHRvcCBoZXJlIGhhcyA6KA0KPg0K
SSBkaWRuJ3QgZmluZCBwYXRoIHVzZSBkbWEzMiB6b25lLCBidXQgSSBtYXkgbWlzc2VkIHNvbWV0
aGluZy4gVGhlcmUgaXMgDQphbiBpc3N1ZSBmb3VuZCBieSBLRkRUZXN0LkJpZ0J1ZlN0cmVzc1Rl
c3QsIGl0IGFsbG9jYXRlcyBidWZmZXJzIHVwIHRvIA0KMy84IG9mIHRvdGFsIDI1NkdCIHN5c3Rl
bSBtZW1vcnksIGVhY2ggYnVmZmVyIHNpemUgaXMgMTI4TUIsIHRoZW4gdXNlIA0KcXVldWUgdG8g
d3JpdGUgdG8gdGhlIGJ1ZmZlcnMuIElmIHR0bV9tZW1fZ2xvYmFsX2FsbG9jX3BhZ2UgZ2V0IHBh
Z2UgcGZuIA0KaXMgYmVsb3cgNEdCLCBpdCBhY2NvdW50IHRvIGRtYTMyIHpvbmUgYW5kIHdpbGwg
ZXhoYXVzdCAyR0IgbGltaXQsIHRoZW4gDQp0dG1fY2hlY2tfc3dhcHBpbmcgd2lsbCBzY2hlZHVs
ZSB0dG1fc2hyaW5rX3dvcmsgdG8gc3RhcnQgZXZpY3Rpb24uIEl0IA0KdGFrZXMgbWludXRlcyB0
byBmaW5pc2ggcmVzdG9yZSAocmV0cnkgbWFueSB0aW1lcyBpZiBidXN5KSwgdGhlIHRlc3QgDQpm
YWlsZWQgYmVjYXVzZSBxdWV1ZSB0aW1lb3V0LiBUaGlzIGV2aWN0aW9uIGlzIHVubmVjZXNzYXJ5
IGJlY2F1c2Ugd2UgDQpzdGlsbCBoYXZlIGVub3VnaCBmcmVlIHN5c3RlbSBtZW1vcnkuDQoNCkl0
J3MgcmFuZG9tIGNhc2UsIGhhcHBlbnMgYWJvdXQgMS81LiBJIGNhbiBjaGFuZ2UgdGVzdCB0byBp
bmNyZWFzZSB0aGUgDQp0aW1lb3V0IHZhbHVlIHRvIHdvcmthcm91bmQgdGhpcywgYnV0IHRoaXMg
c2VlbXMgVFRNIGJ1Zy4gVGhpcyB3aWxsIHNsb3cgDQphcHBsaWNhdGlvbiBwZXJmb3JtYW5jZSBh
IGxvdCBpZiB0aGlzIHJhbmRvbSBpc3N1ZSBoYXBwZW5zLg0KDQpUaGFua3MsDQpQaGlsaXANCg0K
DQo+IENocmlzdGlhbi4NCj4gDQo+Pg0KPj4gQ2hhbmdlLUlkOiBJMjg5Yjg1ZDg5MWI4ZjY0YTE0
MjJjNDJiMWVhYjM5ODA5OGFiN2VmNw0KPj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwIFlhbmcgPFBo
aWxpcC5ZYW5nQGFtZC5jb20+DQo+PiAtLS0NCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV90dG0uYyB8IDQgKysrKw0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdHRtLmMgDQo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0u
Yw0KPj4gaW5kZXggMjc3OGZmNjNkOTdkLi43OWJiOWRmZTYxN2IgMTAwNjQ0DQo+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMNCj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYw0KPj4gQEAgLTE2ODYsNiArMTY4NiwxMCBA
QCBpbnQgYW1kZ3B1X3R0bV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPj4gwqDC
oMKgwqDCoCB9DQo+PiDCoMKgwqDCoMKgIGFkZXYtPm1tYW4uaW5pdGlhbGl6ZWQgPSB0cnVlOw0K
Pj4gK8KgwqDCoCAvKiBPbmx5IGtlcm5lbCB6b25lIChubyBkbWEzMiB6b25lKSBpZiBkZXZpY2Ug
ZG9lcyBub3QgcmVxdWlyZSANCj4+IGRtYTMyICovDQo+PiArwqDCoMKgIGlmICghYWRldi0+bmVl
ZF9kbWEzMikNCj4+ICvCoMKgwqDCoMKgwqDCoCBhZGV2LT5tbWFuLmJkZXYuZ2xvYi0+bWVtX2ds
b2ItPm51bV96b25lcyA9IDE7DQo+PiArDQo+PiDCoMKgwqDCoMKgIC8qIFdlIG9wdCB0byBhdm9p
ZCBPT00gb24gc3lzdGVtIHBhZ2VzIGFsbG9jYXRpb25zICovDQo+PiDCoMKgwqDCoMKgIGFkZXYt
Pm1tYW4uYmRldi5ub19yZXRyeSA9IHRydWU7DQo+IA0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
