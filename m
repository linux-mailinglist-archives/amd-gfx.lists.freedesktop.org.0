Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B634E88357
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 21:36:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE76D6EE8E;
	Fri,  9 Aug 2019 19:36:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700068.outbound.protection.outlook.com [40.107.70.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF6846EE8E
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 19:36:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tu6EpXFWrSRP6BM5kdLYjMWeRUDpkxbQRKBc4twaGMyM4Beqw966p7aU00lqNqwuWX2wMYFzAnkwkAvYuIRAiYtBGHT9G+DiK/NLGi7hWcmMebG9UpGme1g/AMJeiwDFF3Mq60WVZMuZa/oWRlmIA6+ER3vvPU/skITb7LW/hZopEBLY8VwGQKBKUoJNd90iFbspaepPRrsuh//eBgD60p8Of1/+lM+zTWLUdGJd59uvh0yAnqkomrsiLNfkXaEOV99dOm2f66VdhuNuKE1mduADRDqGzv1c1TRTg4FdflN5X+OvtOVC/wLhnC23FMbZb4D/Cu7Z8DdqG01pKyDyMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cHmV3JsMe/pVy9rjhMMBFA16eb6ITvSBxd1Owx8gVek=;
 b=DgjO5H1oL1WPoGpZUVwt9QAyB/dakbwR6oFAajgeQC/blTeR2sihbToAfMKnD5BFwJS4zc8TacmYMz3MhauQjtYMAeRwCA6q7BbdG7U0gCTNneMaY93dYv2CExx6TvsZ87YnnW7D9Rs8KjdCAUwozJ6a+ki9dFbW4Q+ieXC+nFTJrbB/LuqquDd2lC+AEAUKNkviZ7/6g7mgn37WcnlpRPpo5C9Es/LTEen0Cfjzwq4RC6/3DAhw3iMYOll0j6aG/HvQuyN45yTxvHXGLvkCvYCZ4PfYplrYWVMJb8mviMClrgvC1emPOQYdOcgTLhSPH5s4I6LIPKXQ77XRHu4eaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1917.namprd12.prod.outlook.com (10.175.55.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Fri, 9 Aug 2019 19:36:48 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::9065:8869:9c1c:931d]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::9065:8869:9c1c:931d%12]) with mapi id 15.20.2157.020; Fri, 9 Aug 2019
 19:36:48 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/display: use kvmalloc for dc_state (v2)
Thread-Topic: [PATCH] drm/amd/display: use kvmalloc for dc_state (v2)
Thread-Index: AQHVTuSofwd04xCGWkK4FNegO+HNEabzNcSA
Date: Fri, 9 Aug 2019 19:36:48 +0000
Message-ID: <9cf3550a-4b0c-dfa2-d532-a1b83cd4b23b@amd.com>
References: <20190809185952.3656-1-alexander.deucher@amd.com>
In-Reply-To: <20190809185952.3656-1-alexander.deucher@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0041.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::18) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c75e2c18-3203-4553-ccff-08d71d00eb44
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1917; 
x-ms-traffictypediagnostic: MWHPR12MB1917:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB1917001AD192A93A61384354EAD60@MWHPR12MB1917.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39850400004)(346002)(376002)(396003)(366004)(136003)(189003)(199004)(6436002)(6246003)(8936002)(5660300002)(31696002)(81166006)(4326008)(86362001)(305945005)(81156014)(66556008)(64756008)(66476007)(53936002)(66446008)(7736002)(66946007)(478600001)(2501003)(6506007)(53546011)(386003)(52116002)(102836004)(26005)(186003)(14454004)(76176011)(99286004)(229853002)(316002)(31686004)(8676002)(36756003)(25786009)(11346002)(110136005)(6486002)(2906002)(486006)(6116002)(3846002)(476003)(2616005)(71200400001)(14444005)(71190400001)(446003)(66066001)(256004)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1917;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: t2XYeSnPA5Vr3KR75ndnkbj4EKwRjIgcde5aObLBUvuQxnaUBvJTn8Qr42HUcYoHC4S5P2B2Ha9ls/XT5B3swUKm35okUQ2vnQVLWHaW/MU7Ej9m88pQ0VT4f1FRi2BcF+erjOhtO2Jg5iD7CINMjZ/Lnr/WKAYw+LCEcye6KMvzM993FiJrAAgzFTUXkhrN7slWaMYtm0Q4L58gulekDyH4XRGnrpGkFRXO+MPH+RUjCjp+DrWjAUMoSrf9iISUbE6V641PKSbiLIYvqchke++Hrk/IXOmuVwR+AOMUFt05rYZDJ2zqtE6FwCL/T0AeYzPJQOfJ9UMk9eqRbx2UsPwXJQnMIJ8uP6WtwrjL2nYrsAYK8uMsVKY9T7yCZL7nQUiyNwURdMCSO2KGYYHOigNhvEik+/RLhj9aOZbLBkw=
Content-ID: <D4E4D6F30837734C96A39A77A5971C48@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c75e2c18-3203-4553-ccff-08d71d00eb44
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 19:36:48.2503 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FqKOLWeI71l0ZNUldgufm1vbzR/Qvb/tK2HHHUvqy9BuxXqRApfNEUz+dx2j3UnPDssc3M/o96834qhOSN4aoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1917
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cHmV3JsMe/pVy9rjhMMBFA16eb6ITvSBxd1Owx8gVek=;
 b=wyWQGc0eo2mtDxFWjw8XhZKKP2msDyCY73N8eTMVS9IyIGjoNp1daHJxNGRFoaBUvmUv1BgFtG5RQlFgydPSExnfGzwsu23NdEzGzDGOgO8JqtyV9MVenZi7Fj7hAaZJ+OjF8IvuOb+gwV4ZkYSlLKqQUjfgbTCTzO/cFVCVS48=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29t
