Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D9EBFB2B
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 23:59:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA736EE15;
	Thu, 26 Sep 2019 21:59:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730081.outbound.protection.outlook.com [40.107.73.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E944E6EE15
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 21:59:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QEdLTk82TCoCj5JoYt3Hjx7MniFeimeJvmq1oxpxfBoFIiMUEQQtTkmOI9bXU3ROGN/vpHfRQpUYjd8GKm5oCO0r4UHGeyuqp+wvmOp2T2z7jgDa2Z2BeFKMC2v31n5fg51OCjRrLlWCrCXH56Dej9ye7uDUGP5K77YF8ZamZgwBmnHknNzN83nLEhhVCQenIsWE6qXFwjwDD0J6cvntxvYpzR9oSZwJt5pjSkjJ68Sp3RODZQtNmDJ/sg0SDDo1yzpZ6GvycKPB5V61OeYFrDp0doKy3HyVlsQK6B1FInpkC8yZAOTFFF1z8LNtBZbrgs3J5lyTSvue5R+YDuL+xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q86ruHHof2NLsILl8cOWGyIIbkh6gv5jWqQOOKke030=;
 b=hJuokMyLhvdbyz/DymV8urL0ea2XiLbS/tw5X45OrINXP81AM1siecI9lgWvU8wiYfCmxavP+vnM4DoQ4V0HiTWeDe1ysbXkMoNPuZSz+PMIuPTGbBOjSdkCMqx1uR7TTfhg0SLSisrgwSZAUWfqx/ZbxhSVjj6GiQkC1hKVFnrKb8c4stqvvgBuSXP9jEmNBRo5aBfjQd37RyP+tRNDOCNilK8TKzYLqGDJTI1S0piClP2+yM9Ss5LIlTGL7UvCT11YxR1d76DQZb6TyrJ9BPaijPEhQ5szvhIvr9XzWLzDzzbvl+fagEVzG/6PqKXw/o2VDspUAEZaJ8AwA9desg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB3226.namprd12.prod.outlook.com (20.179.105.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15; Thu, 26 Sep 2019 21:59:35 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa%4]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 21:59:35 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/amdkfd: Record vmid pasid mapping in the driver
 for non HWS mode
Thread-Topic: [PATCH 1/2] drm/amdkfd: Record vmid pasid mapping in the driver
 for non HWS mode
Thread-Index: AQHVdLEqfaqrBCzjNUSyTJI1+qxGEac+e3SAgAAGhYA=
Date: Thu, 26 Sep 2019 21:59:35 +0000
Message-ID: <397a92e1-a5cc-0607-43c6-2922273a1459@amd.com>
References: <20190926212640.28989-1-Yong.Zhao@amd.com>
 <d1129739-2f34-4bc3-96f7-a9a9c999313a@amd.com>
In-Reply-To: <d1129739-2f34-4bc3-96f7-a9a9c999313a@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::34) To DM6PR12MB2778.namprd12.prod.outlook.com
 (2603:10b6:5:50::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 250d7451-13df-4d63-86d0-08d742ccd173
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB3226:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB32268BFFAE724C20FADB8272F0860@DM6PR12MB3226.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(366004)(346002)(136003)(199004)(189003)(36756003)(110136005)(3846002)(6116002)(5660300002)(256004)(99286004)(6512007)(31686004)(66066001)(6436002)(53546011)(186003)(6486002)(386003)(6506007)(229853002)(52116002)(76176011)(2906002)(102836004)(66946007)(66476007)(31696002)(66446008)(66556008)(64756008)(86362001)(8936002)(81166006)(81156014)(8676002)(6246003)(71200400001)(305945005)(11346002)(14454004)(2616005)(7736002)(71190400001)(486006)(478600001)(2501003)(26005)(476003)(446003)(316002)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3226;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0vHwC/M1567zzK8JkProZBXsZL4NWIhbY4j4kUSumvZLwHTOq+n4PNChf0duFWZY3NIItjxjMCLuroKUac+ypeHlyURb6rKJIosuKITtg6QRYRuSfI7VwzJ2aFz4YQS06noLJ5gaDyjS9AwFtp6aO7K2gJltRxT1sz2LHT9xjMqpGnphljRvtX2GL0iMetmOnCMbAZRummyhWFZaoquwYrvoKM7oXW6bM4KoH0HxnqJpojgp64CBTU/LQyowGVCQ1Eeyg9gJQGi/XIb1maSg9HgEUKGVbxeJgIF1J6ng649zHrgps2l+BXxJfH71S176sInqG01Mew+GVYWDA1ps25HeasYqfvcEhTU4mlC+Os8ffY9mQoUb3IqmwWYns0w2imJDPMOMcBeSlx2n4ybwSu1Ko2tbHiNBOfMc3MDMAaY=
Content-ID: <F3CF09E2C4138E468D1C61C13F11F373@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 250d7451-13df-4d63-86d0-08d742ccd173
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 21:59:35.3434 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8EPojm72ItS8HCJiQ5Hso0HtNw8dQ+5/8a7RUi17gw/PpEUjFDmvPOo6NAAd4r2I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3226
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q86ruHHof2NLsILl8cOWGyIIbkh6gv5jWqQOOKke030=;
 b=sXHrmJYmB08CWZ6KDYstTmfIhC5/yD+KQ6jBs3kkHU7VXpsvd2fmVmIbK4qyWbOxwheJsu+Rth/mIuad8o1kL4+3/kVati85iass1KnttEAhyHEaTi5h7Wp3TTG1Q+foJPoopEJVdUNi6e2r3IwmWrk4HuFNOEeMluS1TIb9HOE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yong.Zhao@amd.com; 
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

DQpPbiAyMDE5LTA5LTI2IDU6MzYgcC5tLiwgS3VlaGxpbmcsIEZlbGl4IHdyb3RlOg0KPiBNaW5v
ciBuaXQtcGljayBpbmxpbmUuIE90aGVyd2lzZSB0aGlzIHBhdGNoIGlzDQo+DQo+IFJldmlld2Vk
LWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCj4NCj4gT24gMjAx
OS0wOS0yNiA1OjI3IHAubS4sIFpoYW8sIFlvbmcgd3JvdGU6DQo+PiBUaGlzIG1ha2VzIHBvc3Np
YmxlIHRoZSB2bWlkIHBhc2lkIG1hcHBpbmcgcXVlcnkgdGhyb3VnaCBzb2Z0d2FyZS4NCj4+DQo+
PiBDaGFuZ2UtSWQ6IEliNTM5YWFlMjc3YTIyN2NjMzlmNjQ2OWFlMjNjNDZjNGQyODliODdiDQo+
PiBTaWduZWQtb2ZmLWJ5OiBZb25nIFpoYW8gPFlvbmcuWmhhb0BhbWQuY29tPg0KPj4gLS0tDQo+
PiAgICAuLi4vZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMgfCAzMyAr
KysrKysrKysrKystLS0tLS0tDQo+PiAgICAuLi4vZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9x
dWV1ZV9tYW5hZ2VyLmggfCAgMyArLQ0KPj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQv
a2ZkX3ByaXYuaCAgICAgICAgIHwgIDIgKysNCj4+ICAgIDMgZmlsZXMgY2hhbmdlZCwgMjUgaW5z
ZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMNCj4+IGluZGV4IGU3
ZjBhMzJlMGU0NC4uNDU1ZjQ5YTI1Y2NiIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMNCj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jDQo+PiBAQCAtMjI0
LDIwICsyMjQsMzAgQEAgc3RhdGljIGludCBhbGxvY2F0ZV92bWlkKHN0cnVjdCBkZXZpY2VfcXVl
dWVfbWFuYWdlciAqZHFtLA0KPj4gICAgCQkJc3RydWN0IHFjbV9wcm9jZXNzX2RldmljZSAqcXBk
LA0KPj4gICAgCQkJc3RydWN0IHF1ZXVlICpxKQ0KPj4gICAgew0KPj4gLQlpbnQgYml0LCBhbGxv
Y2F0ZWRfdm1pZDsNCj4+ICsJaW50IGFsbG9jYXRlZF92bWlkID0gLTEsIGk7DQo+PiAgICANCj4+
IC0JaWYgKGRxbS0+dm1pZF9iaXRtYXAgPT0gMCkNCj4+IC0JCXJldHVybiAtRU5PTUVNOw0KPj4g
Kwlmb3IgKGkgPSBkcW0tPmRldi0+dm1faW5mby5maXJzdF92bWlkX2tmZDsNCj4+ICsJCQlpIDw9
IGRxbS0+ZGV2LT52bV9pbmZvLmxhc3Rfdm1pZF9rZmQ7IGkrKykgew0KPj4gKwkJaWYgKCFkcW0t
PnZtaWRfcGFzaWRbaV0pIHsNCj4+ICsJCQlhbGxvY2F0ZWRfdm1pZCA9IGk7DQo+PiArCQkJYnJl
YWs7DQo+PiArCQl9DQo+PiArCX0NCj4+ICsNCj4+ICsJaWYgKGFsbG9jYXRlZF92bWlkIDwgMCkg
ew0KPj4gKwkJcHJfZXJyKCJubyBtb3JlIHZtaWQgdG8gYWxsb2NhdGVcbiIpOw0KPj4gKwkJcmV0
dXJuIC1FTk9TUEM7DQo+PiArCX0NCj4+ICsNCj4+ICsJcHJfZGVidWcoInZtaWQgYWxsb2NhdGVk
OiAlZFxuIiwgYWxsb2NhdGVkX3ZtaWQpOw0KPj4gKw0KPj4gKwlkcW0tPnZtaWRfcGFzaWRbYWxs
b2NhdGVkX3ZtaWRdID0gcS0+cHJvY2Vzcy0+cGFzaWQ7DQo+PiAgICANCj4+IC0JYml0ID0gZmZz
KGRxbS0+dm1pZF9iaXRtYXApIC0gMTsNCj4+IC0JZHFtLT52bWlkX2JpdG1hcCAmPSB+KDEgPDwg
Yml0KTsNCj4+ICsJc2V0X3Bhc2lkX3ZtaWRfbWFwcGluZyhkcW0sIHEtPnByb2Nlc3MtPnBhc2lk
LCBhbGxvY2F0ZWRfdm1pZCk7DQo+PiAgICANCj4+IC0JYWxsb2NhdGVkX3ZtaWQgPSBiaXQgKyBk
cW0tPmRldi0+dm1faW5mby5maXJzdF92bWlkX2tmZDsNCj4+IC0JcHJfZGVidWcoInZtaWQgYWxs
b2NhdGlvbiAlZFxuIiwgYWxsb2NhdGVkX3ZtaWQpOw0KPj4gICAgCXFwZC0+dm1pZCA9IGFsbG9j
YXRlZF92bWlkOw0KPj4gICAgCXEtPnByb3BlcnRpZXMudm1pZCA9IGFsbG9jYXRlZF92bWlkOw0K
Pj4gICAgDQo+PiAtCXNldF9wYXNpZF92bWlkX21hcHBpbmcoZHFtLCBxLT5wcm9jZXNzLT5wYXNp
ZCwgcS0+cHJvcGVydGllcy52bWlkKTsNCj4+ICAgIAlwcm9ncmFtX3NoX21lbV9zZXR0aW5ncyhk
cW0sIHFwZCk7DQo+PiAgICANCj4+ICAgIAkvKiBxcGQtPnBhZ2VfdGFibGVfYmFzZSBpcyBzZXQg
ZWFybGllciB3aGVuIHJlZ2lzdGVyX3Byb2Nlc3MoKQ0KPj4gQEAgLTI3OCw4ICsyODgsNiBAQCBz
dGF0aWMgdm9pZCBkZWFsbG9jYXRlX3ZtaWQoc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpk
cW0sDQo+PiAgICAJCQkJc3RydWN0IHFjbV9wcm9jZXNzX2RldmljZSAqcXBkLA0KPj4gICAgCQkJ
CXN0cnVjdCBxdWV1ZSAqcSkNCj4+ICAgIHsNCj4+IC0JaW50IGJpdCA9IHFwZC0+dm1pZCAtIGRx
bS0+ZGV2LT52bV9pbmZvLmZpcnN0X3ZtaWRfa2ZkOw0KPj4gLQ0KPj4gICAgCS8qIE9uIEdGWCB2
NywgQ1AgZG9lc24ndCBmbHVzaCBUQyBhdCBkZXF1ZXVlICovDQo+PiAgICAJaWYgKHEtPmRldmlj
ZS0+ZGV2aWNlX2luZm8tPmFzaWNfZmFtaWx5ID09IENISVBfSEFXQUlJKQ0KPj4gICAgCQlpZiAo
Zmx1c2hfdGV4dHVyZV9jYWNoZV9ub2Nwc2NoKHEtPmRldmljZSwgcXBkKSkNCj4+IEBAIC0yODks
OCArMjk3LDggQEAgc3RhdGljIHZvaWQgZGVhbGxvY2F0ZV92bWlkKHN0cnVjdCBkZXZpY2VfcXVl
dWVfbWFuYWdlciAqZHFtLA0KPj4gICAgDQo+PiAgICAJLyogUmVsZWFzZSB0aGUgdm1pZCBtYXBw
aW5nICovDQo+PiAgICAJc2V0X3Bhc2lkX3ZtaWRfbWFwcGluZyhkcW0sIDAsIHFwZC0+dm1pZCk7
DQo+PiArCWRxbS0+dm1pZF9wYXNpZFtxcGQtPnZtaWRdID0gMDsNCj4+ICAgIA0KPj4gLQlkcW0t
PnZtaWRfYml0bWFwIHw9ICgxIDw8IGJpdCk7DQo+PiAgICAJcXBkLT52bWlkID0gMDsNCj4+ICAg
IAlxLT5wcm9wZXJ0aWVzLnZtaWQgPSAwOw0KPj4gICAgfQ0KPj4gQEAgLTEwMTcsNyArMTAyNSw4
IEBAIHN0YXRpYyBpbnQgaW5pdGlhbGl6ZV9ub2Nwc2NoKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFu
YWdlciAqZHFtKQ0KPj4gICAgCQkJCWRxbS0+YWxsb2NhdGVkX3F1ZXVlc1twaXBlXSB8PSAxIDw8
IHF1ZXVlOw0KPj4gICAgCX0NCj4+ICAgIA0KPj4gLQlkcW0tPnZtaWRfYml0bWFwID0gKDEgPDwg
ZHFtLT5kZXYtPnZtX2luZm8udm1pZF9udW1fa2ZkKSAtIDE7DQo+PiArCW1lbXNldChkcW0tPnZt
aWRfcGFzaWQsIDAsIHNpemVvZihkcW0tPnZtaWRfcGFzaWQpKTsNCj4+ICsNCj4+ICAgIAlkcW0t
PnNkbWFfYml0bWFwID0gfjBVTEwgPj4gKDY0IC0gZ2V0X251bV9zZG1hX3F1ZXVlcyhkcW0pKTsN
Cj4+ICAgIAlkcW0tPnhnbWlfc2RtYV9iaXRtYXAgPSB+MFVMTCA+PiAoNjQgLSBnZXRfbnVtX3hn
bWlfc2RtYV9xdWV1ZXMoZHFtKSk7DQo+PiAgICANCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuaCBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5oDQo+PiBpbmRleCBlZWQ4
Zjk1MGI2NjMuLjk5YzhiMzYzMDFlZiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5oDQo+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuaA0KPj4gQEAgLTE4OCw3
ICsxODgsOCBAQCBzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgew0KPj4gICAgCXVuc2lnbmVk
IGludAkJKmFsbG9jYXRlZF9xdWV1ZXM7DQo+PiAgICAJdWludDY0X3QJCXNkbWFfYml0bWFwOw0K
Pj4gICAgCXVpbnQ2NF90CQl4Z21pX3NkbWFfYml0bWFwOw0KPj4gLQl1bnNpZ25lZCBpbnQJCXZt
aWRfYml0bWFwOw0KPj4gKwkvKiB0aGUgcGFzaWQgbWFwcGluZyBmb3IgZWFjaCBrZmQgdm1pZCAq
Lw0KPj4gKwl1aW50MTZfdAkJdm1pZF9wYXNpZFtWTUlEX05VTV07DQo+PiAgICAJdWludDY0X3QJ
CXBpcGVsaW5lc19hZGRyOw0KPj4gICAgCXN0cnVjdCBrZmRfbWVtX29iagkqcGlwZWxpbmVfbWVt
Ow0KPj4gICAgCXVpbnQ2NF90CQlmZW5jZV9ncHVfYWRkcjsNCj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX3ByaXYuaA0KPj4gaW5kZXggMGQyYzdmYTFmYTQ2Li5hMDgwMTU3MjA4NDEgMTAw
NjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oDQo+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oDQo+PiBAQCAtNDMsNiAr
NDMsOCBAQA0KPj4gICAgDQo+PiAgICAjaW5jbHVkZSAiYW1kX3NoYXJlZC5oIg0KPj4gICAgDQo+
PiArI2RlZmluZSBWTUlEX05VTSAxNg0KPj4gKw0KPiBBbnkgZ29vZCByZWFzb24gd2h5IHRoaXMg
aXMgbm90IGRlZmluZWQgaW4ga2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmg/DQo+IEl0J3Mgb25s
eSB1c2VkIHRoZXJlLg0KW3l6XSBJdCBjb3VsZCBiZSB1c2VkIGJ5IG90aGVyIHBsYWNlcyBpbiB0
aGUgZnV0dXJlLCBhcyB0aGV5IHVzZSAxNiANCmRpcmVjdGx5IG5vdy4NCj4NCj4NCj4+ICAgICNk
ZWZpbmUgS0ZEX01BWF9SSU5HX0VOVFJZX1NJWkUJOA0KPj4gICAgDQo+PiAgICAjZGVmaW5lIEtG
RF9TWVNGU19GSUxFX01PREUgMDQ0NA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
