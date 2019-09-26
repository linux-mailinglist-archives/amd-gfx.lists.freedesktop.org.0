Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7843ABF9AA
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 20:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F252C6EDEB;
	Thu, 26 Sep 2019 18:54:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770080.outbound.protection.outlook.com [40.107.77.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C646EDEB
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 18:54:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bo1SA+M7j0eCBRkNVIjZJWJ0nvAGNdUN1VsPK07o101dupPiiT4oI4GMvxNOZaksL8DadYxZGyQeUJVHTusutJeuEWH6xYwY2wqenjpz8YX3DGyCbYErrqY+6tDv2yEXfv/Zv09bKboCXHq4CDmwR1+LCSEJ6UL/7TpwH4kphMoXnrymceM4EYGBjueHL93iKtJe80QHcrHyVhccERnXfn4kV+aEFHmxpX35gKB+vixd/UQVlF7y62uTvuwuoC4MzonBZLH54lGjUFl3sc5ctDseMXf2UijO3gXOblErXRudGQCWUWbVmdKs5gV86YyKpdOtuVOQ7Cgs876UqCXKuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xw95/eB3+TKvTMzPuO59xKMpD0VaR5yfl8EOYLFfyA=;
 b=Wo/9ka0oTIXqZdfD51Gxp+a8YdkpJE2u85zWEQyzkfxucNQGDNBs8hy1kWl4OlbbFEcl603BS/PYa4oJElkqOingsrb84XScBorS96XUUf2ChpAwKd6S+QJfJOaVrrqDtwVAwb7/bMJGo067NJL4ZgMR2Taj2gkTJ6W8Z6HuPAlzqhcdny6BMm0/ceuS2P8kOMdvxPZwJGTfZocqSAioccgjXyNvGYR0pdg2pKsDIuA7P/ewhr60UKoGgxW8SBIA3ZA4fxBPjdcsH391NN7AWTI/rtmgbJFTpuRHCzQZfYLSQVBzn71VqUrzduMLVv2NqcunbvauxpNYmOKHDMtT/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3243.namprd12.prod.outlook.com (20.179.105.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.18; Thu, 26 Sep 2019 18:54:30 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 18:54:30 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhao,
 Yong" <Yong.Zhao@amd.com>
Subject: Re: [PATCH 4/6] drm/amdkfd: Record vmid pasid mapping in the driver
Thread-Topic: [PATCH 4/6] drm/amdkfd: Record vmid pasid mapping in the driver
Thread-Index: AQHVdJmlalbmmxuY9kWV2AedeYoA6qc+TnOA
Date: Thu, 26 Sep 2019 18:54:30 +0000
Message-ID: <cc578b05-a918-2c5f-d6ac-122f24d763ce@amd.com>
References: <20190926183826.18813-1-Yong.Zhao@amd.com>
 <20190926183826.18813-4-Yong.Zhao@amd.com>
In-Reply-To: <20190926183826.18813-4-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YT1PR01CA0029.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::42)
 To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8770d35c-d144-47bf-600f-08d742b2f68c
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB3243:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB324391D71F84D7F2D777EDBA92860@DM6PR12MB3243.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(136003)(396003)(346002)(376002)(189003)(199004)(7736002)(102836004)(65806001)(26005)(14454004)(99286004)(2501003)(305945005)(76176011)(65956001)(66066001)(186003)(53546011)(6506007)(2906002)(6116002)(386003)(52116002)(110136005)(64756008)(66556008)(66476007)(81166006)(478600001)(66446008)(81156014)(86362001)(66946007)(5660300002)(31696002)(58126008)(8936002)(486006)(6512007)(11346002)(316002)(476003)(2616005)(36756003)(6246003)(14444005)(256004)(8676002)(6636002)(25786009)(446003)(3846002)(31686004)(6436002)(71200400001)(71190400001)(6486002)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3243;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZN7FQBuXfwBxQuf+1AgDNl/zbekJJtbWv8kPzVZDNyZ5n78rbM8hcuqBunQOfxxfdmTDDa7MFSwYrQ2bZ4FbhtHYO9fjuK21QZXHC4S7FJ63HG7srgZyuw/g+m064gveTl/g1PG01EpLM98zgJ9PZMVQq6f20x/gI6tRQ/03Tp2bSlSWRy+M55oBbEZ+C17qT8JZPWYSzLdKz897nHs7BIPfEpP6hiFhD2EaIaBXTKYHQViWoB2nD+EW9Lc3wdXr/y3GUDhWUEncpQpxT5ghvckL8K8JHmzNyrD9DlKP//C9hhfWHcUXgfCYc5riMKw72x5fo+geTEseJjzfwI5mlba9q4novjXJrq+hOdyhl5eqOxBjRBfHZh0BfHM306cPWTAfffterSJLCHEGd1Idc7egg+payu+ejMxP2YyJZa8=
Content-ID: <0BE68F140D90F24EA456D7BF9B9FACB6@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8770d35c-d144-47bf-600f-08d742b2f68c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 18:54:30.6439 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U9UMLMJdSq92SdQjw8GjmR85FjOuLb7i0+PHPHmgiJwfxBnIEEt5GJdgMWYZLsFN+yv6sxJGSy6/KoPQoLBGJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3243
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xw95/eB3+TKvTMzPuO59xKMpD0VaR5yfl8EOYLFfyA=;
 b=wY1vSPDq4Us5S39NQFm0X9OcCEElgBYObLJOuyiXrEP7CVkBKAHimN+ijb7EO0EG04YpWGnMzIumR+mrJ6DnGoS7keFlETf3VklBrnYdsgJo0WnPnzneUgO5oBV3QVRFwThU9xxYEY5o9b9ZtiTM1N1vXjHVU6k2++FO2uwh4PU=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wOS0yNiAyOjM4IHAubS4sIFpoYW8sIFlvbmcgd3JvdGU6DQo+IFRoaXMgbWFrZXMg
cG9zc2libGUgdGhlIHZtaWQgcGFzaWQgbWFwcGluZyBxdWVyeSB0aHJvdWdoIHNvZnR3YXJlLg0K
Pg0KPiBDaGFuZ2UtSWQ6IEliNTM5YWFlMjc3YTIyN2NjMzlmNjQ2OWFlMjNjNDZjNGQyODliODdi
DQo+IFNpZ25lZC1vZmYtYnk6IFlvbmcgWmhhbyA8WW9uZy5aaGFvQGFtZC5jb20+DQo+IC0tLQ0K
PiAgIC4uLi9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYyB8IDM0ICsr
KysrKysrKysrKystLS0tLS0NCj4gICAuLi4vZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1
ZV9tYW5hZ2VyLmggfCAgMyArLQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygr
KSwgMTEgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jDQo+IGluZGV4IGU3ZjBhMzJlMGU0NC4u
ZDAwNmFkZWZlZjU1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9r
ZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYw0KPiBAQCAtMjI0LDIwICsyMjQsMzAgQEAg
c3RhdGljIGludCBhbGxvY2F0ZV92bWlkKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFt
LA0KPiAgIAkJCXN0cnVjdCBxY21fcHJvY2Vzc19kZXZpY2UgKnFwZCwNCj4gICAJCQlzdHJ1Y3Qg
cXVldWUgKnEpDQo+ICAgew0KPiAtCWludCBiaXQsIGFsbG9jYXRlZF92bWlkOw0KPiArCWludCBp
ZHggPSAtMSwgYWxsb2NhdGVkX3ZtaWQsIGk7DQo+ICAgDQo+IC0JaWYgKGRxbS0+dm1pZF9iaXRt
YXAgPT0gMCkNCj4gKwlmb3IgKGkgPSAwOyBpIDwgZHFtLT5kZXYtPnZtX2luZm8udm1pZF9udW1f
a2ZkOyBpKyspIHsNCj4gKwkJaWYgKCFkcW0tPnZtaWRfcGFzaWRbaV0pIHsNCj4gKwkJCWlkeCA9
IGk7DQo+ICsJCQlicmVhazsNCj4gKwkJfQ0KPiArCX0NCj4gKw0KPiArCWlmIChpZHggPCAwKSB7
DQo+ICsJCXByX2Vycigibm8gbW9yZSB2bWlkIHRvIGFsbG9jYXRlXG4iKTsNCj4gICAJCXJldHVy
biAtRU5PTUVNOw0KPiArCX0NCj4gKw0KPiArCWRxbS0+dm1pZF9wYXNpZFtpZHhdID0gcS0+cHJv
Y2Vzcy0+cGFzaWQ7DQo+ICAgDQo+IC0JYml0ID0gZmZzKGRxbS0+dm1pZF9iaXRtYXApIC0gMTsN
Cj4gLQlkcW0tPnZtaWRfYml0bWFwICY9IH4oMSA8PCBiaXQpOw0KPiArCWFsbG9jYXRlZF92bWlk
ID0gaWR4ICsgZHFtLT5kZXYtPnZtX2luZm8uZmlyc3Rfdm1pZF9rZmQ7DQo+ICsJcHJfZGVidWco
InZtaWQgYWxsb2NhdGVkOiAlZFxuIiwgYWxsb2NhdGVkX3ZtaWQpOw0KPiArDQo+ICsJc2V0X3Bh
c2lkX3ZtaWRfbWFwcGluZyhkcW0sIHEtPnByb2Nlc3MtPnBhc2lkLCBhbGxvY2F0ZWRfdm1pZCk7
DQo+ICAgDQo+IC0JYWxsb2NhdGVkX3ZtaWQgPSBiaXQgKyBkcW0tPmRldi0+dm1faW5mby5maXJz
dF92bWlkX2tmZDsNCj4gLQlwcl9kZWJ1Zygidm1pZCBhbGxvY2F0aW9uICVkXG4iLCBhbGxvY2F0
ZWRfdm1pZCk7DQo+ICAgCXFwZC0+dm1pZCA9IGFsbG9jYXRlZF92bWlkOw0KPiAgIAlxLT5wcm9w
ZXJ0aWVzLnZtaWQgPSBhbGxvY2F0ZWRfdm1pZDsNCj4gICANCj4gLQlzZXRfcGFzaWRfdm1pZF9t
YXBwaW5nKGRxbSwgcS0+cHJvY2Vzcy0+cGFzaWQsIHEtPnByb3BlcnRpZXMudm1pZCk7DQo+ICAg
CXByb2dyYW1fc2hfbWVtX3NldHRpbmdzKGRxbSwgcXBkKTsNCj4gICANCj4gICAJLyogcXBkLT5w
YWdlX3RhYmxlX2Jhc2UgaXMgc2V0IGVhcmxpZXIgd2hlbiByZWdpc3Rlcl9wcm9jZXNzKCkNCj4g
QEAgLTI3OCw3ICsyODgsNyBAQCBzdGF0aWMgdm9pZCBkZWFsbG9jYXRlX3ZtaWQoc3RydWN0IGRl
dmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0sDQo+ICAgCQkJCXN0cnVjdCBxY21fcHJvY2Vzc19kZXZp
Y2UgKnFwZCwNCj4gICAJCQkJc3RydWN0IHF1ZXVlICpxKQ0KPiAgIHsNCj4gLQlpbnQgYml0ID0g
cXBkLT52bWlkIC0gZHFtLT5kZXYtPnZtX2luZm8uZmlyc3Rfdm1pZF9rZmQ7DQo+ICsJaW50IGlk
eDsNCj4gICANCj4gICAJLyogT24gR0ZYIHY3LCBDUCBkb2Vzbid0IGZsdXNoIFRDIGF0IGRlcXVl
dWUgKi8NCj4gICAJaWYgKHEtPmRldmljZS0+ZGV2aWNlX2luZm8tPmFzaWNfZmFtaWx5ID09IENI
SVBfSEFXQUlJKQ0KPiBAQCAtMjkwLDcgKzMwMCw5IEBAIHN0YXRpYyB2b2lkIGRlYWxsb2NhdGVf
dm1pZChzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwNCj4gICAJLyogUmVsZWFzZSB0
aGUgdm1pZCBtYXBwaW5nICovDQo+ICAgCXNldF9wYXNpZF92bWlkX21hcHBpbmcoZHFtLCAwLCBx
cGQtPnZtaWQpOw0KPiAgIA0KPiAtCWRxbS0+dm1pZF9iaXRtYXAgfD0gKDEgPDwgYml0KTsNCj4g
KwlpZHggPSBxcGQtPnZtaWQgLSBkcW0tPmRldi0+dm1faW5mby5maXJzdF92bWlkX2tmZDsNCj4g
KwlkcW0tPnZtaWRfcGFzaWRbaWR4XSA9IDA7DQo+ICsNCj4gICAJcXBkLT52bWlkID0gMDsNCj4g
ICAJcS0+cHJvcGVydGllcy52bWlkID0gMDsNCj4gICB9DQo+IEBAIC0xMDE3LDcgKzEwMjksOCBA
QCBzdGF0aWMgaW50IGluaXRpYWxpemVfbm9jcHNjaChzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFn
ZXIgKmRxbSkNCj4gICAJCQkJZHFtLT5hbGxvY2F0ZWRfcXVldWVzW3BpcGVdIHw9IDEgPDwgcXVl
dWU7DQo+ICAgCX0NCj4gICANCj4gLQlkcW0tPnZtaWRfYml0bWFwID0gKDEgPDwgZHFtLT5kZXYt
PnZtX2luZm8udm1pZF9udW1fa2ZkKSAtIDE7DQo+ICsJZHFtLT52bWlkX3Bhc2lkID0ga2NhbGxv
YyhkcW0tPmRldi0+dm1faW5mby52bWlkX251bV9rZmQsDQo+ICsJCQlzaXplb2YodWludDE2X3Qp
LCBHRlBfS0VSTkVMKTsNCg0KSWYgeW91IGFsbG9jYXRlIHRoaXMgZHluYW1pY2FsbHksIHlvdSBu
ZWVkIHRvIGNoZWNrIHRoZSByZXR1cm4gdmFsdWUuIA0KQnV0IHNlZSBiZWxvdyAuLi4NCg0KDQo+
ICAgCWRxbS0+c2RtYV9iaXRtYXAgPSB+MFVMTCA+PiAoNjQgLSBnZXRfbnVtX3NkbWFfcXVldWVz
KGRxbSkpOw0KPiAgIAlkcW0tPnhnbWlfc2RtYV9iaXRtYXAgPSB+MFVMTCA+PiAoNjQgLSBnZXRf
bnVtX3hnbWlfc2RtYV9xdWV1ZXMoZHFtKSk7DQo+ICAgDQo+IEBAIC0xMDMwLDYgKzEwNDMsNyBA
QCBzdGF0aWMgdm9pZCB1bmluaXRpYWxpemUoc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpk
cW0pDQo+ICAgDQo+ICAgCVdBUk5fT04oZHFtLT5xdWV1ZV9jb3VudCA+IDAgfHwgZHFtLT5wcm9j
ZXNzZXNfY291bnQgPiAwKTsNCj4gICANCj4gKwlrZnJlZShkcW0tPnZtaWRfcGFzaWQpOw0KPiAg
IAlrZnJlZShkcW0tPmFsbG9jYXRlZF9xdWV1ZXMpOw0KPiAgIAlmb3IgKGkgPSAwIDsgaSA8IEtG
RF9NUURfVFlQRV9NQVggOyBpKyspDQo+ICAgCQlrZnJlZShkcW0tPm1xZF9tZ3JzW2ldKTsNCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVf
bWFuYWdlci5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9t
YW5hZ2VyLmgNCj4gaW5kZXggZWVkOGY5NTBiNjYzLi42N2I1ZTVmYWRkOTUgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5o
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFu
YWdlci5oDQo+IEBAIC0xODgsNyArMTg4LDggQEAgc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2Vy
IHsNCj4gICAJdW5zaWduZWQgaW50CQkqYWxsb2NhdGVkX3F1ZXVlczsNCj4gICAJdWludDY0X3QJ
CXNkbWFfYml0bWFwOw0KPiAgIAl1aW50NjRfdAkJeGdtaV9zZG1hX2JpdG1hcDsNCj4gLQl1bnNp
Z25lZCBpbnQJCXZtaWRfYml0bWFwOw0KPiArCS8qIHRoZSBwYXNpZCBtYXBwaW5nIGZvciBlYWNo
IGtmZCB2bWlkICovDQo+ICsJdWludDE2X3QJCSp2bWlkX3Bhc2lkOw0KDQpUaGlzIGNvdWxkIGJl
IGEgZml4ZWQtc2l6ZSBhcnJheSBzaW5jZSB0aGUgbnVtYmVyIG9mIHVzZXIgbW9kZSBWTUlEcyBp
cyANCmxpbWl0ZWQgdG8gMTUgYnkgdGhlIEhXLiBUaGUgc2l6ZSBvZiB0aGUgcG9pbnRlciBhbG9u
ZSBpcyBlbm91Z2ggdG8gDQpzdG9yZSA0IFBBU0lEcy4gQWRkIG92ZXJoZWFkIG9mIGttYWxsb2Mg
YW5kIHlvdSBkb24ndCByZWFsbHkgc2F2ZSANCmFueXRoaW5nIGJ5IGFsbG9jYXRpbmcgdGhpcyBk
eW5hbWljYWxseS4gSXQgb25seSBhZGRzIGluZGlyZWN0aW9uLCANCmNvbXBsZXhpdHkgKGVycm9y
IGhhbmRsaW5nKSBhbmQgdGhlIHJpc2sgb2YgbWVtb3J5IGxlYWtzLg0KDQpSZWdhcmRzLA0KIMKg
IEZlbGl4DQoNCg0KPiAgIAl1aW50NjRfdAkJcGlwZWxpbmVzX2FkZHI7DQo+ICAgCXN0cnVjdCBr
ZmRfbWVtX29iagkqcGlwZWxpbmVfbWVtOw0KPiAgIAl1aW50NjRfdAkJZmVuY2VfZ3B1X2FkZHI7
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