Pg0KDQpBbmRyZXkNCg0KT24gOC85LzE5IDI6NTkgUE0sIEFsZXggRGV1Y2hlciB3cm90ZToNCj4g
SXQncyBsYXJnZSBhbmQgZG9lc24ndCBuZWVkIGNvbnRpZ3VvdXMgbWVtb3J5LiAgRml4ZXMNCj4g
YWxsb2NhdGlvbiBmYWlsdXJlcyBpbiBzb21lIGNhc2VzLg0KPg0KPiB2Mjoga3ZmcmVlIHRoZSBt
ZW1vcnkuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nv
cmUvZGMuYyB8IDExICsrKysrKy0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKSwgNSBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Y29yZS9kYy5jDQo+IGluZGV4IDI1MmI2MjFkOTNhOS4uMjFmYjdlZTE3YzljIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMNCj4gQEAgLTIzLDYgKzIzLDcg
QEANCj4gICAgKi8NCj4gICANCj4gICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPg0KPiArI2luY2x1
ZGUgPGxpbnV4L21tLmg+DQo+ICAgDQo+ICAgI2luY2x1ZGUgImRtX3NlcnZpY2VzLmgiDQo+ICAg
DQo+IEBAIC0xMTgzLDggKzExODQsOCBAQCBib29sIGRjX3Bvc3RfdXBkYXRlX3N1cmZhY2VzX3Rv
X3N0cmVhbShzdHJ1Y3QgZGMgKmRjKQ0KPiAgIA0KPiAgIHN0cnVjdCBkY19zdGF0ZSAqZGNfY3Jl
YXRlX3N0YXRlKHN0cnVjdCBkYyAqZGMpDQo+ICAgew0KPiAtCXN0cnVjdCBkY19zdGF0ZSAqY29u
dGV4dCA9IGt6YWxsb2Moc2l6ZW9mKHN0cnVjdCBkY19zdGF0ZSksDQo+IC0JCQkJCSAgIEdGUF9L
RVJORUwpOw0KPiArCXN0cnVjdCBkY19zdGF0ZSAqY29udGV4dCA9IGt2emFsbG9jKHNpemVvZihz
dHJ1Y3QgZGNfc3RhdGUpLA0KPiArCQkJCQkgICAgR0ZQX0tFUk5FTCk7DQo+ICAgDQo+ICAgCWlm
ICghY29udGV4dCkNCj4gICAJCXJldHVybiBOVUxMOw0KPiBAQCAtMTIwNCwxMSArMTIwNSwxMSBA
QCBzdHJ1Y3QgZGNfc3RhdGUgKmRjX2NyZWF0ZV9zdGF0ZShzdHJ1Y3QgZGMgKmRjKQ0KPiAgIHN0
cnVjdCBkY19zdGF0ZSAqZGNfY29weV9zdGF0ZShzdHJ1Y3QgZGNfc3RhdGUgKnNyY19jdHgpDQo+
ICAgew0KPiAgIAlpbnQgaSwgajsNCj4gLQlzdHJ1Y3QgZGNfc3RhdGUgKm5ld19jdHggPSBrbWVt
ZHVwKHNyY19jdHgsDQo+IC0JCQlzaXplb2Yoc3RydWN0IGRjX3N0YXRlKSwgR0ZQX0tFUk5FTCk7
DQo+ICsJc3RydWN0IGRjX3N0YXRlICpuZXdfY3R4ID0ga3ZtYWxsb2Moc2l6ZW9mKHN0cnVjdCBk
Y19zdGF0ZSksIEdGUF9LRVJORUwpOw0KPiAgIA0KPiAgIAlpZiAoIW5ld19jdHgpDQo+ICAgCQly
ZXR1cm4gTlVMTDsNCj4gKwltZW1jcHkobmV3X2N0eCwgc3JjX2N0eCwgc2l6ZW9mKHN0cnVjdCBk
Y19zdGF0ZSkpOw0KPiAgIA0KPiAgIAlmb3IgKGkgPSAwOyBpIDwgTUFYX1BJUEVTOyBpKyspIHsN
Cj4gICAJCQlzdHJ1Y3QgcGlwZV9jdHggKmN1cl9waXBlID0gJm5ld19jdHgtPnJlc19jdHgucGlw
ZV9jdHhbaV07DQo+IEBAIC0xMjQyLDcgKzEyNDMsNyBAQCBzdGF0aWMgdm9pZCBkY19zdGF0ZV9m
cmVlKHN0cnVjdCBrcmVmICprcmVmKQ0KPiAgIHsNCj4gICAJc3RydWN0IGRjX3N0YXRlICpjb250
ZXh0ID0gY29udGFpbmVyX29mKGtyZWYsIHN0cnVjdCBkY19zdGF0ZSwgcmVmY291bnQpOw0KPiAg
IAlkY19yZXNvdXJjZV9zdGF0ZV9kZXN0cnVjdChjb250ZXh0KTsNCj4gLQlrZnJlZShjb250ZXh0
KTsNCj4gKwlrdmZyZWUoY29udGV4dCk7DQo+ICAgfQ0KPiAgIA0KPiAgIHZvaWQgZGNfcmVsZWFz
ZV9zdGF0ZShzdHJ1Y3QgZGNfc3RhdGUgKmNvbnRleHQpDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
