Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB08DA3F3C
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Aug 2019 22:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B0076E0E4;
	Fri, 30 Aug 2019 20:59:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730051.outbound.protection.outlook.com [40.107.73.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162EE6E0E4
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Aug 2019 20:59:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ocCMyUs6h6QCub+kHYBwnaPBIefVQ63yqj48qLD0c1dy5lLNMOz2YMXcrciHwjNARaBz+Q7jmqCgqNhB7JiyBXuR7RvSgr5HMFzCEmZnWKV+e6PaB9d7QRodHAQmzR67Lj0y1JRA7WctkYEHsx/g67OxNexAtYcOAatAdudZbHLdSmfbYI1Pkh7fGmcPUw/eB3dTaxAInXIx6SPMl6aZ8oLNEF8Wsk2O+DogaPDtnaU3QvbaTpkrEycW+U7L/dgNJPEYSxl8yWEC1GDAyK97ZPVvuAtwoxGOxc4ftHcUEY0eGsrxdeBibQnVOCYOuMxnbik6ly6SnnwbWZHa+LG3AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hc1Ti0UambBHejoRpAQOOn268GkOFDuHDZ86S2n6Hko=;
 b=e4VNqL5ntekZLyzSSiMzjzKF8lvZtlIHfUA8Fe3XCV86CG2EJI5eLMdQXj0NYob/Ka4CboHcneYElCWHait4HmmKVXMQN1qAKyHght3wQ/j0bxchse/jGMKUamlzxzWzwpE1ifZ6cp0bo1Nsbanp2196kUiUDUwD5KupXsVDCMFirahxW7ifN4TF86ly6343mH0Tow5FN1o5uokBLoOMClpf+IwAh5hVR6SyFFH8cc7zBSKG4UEmGpvqRlL8HualOay/SNqXYN9UwteNKJCAshh1aj1GvqCoTJNbHUVliLqdrAIJ0k+9AYdmIJdreD+Riwnzmn+8Zx2FvWnWApeiGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3241.namprd12.prod.outlook.com (20.179.105.153) by
 DM6PR12MB3306.namprd12.prod.outlook.com (20.179.106.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.19; Fri, 30 Aug 2019 20:59:30 +0000
Received: from DM6PR12MB3241.namprd12.prod.outlook.com
 ([fe80::886d:5fcf:13be:8c58]) by DM6PR12MB3241.namprd12.prod.outlook.com
 ([fe80::886d:5fcf:13be:8c58%6]) with mapi id 15.20.2199.021; Fri, 30 Aug 2019
 20:59:30 +0000
From: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 4/4] drm/amdgpu: Use optimal mtypes and PTE bits for
 Arcturus
Thread-Topic: [PATCH 4/4] drm/amdgpu: Use optimal mtypes and PTE bits for
 Arcturus
Thread-Index: AQHVXGMDHwbiNLtwOUanXcIJTRfIrqcUMtkA
Date: Fri, 30 Aug 2019 20:59:29 +0000
Message-ID: <f907eff1-a056-aa99-2214-169319461f00@amd.com>
References: <20190826230355.25007-1-Felix.Kuehling@amd.com>
 <20190826230355.25007-4-Felix.Kuehling@amd.com>
In-Reply-To: <20190826230355.25007-4-Felix.Kuehling@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTBPR01CA0004.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::17) To DM6PR12MB3241.namprd12.prod.outlook.com
 (2603:10b6:5:186::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1a5a29e-f66d-42e5-629f-08d72d8cf34d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3306; 
x-ms-traffictypediagnostic: DM6PR12MB3306:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3306F93B66E6F7C63824A0B8F4BD0@DM6PR12MB3306.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-forefront-prvs: 0145758B1D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(376002)(39860400002)(136003)(396003)(199004)(189003)(25786009)(305945005)(6116002)(3846002)(31686004)(71200400001)(71190400001)(66066001)(65806001)(65956001)(14444005)(6246003)(2906002)(486006)(4326008)(256004)(102836004)(386003)(6506007)(53546011)(86362001)(5660300002)(2616005)(476003)(76176011)(11346002)(52116002)(99286004)(229853002)(6486002)(6436002)(53936002)(186003)(8936002)(8676002)(81156014)(81166006)(6512007)(14454004)(36756003)(446003)(2501003)(58126008)(110136005)(54906003)(66476007)(64756008)(316002)(66556008)(66946007)(66446008)(26005)(31696002)(7736002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3306;
 H:DM6PR12MB3241.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nyaJCqXFafw8CPwJU9IisZvttfXyB7eMgSaMvFKQqd/DnWiLdasX+0Op4arkgn7mfGipo4s5cpcA1NBorgZPTntOrzoYIrjbDtd8tCQZoe5eTCpwvCJNYfcfzOG/tDtfO8Z44S2hZDsnE3KrL4131MsXp+M3Ws+wpQWduOZuKXCHWsL4JPcsWv0OhBR8ofGMWo38/qbStqjmk7SLIyUcKLqkh1b2EgLfzsc7HeOO+A681q5VB91ln2G6hKOjVvYE7ipk4JO4do2NuW2DduMPTRm+LqnfzvGACrpbNYULyQI9s8g4j0KYEp1CJcR3enbDDNohFnzErO0zbkiBi9DRbAa94EOO+NZz9QYhD+XNKQSwZ5WfORtY1DG6VlfJ4yBHDQsWQOdRcWJ/9+bVlLt8qec9vivKNexzJUeq3WXlTao=
Content-ID: <4B064A16CF7CDF4E86750EF0D410FD0A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a5a29e-f66d-42e5-629f-08d72d8cf34d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2019 20:59:29.9119 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KAtXxn9pDr0W1+4mBIkNeFtcW84hTJAjAA9AtrcCUzCJlRudT1OTUlvmm/jFN0G0ij5He+6B7+d2IygSwTMJcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3306
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hc1Ti0UambBHejoRpAQOOn268GkOFDuHDZ86S2n6Hko=;
 b=3R/IS1W0fQ/UXVJNT8GowwmlQCNIoNxLyFSxK2UBXiNYMnl3GMCyF0MnnEbJbs3EbzidNbOqzbG0tO/XnS1R/Tcm/EFXwoNTq5vbavzr2Oq018VuPbvV4wu7qOdtRIr8tUCsO5kJNEYep9uuRYOtDwYtrAYhEKx3YyvRkhpqfzM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Shaoyun.Liu@amd.com; 
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
Cc: "Zeng, Oak" <Oak.Zeng@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2VyaWFscyBhcmUgcmV2aWV3ZWQgYnkgOsKgIHNoYW95dW5sIDxTaGFveXVuLkxpdUBhbWQuY29t
Pg0KDQpMb29rcyBsaWtlIGEgbGl0dGxlIGJpdCBjb25mdXNpbmcgdGhhdCB3ZSBoYXZlwqAgdHdv
IHBsYWNlIGZvciB0aGUgcHRlIA0KZmxhZ3MgLsKgIGdldF9wdGVfZmxhZ3PCoCBhbHJlYWR5IGdl
dCBhc2ljIHNwZWNpZmljIG1hcHBpbmcgZmxhZ3PCoCBhbmTCoCANCmluc2lkZSBhbWRncHVfdm1f
Ym9fc3BsaXRfbWFwcGluZyAsIGRyaXZlciBhZGp1c3QgdGhlIHJlYWwgSFcgbWFwcGluZyANCmZs
YWdzIGFnYWluIC7CoCBNYXliZcKgIGJldHRlciBqdXN0IGtlZXAgdGhlIGxvZ2ljIGluIG9uZSBw
bGFjZSBpbiB0aGUgDQpmdXR1cmUgLg0KDQoNClJlZ2FyZHMNCg0Kc2hhb3l1bi5saXUNCg0KDQoN
Ck9uIDIwMTktMDgtMjYgNzowNyBwLm0uLCBLdWVobGluZywgRmVsaXggd3JvdGU6DQo+IEZvciBj
b21wdXRlIFZSQU0gYWxsb2NhdGlvbnMgb24gQXJ0dXJ1cyB1c2UgdGhlIG5ldyBSVyBtdHlwZQ0K
PiBmb3Igbm9uLWNvaGVyZW50IGxvY2FsIG1lbW9yeSwgQ0MgbXR5cGUgZm9yIGNvaGVyZW50IGxv
Y2FsDQo+IG1lbW9yeSBhbmQgUFRFX1NOT09QRUQgYml0IGZvciBpbnZhbGlkYXRpbmcgbm9uLWRp
cnR5IGNhY2hlDQo+IGxpbmVzIG9uIHJlbW90ZSBYR01JIG1hcHBpbmdzLg0KPg0KPiBTaWduZWQt
b2ZmLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCj4gLS0tDQo+
ICAgLi4uL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMgIHwgMjAgKysr
KysrKysrKysrKysrKystLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92
bS5jICAgICAgICB8ICA0ICsrKysNCj4gICAyIGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMNCj4gaW5kZXggMWI3MzQwYTE4ZjY3Li5jNWMxOGUyOTJh
ZTMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRr
ZmRfZ3B1dm0uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1k
a2ZkX2dwdXZtLmMNCj4gQEAgLTM1Nyw2ICszNTcsNyBAQCBzdGF0aWMgaW50IHZtX3VwZGF0ZV9w
ZHMoc3RydWN0IGFtZGdwdV92bSAqdm0sIHN0cnVjdCBhbWRncHVfc3luYyAqc3luYykNCj4gICAN
Cj4gICBzdGF0aWMgdWludDMyX3QgZ2V0X3B0ZV9mbGFncyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiwgc3RydWN0IGtnZF9tZW0gKm1lbSkNCj4gICB7DQo+ICsJc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmJvX2FkZXYgPSBhbWRncHVfdHRtX2FkZXYobWVtLT5iby0+dGJvLmJkZXYpOw0KPiAgIAli
b29sIGNvaGVyZW50ID0gbWVtLT5hbGxvY19mbGFncyAmIEFMTE9DX01FTV9GTEFHU19DT0hFUkVO
VDsNCj4gICAJdWludDMyX3QgbWFwcGluZ19mbGFnczsNCj4gICANCj4gQEAgLTM2Niw4ICszNjcs
MjMgQEAgc3RhdGljIHVpbnQzMl90IGdldF9wdGVfZmxhZ3Moc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsIHN0cnVjdCBrZ2RfbWVtICptZW0pDQo+ICAgCWlmIChtZW0tPmFsbG9jX2ZsYWdzICYg
QUxMT0NfTUVNX0ZMQUdTX0VYRUNVVEFCTEUpDQo+ICAgCQltYXBwaW5nX2ZsYWdzIHw9IEFNREdQ
VV9WTV9QQUdFX0VYRUNVVEFCTEU7DQo+ICAgDQo+IC0JbWFwcGluZ19mbGFncyB8PSBjb2hlcmVu
dCA/DQo+IC0JCUFNREdQVV9WTV9NVFlQRV9VQyA6IEFNREdQVV9WTV9NVFlQRV9OQzsNCj4gKwlz
d2l0Y2ggKGFkZXYtPmFzaWNfdHlwZSkgew0KPiArCWNhc2UgQ0hJUF9BUkNUVVJVUzoNCj4gKwkJ
aWYgKG1lbS0+YWxsb2NfZmxhZ3MgJiBBTExPQ19NRU1fRkxBR1NfVlJBTSkgew0KPiArCQkJaWYg
KGJvX2FkZXYgPT0gYWRldikNCj4gKwkJCQltYXBwaW5nX2ZsYWdzIHw9IGNvaGVyZW50ID8NCj4g
KwkJCQkJQU1ER1BVX1ZNX01UWVBFX0NDIDogQU1ER1BVX1ZNX01UWVBFX1JXOw0KPiArCQkJZWxz
ZQ0KPiArCQkJCW1hcHBpbmdfZmxhZ3MgfD0gQU1ER1BVX1ZNX01UWVBFX1VDOw0KPiArCQl9IGVs
c2Ugew0KPiArCQkJbWFwcGluZ19mbGFncyB8PSBjb2hlcmVudCA/DQo+ICsJCQkJQU1ER1BVX1ZN
X01UWVBFX1VDIDogQU1ER1BVX1ZNX01UWVBFX05DOw0KPiArCQl9DQo+ICsJCWJyZWFrOw0KPiAr
CWRlZmF1bHQ6DQo+ICsJCW1hcHBpbmdfZmxhZ3MgfD0gY29oZXJlbnQgPw0KPiArCQkJQU1ER1BV
X1ZNX01UWVBFX1VDIDogQU1ER1BVX1ZNX01UWVBFX05DOw0KPiArCX0NCj4gICANCj4gICAJcmV0
dXJuIGFtZGdwdV9nbWNfZ2V0X3B0ZV9mbGFncyhhZGV2LCBtYXBwaW5nX2ZsYWdzKTsNCj4gICB9
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jDQo+IGluZGV4IDdkZGNhM2Vl
YjZjZi4uMTg5YWQ1Njk5OTQ2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdm0uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdm0uYw0KPiBAQCAtMTU5Miw2ICsxNTkyLDEwIEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZtX2Jv
X3NwbGl0X21hcHBpbmcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICAgCQl9DQo+ICAg
CQlmbGFncyAmPSB+QU1ER1BVX1BURV9WQUxJRDsNCj4gICAJfQ0KPiArCWlmIChhZGV2LT5hc2lj
X3R5cGUgPT0gQ0hJUF9BUkNUVVJVUyAmJg0KPiArCSAgICAhKGZsYWdzICYgQU1ER1BVX1BURV9T
WVNURU0pICYmDQo+ICsJICAgIG1hcHBpbmctPmJvX3ZhLT5pc194Z21pKQ0KPiArCQlmbGFncyB8
PSBBTURHUFVfUFRFX1NOT09QRUQ7DQo+ICAgDQo+ICAgCXRyYWNlX2FtZGdwdV92bV9ib191cGRh
dGUobWFwcGluZyk7DQo+ICAgDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
