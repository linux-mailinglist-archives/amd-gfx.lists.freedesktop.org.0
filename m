Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8EB9D925
	for <lists+amd-gfx@lfdr.de>; Tue, 27 Aug 2019 00:32:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5795E89C0D;
	Mon, 26 Aug 2019 22:32:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740050.outbound.protection.outlook.com [40.107.74.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE99089C0D
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 22:32:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZyCXlosyAzyP1ZcDYUncic7CEKR7GtfDZn0tR+M5m12HcqgWFdSBnm2prxXVFedLUqpQLtk7ncrxMKbVP+8vwchyVpeXjO6c1Y2hJhLDXZR4d1dBWYlgLrkX2njMhQhmSzkeZsD6KIq3ESmpi3mJwpr8OGABGVyCX3TdJAcn7h6WltDslByttodkcb4DbTiRPWI6IWz2Nb1K9cD4l7bsTBAtwbGJJ++RV37eiMwfgCJKRlmIALOrULCd4PZnBr3qliB3esB2rcTYTBp95ncPwe831kE10iDbN8J9zS0gSaZ81a6pRyajHEyEdYat5H+3ye9AGysWoTuBiMOFIz7aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AcIiGdFTJqPZengX0jClU8Tubfmic5AJ2/MVstlaLU=;
 b=YkuRfeG6htG/8yuqC+vWWAHIjDOiyBhYjIREOTSRWkIFrIeLwtqHdedjXTJLzHsc2GVrc5OvIRmVO2abtgzlaccAFfsNP1y58R+N+4qNQ0BuKXjx7julDNS3lexxBXT5/5H6khznpwv5lJkMMlnxrwHCF3XyBmvag4ffTI6+bBEMS3t3bM9IVcW9OEGH2Tr3rPPyTyvoA1gk7lMpQ/eqBOFbCE2SDhzsEuw2NiRlfJVB/yNpXVv8RzobAxknpCZLVcxfP7X1nQsWIndrh7UEIjBJgZWYpX0KqGK0auSXuU3xbTjuS2yk1QxdzHDEL5+Qo9qLEMRkydzL6o8WWeT7lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3564.namprd12.prod.outlook.com (20.178.199.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 22:32:25 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 22:32:25 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/amdgpu: Support snooped PTE flag
Thread-Topic: [PATCH 3/4] drm/amdgpu: Support snooped PTE flag
Thread-Index: AQHVWfpyCsVjPVucSk2VZpnIFr9zeacKJd+AgABW24CAACt4AIAC7oOAgAAZWoCAAA0gAIAAAnyAgABIooA=
Date: Mon, 26 Aug 2019 22:32:25 +0000
Message-ID: <bd1f6713-ae1a-37fd-3996-3bdc9c7223d8@amd.com>
References: <20190823213249.10749-1-Felix.Kuehling@amd.com>
 <20190823213249.10749-4-Felix.Kuehling@amd.com>
 <f09e6893-347b-4ade-76e5-ad37d8e4e782@gmail.com>
 <a7f9ad48-2e46-5415-e2a8-1738a101d716@amd.com>
 <96b6ac1d-de87-3fdb-a531-af4b0a42f1d5@gmail.com>
 <4b48fc1a-6ee2-bb60-0518-ea9c6346b8d6@amd.com>
 <89bf5baa-4b63-e40a-7995-fa35bad988b7@amd.com>
 <216f63db-78c5-1098-bea5-2f379b0bf051@amd.com>
 <49ba47da-a225-5a21-9014-ccc316c55b60@amd.com>
In-Reply-To: <49ba47da-a225-5a21-9014-ccc316c55b60@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTXPR0101CA0070.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::47) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f4ee922d-0e97-48c7-31b4-08d72a7544b5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3564; 
x-ms-traffictypediagnostic: DM6PR12MB3564:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3564DC39660046D584D08DBC92A10@DM6PR12MB3564.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(396003)(346002)(366004)(51914003)(189003)(199004)(478600001)(65806001)(65956001)(25786009)(66066001)(2501003)(31686004)(66476007)(7736002)(305945005)(2616005)(486006)(476003)(66946007)(8676002)(66556008)(66446008)(64756008)(81156014)(81166006)(36756003)(31696002)(14454004)(316002)(58126008)(110136005)(53936002)(6116002)(8936002)(6486002)(99286004)(53546011)(6512007)(6246003)(2906002)(386003)(76176011)(71200400001)(71190400001)(86362001)(4326008)(102836004)(186003)(11346002)(446003)(26005)(52116002)(6436002)(5660300002)(256004)(6506007)(229853002)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3564;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: S68XnI2w4MNy20L/oCk+G9oBk+G/FyiKZhAO65TUylcMOhQ8GOIUGH4ZfZNa9xNj4844Yk1sfo8sHSH/8sfo12SKbM6pPGV0LRFbUI4WqsADc2004M4wGRqu0suaORqu3zHkKEZbyoA9eLAg/f5S4W8IulNpBfJWe3k9916gjK97jFCfqEpRSmRUPI3xo8WStmYIBJQzfBhAe39T3u3EYgPdIe7MjCkHJ015ERcymF1WOLldZmWwvjCpwYKa1J2fh4olAHOxJuLjEV3UeHS6AShsdj/nWtXEkukCS1jFaEOWTzrQzsD+/lMyBWguIAAYXR3DwARYGdA9LhZGtYvciQzbuao+FGJBkpmWfz1bHQFK30U4tDgHJtSCJoX8T6FCXFFjGHnm9NcLlpCmdhqWU4cL41fe7eAzCY5JdxEu8i0=
Content-ID: <CCACC782BFA6244E9C2DF20ED8858B5A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4ee922d-0e97-48c7-31b4-08d72a7544b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 22:32:25.1008 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Z7NaXK4ya3suaokReLr2ymYdS5fZ39UWLo6+X4cph875ZEYS6jZYxbahVDid1qGMx00E2Gp425dI62+gMWibQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3564
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AcIiGdFTJqPZengX0jClU8Tubfmic5AJ2/MVstlaLU=;
 b=HdfJ/4w0UARD0+ob9WnNlfwDO8ZtJ1V2zKQoRcbsowQ0nC4u7qF4VVGpXhm7LpkonIDYRCvOM3WdJ9lOe2bUVayNygzfPbiiMdcIRQbCBgSJ0LaFxCy1aztxzVw/8oUz5xnTVrtZZJyUouwjefeFMe9abAuW/6WCwG8KdPAlEQY=
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
Cc: "Zeng, Oak" <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wOC0yNiAyOjEyIHAubS4sIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOg0KPg0KPiBX
ZSBzaG91bGQgcHJvYmFibHkganVzdCByZXZlcnQgYmFjayB0aGUgdG8gZG9pbmcgbW9zdCBvZiB0
aGUgbWFwcGluZyBpbg0KPiBhbWRncHVfdm1fYm9fc3BsaXRfbWFwcGluZygpLg0KPg0KPiBIZXJl
IHdlIGFscmVhZHkgaGF2ZSBhIHdob2xlIGJ1bmNoIG9mIEFTSUMgc3BlY2lmaWMgaGFuZGxpbmcg
YW55d2F5Og0KPg0KPj4gIMKgwqDCoMKgwqDCoMKgIGlmICghKG1hcHBpbmctPmZsYWdzICYgQU1E
R1BVX1BURV9SRUFEQUJMRSkpDQo+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZs
YWdzICY9IH5BTURHUFVfUFRFX1JFQURBQkxFOw0KPj4gIMKgwqDCoMKgwqDCoMKgIGlmICghKG1h
cHBpbmctPmZsYWdzICYgQU1ER1BVX1BURV9XUklURUFCTEUpKQ0KPj4gIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBmbGFncyAmPSB+QU1ER1BVX1BURV9XUklURUFCTEU7DQo+Pg0KPj4g
IMKgwqDCoMKgwqDCoMKgIGZsYWdzICY9IH5BTURHUFVfUFRFX0VYRUNVVEFCTEU7DQo+PiAgwqDC
oMKgwqDCoMKgwqAgZmxhZ3MgfD0gbWFwcGluZy0+ZmxhZ3MgJiBBTURHUFVfUFRFX0VYRUNVVEFC
TEU7DQo+Pg0KPj4gIMKgwqDCoMKgwqDCoMKgIGlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9O
QVZJMTApIHsNCj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmxhZ3MgJj0gfkFN
REdQVV9QVEVfTVRZUEVfTlYxMF9NQVNLOw0KPj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBmbGFncyB8PSAobWFwcGluZy0+ZmxhZ3MgJiBBTURHUFVfUFRFX01UWVBFX05WMTBfTUFT
Syk7DQo+PiAgwqDCoMKgwqDCoMKgwqAgfSBlbHNlIHsNCj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZmxhZ3MgJj0gfkFNREdQVV9QVEVfTVRZUEVfVkcxMF9NQVNLOw0KPj4gIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmbGFncyB8PSAobWFwcGluZy0+ZmxhZ3MgJiBB
TURHUFVfUFRFX01UWVBFX1ZHMTBfTUFTSyk7DQo+PiAgwqDCoMKgwqDCoMKgwqAgfQ0KPj4NCj4+
ICDCoMKgwqDCoMKgwqDCoCBpZiAoKG1hcHBpbmctPmZsYWdzICYgQU1ER1BVX1BURV9QUlQpICYm
DQo+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoYWRldi0+YXNpY190eXBlID49IENISVBfVkVH
QTEwKSkgew0KPj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmbGFncyB8PSBBTURH
UFVfUFRFX1BSVDsNCj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGFkZXYt
PmFzaWNfdHlwZSA+PSBDSElQX05BVkkxMCkgew0KPj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmxhZ3MgfD0gQU1ER1BVX1BURV9TTk9PUEVEOw0KPj4g
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmxhZ3MgfD0g
QU1ER1BVX1BURV9MT0c7DQo+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBmbGFncyB8PSBBTURHUFVfUFRFX1NZU1RFTTsNCj4+ICDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfQ0KPj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBm
bGFncyAmPSB+QU1ER1BVX1BURV9WQUxJRDsNCj4+ICDCoMKgwqDCoMKgwqDCoCB9DQo+IEFuZCBu
b3cgdGhhdCB5b3UgbWVudGlvbmVkIGl0LCB0aGUgY29kZSB5b3UgcHJvcG9zZWQgd291bGRuJ3Qg
aGF2ZQ0KPiB3b3JrZWQgYW55d2F5IGJlY2F1c2UgdGhlIEFNREdQVV9QVEVfU05PT1BFRCB3b3Vs
ZCBoYXZlIGJlZW4gZmlsdGVyZWQNCj4gb3V0IGhlcmUgOikNCg0KT0ssIGFuZCB0aGF0IGRvZXMg
bG9vayBsaWtlIHRoZSByaWdodCBwbGFjZSB0byBzZXQgdGhlIFBURV9TTk9PUEVEIGJpdCANCmZv
ciBYR01JIG1hcHBpbmdzIG9uIEFyY3R1cnVzLiBJJ2xsIHNlbmQgb3V0IGFuIHVwZGF0ZWQgcGF0
Y2ggc2VyaWVzIA0KdGhhdCBubyBsb25nZXIgbmVlZHMgdGhlIEFNREdQVV9WTV9QQUdFX0lOVkFM
SURBVEVfUFJPQkUgYml0IGluIHRoZSBVQVBJLg0KDQpUaGFua3MgZm9yIHRoZSBwb2ludGVyLA0K
IMKgIEZlbGl4DQoNCg0KPg0KPiBSZWdhcmRzLA0KPiBDaHJpc3RpYW4uDQo+DQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
