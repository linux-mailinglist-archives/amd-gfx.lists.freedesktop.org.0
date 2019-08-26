Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DC09D4D0
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Aug 2019 19:16:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338EB89F6F;
	Mon, 26 Aug 2019 17:16:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690060.outbound.protection.outlook.com [40.107.69.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F7189F6F
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 17:16:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PRqisUqMG63uRkpa0q1aIRX1i9IlJuXn4UGe4DH2EHiWT21xIMwAlH7R4j0jouYdW7qwzkJzTRxKFAlBocd2UpWnM8xZBMYra/W58yPajjQ8fKEEq2WqGVd3oSAAGCoEJVaJRNzwDtUUdPckyHz1KqnpC0jBlhf/lxmm3DdEnFxgqqeWooEcQWaHdMTNUH3FITuXFOSXovDH3yHccF+TAjwsX63/mpJrcohGFUCdjKhhtYM0bcHa5vC9P0DNdhYbxvosAsGu7HQ2wAKV7j4hNezECW+U5D3b7sQGficUx2hcEJ4iuxY3tGmZrhIr9OxqBTrIL+J12eJ3EYEX471xdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ikGkn2BJ+0IRNDOZ17mlsLu6w+DV4g/iQT+7PgtsFNc=;
 b=SDY5cBeCgdHb/N62VRxsmwEP67jPZ5shBNADbG5NgRVc3Vl3lWEAL6ZQH/5ss8ntnxMLZvVkzuWUX8Q85fv/9TVAA0rACoBoH1df9T3p8dyNLOLAVj/ss3pYt99QR86WQhRUOaU7SzDkLD9fFX31HMxOEpdmQRb8r/fZhkyo7HcWwFoi9DTfqhVSfsHQDRcloUNq5oPY+e65bVZlW+JcL7hXkumeO7WjHB7b2Ir90rm1R3DMPeSajvR2W/w9s2AqBNFEPm6uhyb40Bt7pwltHL2MEKBdgtQs4P15ITdoFK3kM03/CbTPoJP53MBGtfc0U0/f79AQBmLXwvQNU4NU4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1786.namprd12.prod.outlook.com (10.175.91.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Mon, 26 Aug 2019 17:16:33 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 17:16:33 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/amdgpu: Support snooped PTE flag
Thread-Topic: [PATCH 3/4] drm/amdgpu: Support snooped PTE flag
Thread-Index: AQHVWfpzxkfPqEXOrkaSf+Sezn1FH6cKJd+AgABW3YCAACt2AIAC7oQAgAAZUwA=
Date: Mon, 26 Aug 2019 17:16:33 +0000
Message-ID: <89bf5baa-4b63-e40a-7995-fa35bad988b7@amd.com>
References: <20190823213249.10749-1-Felix.Kuehling@amd.com>
 <20190823213249.10749-4-Felix.Kuehling@amd.com>
 <f09e6893-347b-4ade-76e5-ad37d8e4e782@gmail.com>
 <a7f9ad48-2e46-5415-e2a8-1738a101d716@amd.com>
 <96b6ac1d-de87-3fdb-a531-af4b0a42f1d5@gmail.com>
 <4b48fc1a-6ee2-bb60-0518-ea9c6346b8d6@amd.com>
In-Reply-To: <4b48fc1a-6ee2-bb60-0518-ea9c6346b8d6@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0185.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::29) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f532952d-6cdc-4b16-9e9d-08d72a4924ac
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1786; 
x-ms-traffictypediagnostic: DM5PR12MB1786:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB17861A19FDBF2E867181EB3D83A10@DM5PR12MB1786.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(189003)(199004)(110136005)(76176011)(14444005)(316002)(86362001)(52116002)(31696002)(2906002)(58126008)(65806001)(65956001)(186003)(6116002)(2501003)(102836004)(53546011)(4326008)(7736002)(6436002)(6486002)(25786009)(6246003)(305945005)(31686004)(64756008)(66446008)(229853002)(6512007)(66476007)(14454004)(81156014)(8676002)(81166006)(71200400001)(66574012)(71190400001)(5660300002)(66946007)(53936002)(476003)(46003)(11346002)(99286004)(478600001)(486006)(446003)(2616005)(256004)(8936002)(386003)(6506007)(36756003)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1786;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: b2+R+na7cN3mPTVpqYUg+2CHQimNvEJMmOd/jnr/Htz4Y3idEhKR3r7IHnDuMQvS9ikCcprHCJZsjFsjctCu6bXLX9wWEjrNOlLjuSlb9szNrui4IpFkrj6arkmrdvFpW4u1PMAdVx/vGzoaz7bcH+0iulUdAhVPkUUxk21+Eiwr698Yg4wmRpwLFHuCb0HbCY4OmC/3vynhbdSxNV0FOrd4CxhgdWgOuczech9yrNXcDCp6FWGcjZtABIExk0LkC3L4r8qJDxcZgeKBA0K61bhqYPy/i+LZ6Ax8gw9Lp5d83EAgB1FP8c52H+S8LdqXlRVW+iY1Vv5eCxe+vlbp5VFZelw8aWut6Dgt1HfizmynbRudWHRyWYZ18jEwCuTLFLm85RIVqCImDTI0lBRIfy2MFEuT2x1NxPXxIvki1WY=
Content-ID: <9D1896BD4D656D458929A5B58ED6FAD2@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f532952d-6cdc-4b16-9e9d-08d72a4924ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 17:16:33.5834 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E9QnrPH104t2HMl8vQJNJO4Iqj15dxrE4RNPDOG5DcwwNfO2qRF055yLdR0Sr9lA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1786
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ikGkn2BJ+0IRNDOZ17mlsLu6w+DV4g/iQT+7PgtsFNc=;
 b=DIeRVpt4/BYfmyQI6YB8by4O9Vx5kqB8MUPEVzJ9nLOQ9yvAhP9gziU1usuZcHLqfBjlZTjUioMEnpVoLrjf/cKbPNN6GeohHpOTLPmtIqbHmUxjGq04ba3R4MoARXpDVi8E5tr6FZ/F7nt8FwajKpRGNB0TOa/EYaGkIjzkN+Q=
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
Cc: "Zeng, Oak" <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjYuMDguMTkgdW0gMTc6NDUgc2NocmllYiBLdWVobGluZywgRmVsaXg6DQo+IE9uIDIwMTkt
MDgtMjQgMjo1OSBwLm0uLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOg0KPj4gQW0gMjQuMDguMTkg
dW0gMTg6MjQgc2NocmllYiBLdWVobGluZywgRmVsaXg6DQo+Pj4gT24gMjAxOS0wOC0yNCA3OjEz
LCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOg0KPj4+PiBBbSAyMy4wOC4xOSB1bSAyMzozMyBzY2hy
aWViIEt1ZWhsaW5nLCBGZWxpeDoNCj4+Pj4+IEZyb206IE9hayBaZW5nIDxPYWsuWmVuZ0BhbWQu
Y29tPg0KPj4+Pj4NCj4+Pj4+IFNldCBzbm9vcGVkIFBURSBmbGFnIGFjY29yZGluZyB0byBtYXBw
aW5nIGZsYWcuIFdyaXRlIHJlcXVlc3QgdG8gYQ0KPj4+Pj4gcGFnZSB3aXRoIHNub29wZWQgYml0
IHNldCwgd2lsbCBzZW5kIG91dCBpbnZhbGlkYXRlIHByb2JlIHJlcXVlc3QNCj4+Pj4+IHRvIFRD
QyBvZiB0aGUgcmVtb3RlIEdQVSB3aGVyZSB0aGUgdnJhbSBwYWdlIHJlc2lkZXMuDQo+Pj4+Pg0K
Pj4+Pj4gQ2hhbmdlLUlkOiBJNzk5ZjY4ZWM3YTVhMWFiZjMyMDc1ZjVlZjMxMDUxNjQxYTBiMzcz
Ng0KPj4+Pj4gU2lnbmVkLW9mZi1ieTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+DQo+Pj4+
PiAtLS0NCj4+Pj4+ICDCoMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMg
fCAzICsrKw0KPj4+Pj4gIMKgwqAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPj4+
Pj4NCj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlf
MC5jDQo+Pj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMNCj4+Pj4+
IGluZGV4IDlhYWZjZGE2YzQ4OC4uOGE3YzRlYzY5YWU4IDEwMDY0NA0KPj4+Pj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYw0KPj4+Pj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYw0KPj4+Pj4gQEAgLTYwNCw2ICs2MDQsOSBAQCBz
dGF0aWMgdWludDY0X3QgZ21jX3Y5XzBfZ2V0X3ZtX3B0ZV9mbGFncyhzdHJ1Y3QNCj4+Pj4+IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsDQo+Pj4+PiAgwqDCoMKgwqDCoMKgIGlmIChmbGFncyAmIEFNREdQ
VV9WTV9QQUdFX1BSVCkNCj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwdGVfZmxhZyB8PSBB
TURHUFVfUFRFX1BSVDsNCj4+Pj4+ICDCoMKgICvCoMKgwqAgaWYgKGZsYWdzICYgQU1ER1BVX1ZN
X1BBR0VfSU5WQUxJREFURV9QUk9CRSkNCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBwdGVfZmxhZyB8
PSBBTURHUFVfUFRFX1NOT09QRUQ7DQo+Pj4+PiArDQo+Pj4+IFRoYXQgaXMgc3RpbGwgYSBOQUsg
d2l0aG91dCBmdXJ0aGVyIGNoZWNrcy4gV2UgbmVlZCB0byBtYWtlIGFic29sdXRlbHkNCj4+Pj4g
c3VyZSB0aGF0IHdlIGRvbid0IHNldCB0aGlzIHdoZW4gUENJZSByb3V0aW5nIGlzIGluIHVzZS4N
Cj4+PiBUaGUgb25seSBwbGFjZSB3aGVyZSBBTURHUFVfVk1fLi4uIGZsYWdzIGFyZSBhY2NlcHRl
ZCBmcm9tIHVzZXIgbW9kZQ0KPj4+IHNlZW1zIHRvIGJlIGFtZGdwdV9nZW1fdmFfaW9jdGwuIEl0
IGhhcyBhbiBleHBsaWNpdCBzZXQgb2YgdmFsaWRfZmxhZ3MNCj4+PiBpdCBhY2NlcHRzLiBUaGUg
bmV3IElOVkFMSURBVEVfUFJPQkUgZmxhZyBpcyBub3QgcGFydCBvZiBpdC4gVGhhdCBtZWFucw0K
Pj4+IHVzZXIgbW9kZSB3aWxswqAgbm90IGJlIGFibGUgdG8gc2V0IGl0IGRpcmVjdGx5LiBJZiB3
ZSBhZGRlZCBpdCB0byB0aGUNCj4+PiBzZXQgb2YgdmFsaWRfZmxhZ3MgaW4gYW1kZ3B1X2dlbV92
YV9pb2N0bCwgd2UnZCBuZWVkIHRvIGFkZCBhcHByb3ByaWF0ZQ0KPj4+IGNoZWNrcyBhdCB0aGUg
c2FtZSB0aW1lLg0KPj4+DQo+Pj4gS0ZEIGRvZXMgbm90IGV4cG9zZSBBTURHUFVfVk1fLi4uIGZs
YWdzIGRpcmVjdGx5IHRvIHVzZXIgbW9kZS4gSXQgb25seQ0KPj4+IHNldHMgdGhlIElOVkFMSURB
VEVfUFJPQkUgZmxhZyBpbiBrZXJuZWwgbW9kZSBmb3IgbWFwcGluZ3MgaW4gdGhlIHNhbWUNCj4+
PiBYR01JIGhpdmUgb24gQXJ0dXJ1cyAoaW4gcGF0Y2ggNCkuDQo+Pj4NCj4+PiBJZiB0aGVyZSBp
cyBzb21ldGhpbmcgSSdtIG1pc3NpbmcsIHBsZWFzZSBwb2ludCBpdCBvdXQuIEJ1dCBBRkFJQ1Qg
dGhlDQo+Pj4gY2hlY2tpbmcgdGhhdCBpcyBjdXJyZW50bHkgZG9uZSBzaG91bGQgc2F0aXNmeSB5
b3VyIHJlcXVpcmVtZW50cy4NCj4+IFRoZSBoYXJkd2FyZSBiZWhhdmlvciBkZXBlbmRzIG9uIHRo
ZSBwbGFjZW1lbnQgb2YgdGhlIGJ1ZmZlciwgc28gYXQNCj4+IGJhcmUgbWluaW11bSB3ZSBuZWVk
IHRvIGNoZWNrIGlmIGl0J3MgcG9pbnRpbmcgdG8gUENJZSBvciBsb2NhbCAoY2hlY2sNCj4+IHRo
ZSBzeXN0ZW0gYml0KS4NCj4+DQo+PiBCdXQgZXZlbiBpZiBpdCdzIGxvY2FsIHdoYXQgaXMgdGhl
IGJlaGF2aW9yIGZvciBsb2NhbCBtZW1vcnk/IEUuZy4gbm90DQo+PiBhY2Nlc3NlZCB0aHJvdWdo
IFhHTUk/DQo+Pg0KPj4gQXMgZmFyIGFzIEkgY2FuIHNlZSB3aGF0IHdlIG5lZWQgdG8gY2hlY2sg
aGVyZSBpcyB0aGF0IHRoaXMgaXMgYQ0KPj4gcmVtb3RlIGFjY2VzcyBvdmVyIFhHTUkgYW5kIHRo
ZW4gKGFuZCBvbmx5IHRoZW4hKSB3ZSBhcmUgYWxsb3dlZCB0bw0KPj4gc2V0IHRoZSBzbm9vcCBi
aXQgb24gdGhlIFBURS4NCj4gTXkgcG9pbnQgaXMsIHRoZSBvbmx5IHBsYWNlIHdoZXJlIHRoaXMg
Yml0IGNhbiBnZXQgc2V0IHJpZ2h0IG5vdyBpcyBpbg0KPiBrZXJuZWwgbW9kZSBpbiBhbWRncHVf
YW1ka2ZkX2dwdXZtLmMuIFNlZSBwYXRjaCA0IG9mIG15IHNlcmllcy4gVGhhdA0KPiBjb2RlIGFs
cmVhZHkgaGFzIGFsbCB0aGUgcmlnaHQgY29uZGl0aW9ucyB0byBtYWtlIHN1cmUgdGhlDQo+IElO
VkFMSURBVEVfUFJPQkUgYml0IGlzIG9ubHkgc2V0IGluIHRoZSBjb3JyZWN0IGNpcmN1bXN0YW5j
ZXMgKHJlbW90ZQ0KPiBYR01JIG1hcHBpbmdzIGluIHRoZSBzYW1lIGhpdmUpOg0KPg0KPj4gKwlz
d2l0Y2ggKGFkZXYtPmFzaWNfdHlwZSkgew0KPj4gKwljYXNlIENISVBfQVJDVFVSVVM6DQo+PiAr
CQlpZiAobWVtLT5hbGxvY19mbGFncyAmIEFMTE9DX01FTV9GTEFHU19WUkFNKSB7DQo+PiArCQkJ
aWYgKGJvX2FkZXYgPT0gYWRldikgew0KPj4gKwkJCQkuLi4NCj4+ICsJCQl9IGVsc2Ugew0KPj4g
KwkJCQkuLi4NCj4+ICsJCQkJaWYgKGFtZGdwdV94Z21pX3NhbWVfaGl2ZShhZGV2LCBib19hZGV2
KSkNCj4+ICsJCQkJCW1hcHBpbmdfZmxhZ3MgfD0NCj4+ICsJCQkJCQlBTURHUFVfVk1fUEFHRV9J
TlZBTElEQVRFX1BST0JFOw0KPj4gKwkJCX0NCj4+ICsJCX0gZWxzZSB7DQo+IEkgdGhpbmsgeW91
J3JlIGFza2luZyBtZSB0byBhZGQgYW4gZXh0cmEgY2hlY2sgZm9yIHRoZSBzYW1lIGNvbmRpdGlv
bnMNCj4gaW4gdGhlIEdNQyBjb2RlPyBMaWtlIEdNQyBkb2Vzbid0IHRydXN0IGFtZGdwdV9hbWRr
ZmQuIEl0IHNlZW1zDQo+IGNvbXBsZXRlbHkgcmVkdW5kYW50IGFuZCBhIGJpdCBwYXJhbm9pZCB0
byBtZS4NCg0KV2VsbCB0aGUgam9iIG9mIHRoZSBWTSBjb2RlIGlzIHRvIGZpZ3VyZSBvdXQgdGhl
IGZsYWdzIGFuZCBsb2NhdGlvbiBmb3IgDQp0aGUgUFRFIGJhc2VkIG9uIHRoZSBjdXJyZW50IHBs
YWNlbWVudCBCTyBhbmQgdGhlIGZsYWdzIGdpdmVuIGZvciB0aGUgDQptYXBwaW5nLg0KDQpBbmQg
eWVzIHRoYXQgaW1wbGllcyB0aGF0IHdlIGRvbid0IHRydXN0IHVwcGVyIGxheWVycyB0byBkbyB0
aGlzIGluc3RlYWQuDQoNCj4gZ21jX3Y5XzBfZ2V0X3ZtX3B0ZV9mbGFncyBkb2Vzbid0IGV2ZW4g
aGF2ZSBhbGwgdGhlIGluZm9ybWF0aW9uIGl0IG5lZWRzIHRvIG1ha2UgdGhhdCBkZXRlcm1pbmF0
aW9uLg0KDQpXZWxsIHRoZW4gd2UgcHJvYmFibHkgbmVlZCB0byBjaGFuZ2UgdGhhdC4NCg0KUmVn
YXJkcywNCkNocmlzdGlhbi4NCg0KPg0KPiBSZWdhcmRzLA0KPiAgIMKgIEZlbGl4DQo+DQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
