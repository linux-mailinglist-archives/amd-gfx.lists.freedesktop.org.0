Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A18FF8431D
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 06:05:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B40F6E5EC;
	Wed,  7 Aug 2019 04:05:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730042.outbound.protection.outlook.com [40.107.73.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 735486E5EC
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Aug 2019 04:05:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jip0Kf0wOtItvGp2JMGjcXtjWYysfhgEOBVFmJBxdqTtm6W/qx2QCHLdTNceGzbGG6zEDOc31dtllGbii7LoAnYCxjRL1mublsQeYACALa17Kztao+CAPbBAD/H0stUfgnFjvTkauo1bvEnOx2iV1yrNPW1JaoGoPOFG4waP3WT7RyXHYfbLspfSkQ6VdpheenAka0WD8xInsTX5uMhd6JI/WVGs0KoJH8fE0FL/o5KuZH1MjY2bZsMxBrQniDg0oKLRdY3IM9+q7huLfp05SJxCE/QRkpTVGvY8kfI33HZxNVkrEbSyfB2+WeDIRdoxpYPIEgqQHItINalLIMUhZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8E1ELZTOqvHMgmqkYh37VJeY6ecO3iC+DtyUNifV5o=;
 b=PWmVuM90TLEqhzG3Y/oCDQFuEhiJlNgsa2n/DXoIKWTkTNWlQipbUitDN8P6alApiNDSiBT5RfRQ6JZ7uuXCw82ZrwFLpDuaoJAu9cAkKWNvCeMAmc32t2XepR6IeH8lrL1DCERnTDWCcD18ZvtGW8Y2W6VgeMTPzPU1x2dQgbXDF4NRpI18bTSZ6aKKR/AOkbTzffT7lNM3bzt4xiRDGE+GAfJarPl5DU+N5SZYS1NOjaQDv1Dlhv4do0Pb7iuFusTMDZQL21X2fYE0LjLurH0daK9c7gUemk5pS/sSDyGFfWSViDmCiQOfhsRv78Y0lCQPumfp2gpqL32dLM5+yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB4314.namprd12.prod.outlook.com (10.141.184.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Wed, 7 Aug 2019 04:05:09 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::1c82:54e7:589b:539c]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::1c82:54e7:589b:539c%5]) with mapi id 15.20.2157.011; Wed, 7 Aug 2019
 04:05:09 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 3/5] drm/amdkfd: Postpone memory mapping flags calculation
 to mapping time
Thread-Topic: [PATCH 3/5] drm/amdkfd: Postpone memory mapping flags
 calculation to mapping time
Thread-Index: AQHVTMguthnRktHFyEeTaummqL3aX6bvEQiA
Date: Wed, 7 Aug 2019 04:05:09 +0000
Message-ID: <ad0aa642-f275-a239-288f-6d83ed60f936@amd.com>
References: <1565145062-16674-1-git-send-email-Oak.Zeng@amd.com>
 <1565145062-16674-3-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1565145062-16674-3-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.54.211]
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTXPR0101CA0062.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::39) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80b4ce59-fa28-4fbe-fe53-08d71aec7048
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB4314; 
x-ms-traffictypediagnostic: DM6PR12MB4314:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB43147C2445E1189187BE217D92D40@DM6PR12MB4314.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39860400002)(366004)(376002)(346002)(199004)(189003)(6512007)(65826007)(36756003)(26005)(186003)(53546011)(6506007)(386003)(102836004)(3846002)(65806001)(6116002)(76176011)(65956001)(66066001)(25786009)(53936002)(6246003)(11346002)(6436002)(99286004)(446003)(5660300002)(4326008)(486006)(229853002)(2616005)(6486002)(31686004)(52116002)(476003)(66446008)(66556008)(66476007)(64756008)(66946007)(71190400001)(71200400001)(305945005)(7736002)(31696002)(478600001)(86362001)(14454004)(30864003)(68736007)(2501003)(54906003)(110136005)(58126008)(316002)(8676002)(2906002)(64126003)(14444005)(256004)(81156014)(81166006)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4314;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UGoqyZg+9+/0KHcAoLuFXpfrCF8Ff6iQCPik8udiQAKp42OBqbvFHCcWSF9pjScCxMCjZ+qbhQ5rco67Jn7ce8cJUDcY0EN89es514f/tbwdwmSobrmZ+VmyKGxO9RqOPz8ljPt9GtrlzkzK8gndzeRce8Bgc9bCZnDvkTjmMkQqpejMDyd23CBFXRZSZA+B5wiP747EDCB1nsh59Q1ij/jkladSkFljAHIG7Yeq3sdcgQUJjFUKw2suyasZ1isioLV4iojT+VXGvakzi+3dah2Ufq3IkABbJcLCy2lUg9SX3B4jAQkdm59VOpeGcP3+iADhuCxTnAo3nxqySukftibydIwre4iQb3mg4WoS75dcFjqWa4F6KrYzL62Q4fRPxwst7KzWTNx8SdzTlDrc5BrdimzUajkunSR9Ru4NTZY=
Content-ID: <FDF555F7643C0F408AE7F12474AE8A08@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80b4ce59-fa28-4fbe-fe53-08d71aec7048
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 04:05:09.6309 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 49aOETY42TQBzraqaqItZn9lz2F9HqZDykqjHMz1tIJbj1CUSyzXslgyAoNWjxcVD415Rp/cVTdzt9elj4jUZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4314
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8E1ELZTOqvHMgmqkYh37VJeY6ecO3iC+DtyUNifV5o=;
 b=Xpq1JG785oMufAsWIAVSgjSKnz3dScsWdtXVtXVncxOGmTxrmIeHUGWq0PViaN6oeXkUMKY9Hz1ZPXloHx9reubUCUVkGoWgKWSbZuGJm59ExgRKPXSSiMsKg0SsGCi8tCgawR8D6mTO9GNA4LZM4yXg6xBtucBzlBHuKabi8Y8=
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
Cc: "Keely, Sean" <Sean.Keely@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wOC0wNiAyMjozMSwgWmVuZywgT2FrIHdyb3RlOg0KPiBTb21lIG1hcHBpbmcgZmxh
Z3MgYXJlIGRlY2lkZWQgYnkgbWVtb3J5IG1hcHBpbmcgZGVzdGluYXRpb24gd2hpY2ggaXMgbm90
DQo+IGtub3cgYXQgbWVtb3J5IG9iamVjdCBhbGxvY2F0aW9uIHRpbWUuIFNvIGl0IGlzIHJlYXNv
bmFibGUgdG8gZGVjaWRlIG1lbW9yeQ0KPiBtYXBwaW5nIGZsYWdzIGF0IG1hcHBpbmcgdGltZSwg
aW5zdGVhZCBvZiBhbGxvYyB0aW1lLiBSZWNvcmQgbWVtb3J5IGFsbG9jYXRpb24NCj4gZmxhZ3Mg
ZHVyaW5nIGFsbG9jYXRpb24gdGltZSBhbmQgY2FsY3VsYXRlIG1hcHBpbmcgZmxhZ3MgZHVyaW5n
IG1lbW9yeSBtYXBwaW5nDQo+IHRpbWUuDQo+DQo+IEFsc28gbWFkZSB0aGUgbWVtb3J5IG1hcHBp
bmcgZmxhZ2UgY2FsY3VsYXRpb24gdG8gYmUgYXNpYy1zcGVjaWZpYywgYmVjYXVzZQ0KPiBkaWZm
ZXJlbnQgYXNpYyBjYW4gaGF2ZSBkaWZmZXJlbnQgbWFwcGluZyBzY2hlbWUuDQo+DQo+IFRoZSBu
ZXcgbWVtb3J5IG1hcHBpbmcgZmxhZyBpcyBkZWNpZGVkIGJ5IGJvdGggbWVtb3J5IGFsbG9jYXRp
b24gZmxhZ3MgYW5kDQo+IHdoZXRoZXIgdGhlIG1lbW9yeSBtYXBwaW5nIGlzIHRvIGEgcmVtb3Rl
IGRldmljZS4NCj4NCj4gVGhpcyBpcyBwcmVwYXJhdGlvbiB3b3JrIHRvIGludHJvZHVjZSBtb3Jl
IHNvcGhpc3RpY2F0ZWQgbWFwcGluZyBzY2hlbWUuDQo+DQo+IENoYW5nZS1JZDogSTk4ZTdjNDdk
ODUwNTg1YWQ3ZjBhOWUxMTYxN2M5MmI3YTlhY2VkM2INCj4gU2lnbmVkLW9mZi1ieTogT2FrIFpl
bmcgPE9hay5aZW5nQGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9hbWRrZmQuaCAgICAgICB8ICAxICsNCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMgfCAxNiArKysrKy0tLS0tLS0tLS0tDQo+ICAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5oICAgICAgICAgIHwgIDQgKysr
Kw0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jICAgICAgICAgICB8
IDIwICsrKysrKysrKysrKysrKysrKystDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z21jX3Y2XzAuYyAgICAgICAgICAgIHwgMTkgKysrKysrKysrKysrKysrKysrLQ0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192N18wLmMgICAgICAgICAgICB8IDIwICsrKysrKysr
KysrKysrKysrKystDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y4XzAuYyAg
ICAgICAgICAgIHwgMjEgKysrKysrKysrKysrKysrKysrKystDQo+ICAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ21jX3Y5XzAuYyAgICAgICAgICAgIHwgMjQgKysrKysrKysrKysrKysrKysr
KysrKy0tDQo+ICAgOCBmaWxlcyBjaGFuZ2VkLCAxMDggaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRp
b25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfYW1ka2ZkLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmgN
Cj4gaW5kZXggZTUxOWRmMy4uMDI2NDc1YSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9hbWRrZmQuaA0KPiBAQCAtNTgsNiArNTgsNyBAQCBzdHJ1Y3Qga2dkX21l
bSB7DQo+ICAgCXVpbnQ2NF90IHZhOw0KPiAgIA0KPiAgIAl1aW50MzJfdCBtYXBwaW5nX2ZsYWdz
Ow0KPiArCXVpbnQzMl90IGFsbG9jX2ZsYWdzOw0KPiAgIA0KPiAgIAlhdG9taWNfdCBpbnZhbGlk
Ow0KPiAgIAlzdHJ1Y3QgYW1ka2ZkX3Byb2Nlc3NfaW5mbyAqcHJvY2Vzc19pbmZvOw0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jDQo+IGlu
ZGV4IDQ0YTUyYjAuLmY5MWVmNDggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMNCj4gQEAgLTEwODEsNyArMTA4MSw2IEBAIGlu
dCBhbWRncHVfYW1ka2ZkX2dwdXZtX2FsbG9jX21lbW9yeV9vZl9ncHUoDQo+ICAgCWludCBieXRl
X2FsaWduOw0KPiAgIAl1MzIgZG9tYWluLCBhbGxvY19kb21haW47DQo+ICAgCXU2NCBhbGxvY19m
bGFnczsNCj4gLQl1aW50MzJfdCBtYXBwaW5nX2ZsYWdzOw0KPiAgIAlpbnQgcmV0Ow0KPiAgIA0K
PiAgIAkvKg0KPiBAQCAtMTE0MywxNiArMTE0Miw3IEBAIGludCBhbWRncHVfYW1ka2ZkX2dwdXZt
X2FsbG9jX21lbW9yeV9vZl9ncHUoDQo+ICAgCQkJYWRldi0+YXNpY190eXBlICE9IENISVBfVkVH
QU0pID8NCj4gICAJCQlWSV9CT19TSVpFX0FMSUdOIDogMTsNCj4gICANCj4gLQltYXBwaW5nX2Zs
YWdzID0gQU1ER1BVX1ZNX1BBR0VfUkVBREFCTEU7DQo+IC0JaWYgKGZsYWdzICYgQUxMT0NfTUVN
X0ZMQUdTX1dSSVRBQkxFKQ0KPiAtCQltYXBwaW5nX2ZsYWdzIHw9IEFNREdQVV9WTV9QQUdFX1dS
SVRFQUJMRTsNCj4gLQlpZiAoZmxhZ3MgJiBBTExPQ19NRU1fRkxBR1NfRVhFQ1VUQUJMRSkNCj4g
LQkJbWFwcGluZ19mbGFncyB8PSBBTURHUFVfVk1fUEFHRV9FWEVDVVRBQkxFOw0KPiAtCWlmIChm
bGFncyAmIEFMTE9DX01FTV9GTEFHU19DT0hFUkVOVCkNCj4gLQkJbWFwcGluZ19mbGFncyB8PSBB
TURHUFVfVk1fTVRZUEVfVUM7DQo+IC0JZWxzZQ0KPiAtCQltYXBwaW5nX2ZsYWdzIHw9IEFNREdQ
VV9WTV9NVFlQRV9OQzsNCj4gLQkoKm1lbSktPm1hcHBpbmdfZmxhZ3MgPSBtYXBwaW5nX2ZsYWdz
Ow0KPiArCSgqbWVtKS0+YWxsb2NfZmxhZ3MgPSBmbGFnczsNCj4gICANCj4gICAJYW1kZ3B1X3N5
bmNfY3JlYXRlKCYoKm1lbSktPnN5bmMpOw0KPiAgIA0KPiBAQCAtMTI5OCw2ICsxMjg4LDcgQEAg
aW50IGFtZGdwdV9hbWRrZmRfZ3B1dm1fbWFwX21lbW9yeV90b19ncHUoDQo+ICAgCQlzdHJ1Y3Qg
a2dkX2RldiAqa2dkLCBzdHJ1Y3Qga2dkX21lbSAqbWVtLCB2b2lkICp2bSkNCj4gICB7DQo+ICAg
CXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gZ2V0X2FtZGdwdV9kZXZpY2Uoa2dkKTsNCj4g
KwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYm9fYWRldjsNCj4gICAJc3RydWN0IGFtZGdwdV92bSAq
YXZtID0gKHN0cnVjdCBhbWRncHVfdm0gKil2bTsNCj4gICAJaW50IHJldDsNCj4gICAJc3RydWN0
IGFtZGdwdV9ibyAqYm87DQo+IEBAIC0xMzE1LDYgKzEzMDYsOSBAQCBpbnQgYW1kZ3B1X2FtZGtm
ZF9ncHV2bV9tYXBfbWVtb3J5X3RvX2dwdSgNCj4gICAJCXJldHVybiAtRUlOVkFMOw0KPiAgIAl9
DQo+ICAgDQo+ICsJYm9fYWRldiA9IGFtZGdwdV90dG1fYWRldihiby0+dGJvLmJkZXYpOw0KPiAr
CW1lbS0+bWFwcGluZ19mbGFncyA9IGFtZGdwdV9nbWNfZ2V0X3ZtX21hcHBpbmdfZmxhZ3MoYWRl
diwgbWVtLT5hbGxvY19mbGFncywgYm9fYWRldiAhPSBhZGV2KTsNCj4gKw0KPiAgIAkvKiBNYWtl
IHN1cmUgcmVzdG9yZSBpcyBub3QgcnVubmluZyBjb25jdXJyZW50bHkuIFNpbmNlIHdlDQo+ICAg
CSAqIGRvbid0IG1hcCBpbnZhbGlkIHVzZXJwdHIgQk9zLCB3ZSByZWx5IG9uIHRoZSBuZXh0IHJl
c3RvcmUNCj4gICAJICogd29ya2VyIHRvIGRvIHRoZSBtYXBwaW5nDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmggYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZ21jLmgNCj4gaW5kZXggMDcxMTQ1YS4uNmJkMGMyOCAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5oDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuaA0KPiBAQCAtMTA1LDYgKzEw
NSw5IEBAIHN0cnVjdCBhbWRncHVfZ21jX2Z1bmNzIHsNCj4gICAJLyogZ2V0IHRoZSBwZGUgZm9y
IGEgZ2l2ZW4gbWMgYWRkciAqLw0KPiAgIAl2b2lkICgqZ2V0X3ZtX3BkZSkoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYsIGludCBsZXZlbCwNCj4gICAJCQkgICB1NjQgKmRzdCwgdTY0ICpmbGFn
cyk7DQo+ICsJLyogZ2V0IHBlciBhc2ljIHZtIG1hcHBpbmcgZmxhZ3MgKi8NCj4gKwl1aW50MzJf
dCAoKmdldF92bV9tYXBwaW5nX2ZsYWdzKShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4g
KwkJCXVpbnQzMl90IGFsbG9jX2ZsYWdzLCBib29sIHJlbW90ZV9tYXBwaW5nKTsNCg0KWW91J2xs
IHByb2JhYmx5IG5lZWQgbW9yZSB0aGFuIGp1c3QgYSBib29sZWFuIGZvciByZW1vdGUgbWFwcGlu
Z3MuIFRoZSANCnR5cGUgb2YgbWFwcGluZyBtYXkgYWxzbyBkZXBlbmQgb24gd2hldGhlciB0aGUg
bWFwcGluZyB1c2VzIFhHTUkgb3IgDQpQQ0llLiAoUENJZSBQMlAgaXNuJ3Qgc3VwcG9ydGVkIHVw
c3RyZWFtIHlldCwgYnV0IGl0IGlzIG9uIFJPQ20gcmVsZWFzZSANCmJyYW5jaGVzKS4gVGhlcmVm
b3JlIGl0J3MgcHJvYmFibHkgYmV0dGVyIHRvIHBhc3MgaW4gdGhlIHR3byBkZXZpY2VzIGFuZCAN
CmxldCB0aGUgZ2V0X3ZtX21hcHBpbmdfZmxhZ3MgZnVuY3Rpb24gZmlndXJlIG91dCB0aGUgZGV0
YWlscywgaW5jbHVkaW5nIA0Kd2hldGhlciBib3RoIGRldmljZXMgYXJlIGluIHRoZSBzYW1lIFhH
TUkgaGl2ZS4NCg0KUmVnYXJkcywNCiDCoCBGZWxpeA0KDQoNCj4gICB9Ow0KPiAgIA0KPiAgIHN0
cnVjdCBhbWRncHVfeGdtaSB7DQo+IEBAIC0xODUsNiArMTg4LDcgQEAgc3RydWN0IGFtZGdwdV9n
bWMgew0KPiAgICNkZWZpbmUgYW1kZ3B1X2dtY19lbWl0X3Bhc2lkX21hcHBpbmcociwgdm1pZCwg
cGFzaWQpIChyKS0+YWRldi0+Z21jLmdtY19mdW5jcy0+ZW1pdF9wYXNpZF9tYXBwaW5nKChyKSwg
KHZtaWQpLCAocGFzaWQpKQ0KPiAgICNkZWZpbmUgYW1kZ3B1X2dtY19nZXRfdm1fcGRlKGFkZXYs
IGxldmVsLCBkc3QsIGZsYWdzKSAoYWRldiktPmdtYy5nbWNfZnVuY3MtPmdldF92bV9wZGUoKGFk
ZXYpLCAobGV2ZWwpLCAoZHN0KSwgKGZsYWdzKSkNCj4gICAjZGVmaW5lIGFtZGdwdV9nbWNfZ2V0
X3B0ZV9mbGFncyhhZGV2LCBmbGFncykgKGFkZXYpLT5nbWMuZ21jX2Z1bmNzLT5nZXRfdm1fcHRl
X2ZsYWdzKChhZGV2KSwoZmxhZ3MpKQ0KPiArI2RlZmluZSBhbWRncHVfZ21jX2dldF92bV9tYXBw
aW5nX2ZsYWdzKGFkZXYsIGFsbG9jX2ZsYWdzLCByZW1vdGVfbWFwcGluZykgKChhZGV2KS0+Z21j
LmdtY19mdW5jcy0+Z2V0X3ZtX21hcHBpbmdfZmxhZ3MoKGFkZXYpLCAoYWxsb2NfZmxhZ3MpLCAo
cmVtb3RlX21hcHBpbmcpKSkNCj4gICANCj4gICAvKioNCj4gICAgKiBhbWRncHVfZ21jX3ZyYW1f
ZnVsbF92aXNpYmxlIC0gQ2hlY2sgaWYgZnVsbCBWUkFNIGlzIHZpc2libGUgdGhyb3VnaCB0aGUg
QkFSDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jDQo+IGluZGV4IDRlM2Fj
MTAuLjdlNDIwZTAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dt
Y192MTBfMC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5j
DQo+IEBAIC00MTUsMTIgKzQxNSwzMCBAQCBzdGF0aWMgdm9pZCBnbWNfdjEwXzBfZ2V0X3ZtX3Bk
ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgaW50IGxldmVsLA0KPiAgIAl9DQo+ICAgfQ0K
PiAgIA0KPiArc3RhdGljIHVpbnQzMl90IGdtY192MTBfMF9nZXRfdm1fbWFwcGluZ19mbGFncyhz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gKwkJCQl1aW50MzJfdCBhbGxvY19mbGFncywg
Ym9vbCByZW1vdGVfbWFwcGluZykNCj4gK3sNCj4gKwl1aW50MzJfdCBtYXBwaW5nX2ZsYWdzID0g
QU1ER1BVX1ZNX1BBR0VfUkVBREFCTEU7DQo+ICsNCj4gKwlpZiAoYWxsb2NfZmxhZ3MgJiBBTExP
Q19NRU1fRkxBR1NfV1JJVEFCTEUpDQo+ICsJCW1hcHBpbmdfZmxhZ3MgfD0gQU1ER1BVX1ZNX1BB
R0VfV1JJVEVBQkxFOw0KPiArCWlmIChhbGxvY19mbGFncyAmIEFMTE9DX01FTV9GTEFHU19FWEVD
VVRBQkxFKQ0KPiArCQltYXBwaW5nX2ZsYWdzIHw9IEFNREdQVV9WTV9QQUdFX0VYRUNVVEFCTEU7
DQo+ICsJaWYgKGFsbG9jX2ZsYWdzICYgQUxMT0NfTUVNX0ZMQUdTX0NPSEVSRU5UKQ0KPiArCQlt
YXBwaW5nX2ZsYWdzIHw9IEFNREdQVV9WTV9NVFlQRV9VQzsNCj4gKwllbHNlDQo+ICsJCW1hcHBp
bmdfZmxhZ3MgfD0gQU1ER1BVX1ZNX01UWVBFX05DOw0KPiArDQo+ICsJcmV0dXJuIG1hcHBpbmdf
ZmxhZ3M7DQo+ICt9DQo+ICsNCj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9nbWNfZnVu
Y3MgZ21jX3YxMF8wX2dtY19mdW5jcyA9IHsNCj4gICAJLmZsdXNoX2dwdV90bGIgPSBnbWNfdjEw
XzBfZmx1c2hfZ3B1X3RsYiwNCj4gICAJLmVtaXRfZmx1c2hfZ3B1X3RsYiA9IGdtY192MTBfMF9l
bWl0X2ZsdXNoX2dwdV90bGIsDQo+ICAgCS5lbWl0X3Bhc2lkX21hcHBpbmcgPSBnbWNfdjEwXzBf
ZW1pdF9wYXNpZF9tYXBwaW5nLA0KPiAgIAkuZ2V0X3ZtX3B0ZV9mbGFncyA9IGdtY192MTBfMF9n
ZXRfdm1fcHRlX2ZsYWdzLA0KPiAtCS5nZXRfdm1fcGRlID0gZ21jX3YxMF8wX2dldF92bV9wZGUN
Cj4gKwkuZ2V0X3ZtX3BkZSA9IGdtY192MTBfMF9nZXRfdm1fcGRlLA0KPiArCS5nZXRfdm1fbWFw
cGluZ19mbGFncyA9IGdtY192MTBfMF9nZXRfdm1fbWFwcGluZ19mbGFncw0KPiAgIH07DQo+ICAg
DQo+ICAgc3RhdGljIHZvaWQgZ21jX3YxMF8wX3NldF9nbWNfZnVuY3Moc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
bWNfdjZfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y2XzAuYw0KPiBpbmRl
eCBiMDZkODc2Li4yYjJhZjZhIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nbWNfdjZfMC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192
Nl8wLmMNCj4gQEAgLTQwNCw2ICs0MDQsMjIgQEAgc3RhdGljIHZvaWQgZ21jX3Y2XzBfZ2V0X3Zt
X3BkZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgaW50IGxldmVsLA0KPiAgIAlCVUdfT04o
KmFkZHIgJiAweEZGRkZGRjAwMDAwMDBGRkZVTEwpOw0KPiAgIH0NCj4gICANCj4gK3N0YXRpYyB1
aW50MzJfdCBnbWNfdjZfMF9nZXRfdm1fbWFwcGluZ19mbGFncyhzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwNCj4gKwkJCQl1aW50MzJfdCBhbGxvY19mbGFncywgYm9vbCByZW1vdGVfbWFwcGlu
ZykNCj4gK3sNCj4gKwl1aW50MzJfdCBtYXBwaW5nX2ZsYWdzID0gQU1ER1BVX1ZNX1BBR0VfUkVB
REFCTEU7DQo+ICsNCj4gKwlpZiAoYWxsb2NfZmxhZ3MgJiBBTExPQ19NRU1fRkxBR1NfV1JJVEFC
TEUpDQo+ICsJCW1hcHBpbmdfZmxhZ3MgfD0gQU1ER1BVX1ZNX1BBR0VfV1JJVEVBQkxFOw0KPiAr
CWlmIChhbGxvY19mbGFncyAmIEFMTE9DX01FTV9GTEFHU19FWEVDVVRBQkxFKQ0KPiArCQltYXBw
aW5nX2ZsYWdzIHw9IEFNREdQVV9WTV9QQUdFX0VYRUNVVEFCTEU7DQo+ICsJaWYgKGFsbG9jX2Zs
YWdzICYgQUxMT0NfTUVNX0ZMQUdTX0NPSEVSRU5UKQ0KPiArCQltYXBwaW5nX2ZsYWdzIHw9IEFN
REdQVV9WTV9NVFlQRV9VQzsNCj4gKwllbHNlDQo+ICsJCW1hcHBpbmdfZmxhZ3MgfD0gQU1ER1BV
X1ZNX01UWVBFX05DOw0KPiArDQo+ICsJcmV0dXJuIG1hcHBpbmdfZmxhZ3M7DQo+ICt9DQo+ICAg
c3RhdGljIHZvaWQgZ21jX3Y2XzBfc2V0X2ZhdWx0X2VuYWJsZV9kZWZhdWx0KHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LA0KPiAgIAkJCQkJICAgICAgYm9vbCB2YWx1ZSkNCj4gICB7DQo+IEBA
IC0xMTU3LDcgKzExNzMsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9nbWNfZnVuY3Mg
Z21jX3Y2XzBfZ21jX2Z1bmNzID0gew0KPiAgIAkuZW1pdF9mbHVzaF9ncHVfdGxiID0gZ21jX3Y2
XzBfZW1pdF9mbHVzaF9ncHVfdGxiLA0KPiAgIAkuc2V0X3BydCA9IGdtY192Nl8wX3NldF9wcnQs
DQo+ICAgCS5nZXRfdm1fcGRlID0gZ21jX3Y2XzBfZ2V0X3ZtX3BkZSwNCj4gLQkuZ2V0X3ZtX3B0
ZV9mbGFncyA9IGdtY192Nl8wX2dldF92bV9wdGVfZmxhZ3MNCj4gKwkuZ2V0X3ZtX3B0ZV9mbGFn
cyA9IGdtY192Nl8wX2dldF92bV9wdGVfZmxhZ3MsDQo+ICsJLmdldF92bV9tYXBwaW5nX2ZsYWdz
ID0gZ21jX3Y2XzBfZ2V0X3ZtX21hcHBpbmdfZmxhZ3MNCj4gICB9Ow0KPiAgIA0KPiAgIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X2lycV9zcmNfZnVuY3MgZ21jX3Y2XzBfaXJxX2Z1bmNzID0g
ew0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y3XzAuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192N18wLmMNCj4gaW5kZXggNzVhYTMzMy4u
NjE5ODYyZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y3
XzAuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjdfMC5jDQo+IEBA
IC00ODEsNiArNDgxLDIzIEBAIHN0YXRpYyB2b2lkIGdtY192N18wX2dldF92bV9wZGUoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGludCBsZXZlbCwNCj4gICAJQlVHX09OKCphZGRyICYgMHhG
RkZGRkYwMDAwMDAwRkZGVUxMKTsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMgdWludDMyX3QgZ21j
X3Y3XzBfZ2V0X3ZtX21hcHBpbmdfZmxhZ3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+
ICsJCQkJdWludDMyX3QgYWxsb2NfZmxhZ3MsIGJvb2wgcmVtb3RlX21hcHBpbmcpDQo+ICt7DQo+
ICsJdWludDMyX3QgbWFwcGluZ19mbGFncyA9IEFNREdQVV9WTV9QQUdFX1JFQURBQkxFOw0KPiAr
DQo+ICsJaWYgKGFsbG9jX2ZsYWdzICYgQUxMT0NfTUVNX0ZMQUdTX1dSSVRBQkxFKQ0KPiArCQlt
YXBwaW5nX2ZsYWdzIHw9IEFNREdQVV9WTV9QQUdFX1dSSVRFQUJMRTsNCj4gKwlpZiAoYWxsb2Nf
ZmxhZ3MgJiBBTExPQ19NRU1fRkxBR1NfRVhFQ1VUQUJMRSkNCj4gKwkJbWFwcGluZ19mbGFncyB8
PSBBTURHUFVfVk1fUEFHRV9FWEVDVVRBQkxFOw0KPiArCWlmIChhbGxvY19mbGFncyAmIEFMTE9D
X01FTV9GTEFHU19DT0hFUkVOVCkNCj4gKwkJbWFwcGluZ19mbGFncyB8PSBBTURHUFVfVk1fTVRZ
UEVfVUM7DQo+ICsJZWxzZQ0KPiArCQltYXBwaW5nX2ZsYWdzIHw9IEFNREdQVV9WTV9NVFlQRV9O
QzsNCj4gKw0KPiArCXJldHVybiBtYXBwaW5nX2ZsYWdzOw0KPiArfQ0KPiArDQo+ICAgLyoqDQo+
ICAgICogZ21jX3Y4XzBfc2V0X2ZhdWx0X2VuYWJsZV9kZWZhdWx0IC0gdXBkYXRlIFZNIGZhdWx0
IGhhbmRsaW5nDQo+ICAgICoNCj4gQEAgLTEzNTMsNyArMTM3MCw4IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgYW1kZ3B1X2dtY19mdW5jcyBnbWNfdjdfMF9nbWNfZnVuY3MgPSB7DQo+ICAgCS5lbWl0
X3Bhc2lkX21hcHBpbmcgPSBnbWNfdjdfMF9lbWl0X3Bhc2lkX21hcHBpbmcsDQo+ICAgCS5zZXRf
cHJ0ID0gZ21jX3Y3XzBfc2V0X3BydCwNCj4gICAJLmdldF92bV9wdGVfZmxhZ3MgPSBnbWNfdjdf
MF9nZXRfdm1fcHRlX2ZsYWdzLA0KPiAtCS5nZXRfdm1fcGRlID0gZ21jX3Y3XzBfZ2V0X3ZtX3Bk
ZQ0KPiArCS5nZXRfdm1fcGRlID0gZ21jX3Y3XzBfZ2V0X3ZtX3BkZSwNCj4gKwkuZ2V0X3ZtX21h
cHBpbmdfZmxhZ3MgPSBnbWNfdjdfMF9nZXRfdm1fbWFwcGluZ19mbGFncw0KPiAgIH07DQo+ICAg
DQo+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfaXJxX3NyY19mdW5jcyBnbWNfdjdfMF9p
cnFfZnVuY3MgPSB7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
bWNfdjhfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y4XzAuYw0KPiBpbmRl
eCA4YmYyYmEzLi5kMmNlY2IzMCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ21jX3Y4XzAuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNf
djhfMC5jDQo+IEBAIC03MDYsNiArNzA2LDI0IEBAIHN0YXRpYyB2b2lkIGdtY192OF8wX2dldF92
bV9wZGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGludCBsZXZlbCwNCj4gICAJQlVHX09O
KCphZGRyICYgMHhGRkZGRkYwMDAwMDAwRkZGVUxMKTsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMg
dWludDMyX3QgZ21jX3Y4XzBfZ2V0X3ZtX21hcHBpbmdfZmxhZ3Moc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsDQo+ICsJCQkJdWludDMyX3QgYWxsb2NfZmxhZ3MsIGJvb2wgcmVtb3RlX21hcHBp
bmcpDQo+ICt7DQo+ICsJdWludDMyX3QgbWFwcGluZ19mbGFncyA9IEFNREdQVV9WTV9QQUdFX1JF
QURBQkxFOw0KPiArDQo+ICsJaWYgKGFsbG9jX2ZsYWdzICYgQUxMT0NfTUVNX0ZMQUdTX1dSSVRB
QkxFKQ0KPiArCQltYXBwaW5nX2ZsYWdzIHw9IEFNREdQVV9WTV9QQUdFX1dSSVRFQUJMRTsNCj4g
KwlpZiAoYWxsb2NfZmxhZ3MgJiBBTExPQ19NRU1fRkxBR1NfRVhFQ1VUQUJMRSkNCj4gKwkJbWFw
cGluZ19mbGFncyB8PSBBTURHUFVfVk1fUEFHRV9FWEVDVVRBQkxFOw0KPiArCWlmIChhbGxvY19m
bGFncyAmIEFMTE9DX01FTV9GTEFHU19DT0hFUkVOVCkNCj4gKwkJbWFwcGluZ19mbGFncyB8PSBB
TURHUFVfVk1fTVRZUEVfVUM7DQo+ICsJZWxzZQ0KPiArCQltYXBwaW5nX2ZsYWdzIHw9IEFNREdQ
VV9WTV9NVFlQRV9OQzsNCj4gKw0KPiArCXJldHVybiBtYXBwaW5nX2ZsYWdzOw0KPiArfQ0KPiAr
DQo+ICsNCj4gICAvKioNCj4gICAgKiBnbWNfdjhfMF9zZXRfZmF1bHRfZW5hYmxlX2RlZmF1bHQg
LSB1cGRhdGUgVk0gZmF1bHQgaGFuZGxpbmcNCj4gICAgKg0KPiBAQCAtMTcyMSw3ICsxNzM5LDgg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfZ21jX2Z1bmNzIGdtY192OF8wX2dtY19mdW5j
cyA9IHsNCj4gICAJLmVtaXRfcGFzaWRfbWFwcGluZyA9IGdtY192OF8wX2VtaXRfcGFzaWRfbWFw
cGluZywNCj4gICAJLnNldF9wcnQgPSBnbWNfdjhfMF9zZXRfcHJ0LA0KPiAgIAkuZ2V0X3ZtX3B0
ZV9mbGFncyA9IGdtY192OF8wX2dldF92bV9wdGVfZmxhZ3MsDQo+IC0JLmdldF92bV9wZGUgPSBn
bWNfdjhfMF9nZXRfdm1fcGRlDQo+ICsJLmdldF92bV9wZGUgPSBnbWNfdjhfMF9nZXRfdm1fcGRl
LA0KPiArCS5nZXRfdm1fbWFwcGluZ19mbGFncyA9IGdtY192OF8wX2dldF92bV9tYXBwaW5nX2Zs
YWdzDQo+ICAgfTsNCj4gICANCj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9pcnFfc3Jj
X2Z1bmNzIGdtY192OF8wX2lycV9mdW5jcyA9IHsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
bWNfdjlfMC5jDQo+IGluZGV4IDg5MDY0ZDkuLmFkYWQ3YzQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ21jX3Y5XzAuYw0KPiBAQCAtNjY3LDEyICs2NjcsMzEgQEAgc3RhdGljIHZv
aWQgZ21jX3Y5XzBfZ2V0X3ZtX3BkZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgaW50IGxl
dmVsLA0KPiAgIAl9DQo+ICAgfQ0KPiAgIA0KPiArc3RhdGljIHVpbnQzMl90IGdtY192OV8wX2dl
dF92bV9tYXBwaW5nX2ZsYWdzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiArCQkJCXVp
bnQzMl90IGFsbG9jX2ZsYWdzLCBib29sIHJlbW90ZV9tYXBwaW5nKQ0KPiArew0KPiArCXVpbnQz
Ml90IG1hcHBpbmdfZmxhZ3MgPSBBTURHUFVfVk1fUEFHRV9SRUFEQUJMRTsNCj4gKw0KPiArCWlm
IChhbGxvY19mbGFncyAmIEFMTE9DX01FTV9GTEFHU19XUklUQUJMRSkNCj4gKwkJbWFwcGluZ19m
bGFncyB8PSBBTURHUFVfVk1fUEFHRV9XUklURUFCTEU7DQo+ICsJaWYgKGFsbG9jX2ZsYWdzICYg
QUxMT0NfTUVNX0ZMQUdTX0VYRUNVVEFCTEUpDQo+ICsJCW1hcHBpbmdfZmxhZ3MgfD0gQU1ER1BV
X1ZNX1BBR0VfRVhFQ1VUQUJMRTsNCj4gKwlpZiAoYWxsb2NfZmxhZ3MgJiBBTExPQ19NRU1fRkxB
R1NfQ09IRVJFTlQpDQo+ICsJCW1hcHBpbmdfZmxhZ3MgfD0gQU1ER1BVX1ZNX01UWVBFX1VDOw0K
PiArCWVsc2UNCj4gKwkJbWFwcGluZ19mbGFncyB8PSBBTURHUFVfVk1fTVRZUEVfTkM7DQo+ICsN
Cj4gKwlyZXR1cm4gbWFwcGluZ19mbGFnczsNCj4gK30NCj4gKw0KPiArDQo+ICAgc3RhdGljIGNv
bnN0IHN0cnVjdCBhbWRncHVfZ21jX2Z1bmNzIGdtY192OV8wX2dtY19mdW5jcyA9IHsNCj4gICAJ
LmZsdXNoX2dwdV90bGIgPSBnbWNfdjlfMF9mbHVzaF9ncHVfdGxiLA0KPiAgIAkuZW1pdF9mbHVz
aF9ncHVfdGxiID0gZ21jX3Y5XzBfZW1pdF9mbHVzaF9ncHVfdGxiLA0KPiAgIAkuZW1pdF9wYXNp
ZF9tYXBwaW5nID0gZ21jX3Y5XzBfZW1pdF9wYXNpZF9tYXBwaW5nLA0KPiAgIAkuZ2V0X3ZtX3B0
ZV9mbGFncyA9IGdtY192OV8wX2dldF92bV9wdGVfZmxhZ3MsDQo+IC0JLmdldF92bV9wZGUgPSBn
bWNfdjlfMF9nZXRfdm1fcGRlDQo+ICsJLmdldF92bV9wZGUgPSBnbWNfdjlfMF9nZXRfdm1fcGRl
LA0KPiArCS5nZXRfdm1fbWFwcGluZ19mbGFncyA9IGdtY192OV8wX2dldF92bV9tYXBwaW5nX2Zs
YWdzDQo+ICAgfTsNCj4gICANCj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9nbWNfZnVu
Y3MgZ21jX3Y5XzBfYXJjdHVydXNfZ21jX2Z1bmNzID0gew0KPiBAQCAtNjgwLDcgKzY5OSw4IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X2dtY19mdW5jcyBnbWNfdjlfMF9hcmN0dXJ1c19n
bWNfZnVuY3MgPSB7DQo+ICAgCS5lbWl0X2ZsdXNoX2dwdV90bGIgPSBnbWNfdjlfMF9lbWl0X2Zs
dXNoX2dwdV90bGIsDQo+ICAgCS5lbWl0X3Bhc2lkX21hcHBpbmcgPSBnbWNfdjlfMF9lbWl0X3Bh
c2lkX21hcHBpbmcsDQo+ICAgCS5nZXRfdm1fcHRlX2ZsYWdzID0gZ21jX3Y5XzBfYXJjdHVydXNf
Z2V0X3ZtX3B0ZV9mbGFncywNCj4gLQkuZ2V0X3ZtX3BkZSA9IGdtY192OV8wX2dldF92bV9wZGUN
Cj4gKwkuZ2V0X3ZtX3BkZSA9IGdtY192OV8wX2dldF92bV9wZGUsDQo+ICsJLmdldF92bV9tYXBw
aW5nX2ZsYWdzID0gZ21jX3Y5XzBfZ2V0X3ZtX21hcHBpbmdfZmxhZ3MNCj4gICB9Ow0KPiAgIA0K
PiAgIHN0YXRpYyB2b2lkIGdtY192OV8wX3NldF9nbWNfZnVuY3Moc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYpDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
