Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 027C0BFA61
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 22:04:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 389AB6EDFD;
	Thu, 26 Sep 2019 20:04:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750040.outbound.protection.outlook.com [40.107.75.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F24AB6EDFD
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 20:04:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BecqmDLX9vpxgFJ3poXZ7DxqLiLPGvYlcW0fYTEkpNARuzAm9JGYbxYXTt9LQXaa8Eci034EdRAFK6cXKpN9x/uQHXx6U3vu2LwgUNid8DCYminRZSfd05z22nIcG8kaU/f6TByxme5g5c1klY16oKrf7cpYxVD7ra34zkcLbwccBisYPVtxy+WnfAxEqUbKl6KX7ChzumbCEEd/82H249uRQnKXJe1dRXW1q/gTm/0ZBNPmxSEFdXiCNYDOvve3q4CtBlIUTFen0PW8HSLqcHumPRNS75jPWijjN/aQfT2KHyagqwjFXW4JUyoIv8o2ssqJoIaPbCtljlzGUyUpRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVIKvbCxLGMXrvmz3bIutNuYB9rS5YgB3EaC4TUenCg=;
 b=kUTQL7l1H1UlmuYauEeRjdNyoYvrgFGZ8KHD9oYzZAQm8s+axMow9iz3hm9MxAVvxGoLseVKelXJxMONQQMgAx1cqxMTraNC4Vwz2PJqqHOvpiLA4fNfkNpGfgfUSjhijqpkfl+ao/XjauA1nk2PO6pT3vQuaQAekh07vxGWihAgGa+6SaaGAGqVq4iYWfe7+lbDFR1BzEJ8McUxf0TqWzgRhTveGAg3iygG67qN+HtwOYWIEnKD7kxBaDw1odcpjMY62oney/N7Oc0/HrPqFMiPCop7O4dWOfx/tE66wy3h6t4PLMP6PLmcjjHaJqtTfAUZ9OD4DbJ0x4jijIaJ4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2777.namprd12.prod.outlook.com (20.176.114.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Thu, 26 Sep 2019 20:04:44 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 20:04:44 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zhao, Yong" <Yong.Zhao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/amdkfd: Record vmid pasid mapping in the driver
Thread-Topic: [PATCH 1/2] drm/amdkfd: Record vmid pasid mapping in the driver
Thread-Index: AQHVdKMG7khOrFhgmkqHjqrwDcRQ6qc+Yf4A
Date: Thu, 26 Sep 2019 20:04:44 +0000
Message-ID: <ad048ef4-f427-a81d-3817-3482f214b979@amd.com>
References: <20190926194548.15119-1-Yong.Zhao@amd.com>
In-Reply-To: <20190926194548.15119-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTOPR0101CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::25) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e90b0317-7da8-42a1-9f71-08d742bcc610
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB2777; 
x-ms-traffictypediagnostic: DM6PR12MB2777:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB277756B33C2DB4B4C92D694392860@DM6PR12MB2777.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(199004)(189003)(478600001)(3846002)(256004)(2616005)(11346002)(476003)(186003)(386003)(25786009)(102836004)(6506007)(26005)(53546011)(81166006)(6512007)(2906002)(229853002)(6436002)(31686004)(7736002)(446003)(2501003)(86362001)(5660300002)(8676002)(486006)(305945005)(36756003)(99286004)(66556008)(71200400001)(71190400001)(14454004)(8936002)(81156014)(66446008)(76176011)(64756008)(6246003)(6486002)(66476007)(66946007)(6116002)(316002)(65806001)(110136005)(52116002)(58126008)(66066001)(65956001)(31696002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2777;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IDlhAcRB9CviqNlIQ6wZgu62fJsma/HR7ysKWfZSp/MUsmOt3I8RVmez3dfjVK8cPTJqOvReuOb/moYyaaxgsYiRyNvcXnlxib8x3DPfMK7owwp+eQxG8QHbmeLm5Y4sVx1BHdIqQR9rCsKiTFOfwq6WrfYI1RCLP/j6Fdzp5AbvO9jHzt8/2kSryZ9OSagNNqkyh3ToxP9f4Myms6vOJBSMSW273YKjZIfRC8tUHoDFzn6MUegIdfrpasCk7Nh2pNZpJKfHCh9fD8rIXdDJCbiSqmAPJIB8/jKuPMKiK9bNHqPJRxfJMN93vuWhB7pDo/upxUXEY75HloRmFHKI5L60zVmDkPDF6kejZTC6HYOTD/zv7ymm6Edxcrr+f7J8tud5LgTD0Q+qzXbciGat2G1KXkwtzOYMoBYkHPTv1YE=
Content-ID: <80EE46BCC6C6954E971A8BBFF34D89C3@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e90b0317-7da8-42a1-9f71-08d742bcc610
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 20:04:44.2486 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ks1ES5bmUjXbs3GzDSbEr1u9V2ijp0sYAhTYC78rij/con8TW5ssmT8KLfcmEIjmhtfaB3fOZInp164wpec6Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2777
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVIKvbCxLGMXrvmz3bIutNuYB9rS5YgB3EaC4TUenCg=;
 b=jmZsdF/YoiKkRDDKjeSv0zlycgZR0I8FCxqXnHuHR/K5MI1+AT6mHamYWcTXzgv+AFt/B/yce1CIay37VyGJyiQgSTRqmdZ5D5OegRz5UtHmG4mIZ/rugQODV23ixYaXn2s8h2stEHZ7K0gDOvJdnRDpaL+4PEftMTcjmAiIHGA=
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

T24gMjAxOS0wOS0yNiAzOjQ2IHAubS4sIFpoYW8sIFlvbmcgd3JvdGU6DQo+IFRoaXMgbWFrZXMg
cG9zc2libGUgdGhlIHZtaWQgcGFzaWQgbWFwcGluZyBxdWVyeSB0aHJvdWdoIHNvZnR3YXJlLg0K
Pg0KPiBDaGFuZ2UtSWQ6IEliNTM5YWFlMjc3YTIyN2NjMzlmNjQ2OWFlMjNjNDZjNGQyODliODdi
DQo+IFNpZ25lZC1vZmYtYnk6IFlvbmcgWmhhbyA8WW9uZy5aaGFvQGFtZC5jb20+DQo+IC0tLQ0K
PiAgIC4uLi9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYyB8IDMzICsr
KysrKysrKysrKy0tLS0tLS0NCj4gICAuLi4vZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1
ZV9tYW5hZ2VyLmggfCAgMyArLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9w
cml2LmggICAgICAgICB8ICAyICsrDQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25z
KCspLCAxMyBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMNCj4gaW5kZXggZTdmMGEzMmUwZTQ0
Li45MmZlZGUxOGJmMWQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2Zk
L2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jDQo+IEBAIC0yMjQsMjAgKzIyNCwzMCBA
QCBzdGF0aWMgaW50IGFsbG9jYXRlX3ZtaWQoc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpk
cW0sDQo+ICAgCQkJc3RydWN0IHFjbV9wcm9jZXNzX2RldmljZSAqcXBkLA0KPiAgIAkJCXN0cnVj
dCBxdWV1ZSAqcSkNCj4gICB7DQo+IC0JaW50IGJpdCwgYWxsb2NhdGVkX3ZtaWQ7DQo+ICsJaW50
IGFsbG9jYXRlZF92bWlkID0gLTEsIGk7DQo+ICAgDQo+IC0JaWYgKGRxbS0+dm1pZF9iaXRtYXAg
PT0gMCkNCj4gLQkJcmV0dXJuIC1FTk9NRU07DQo+ICsJZm9yIChpID0gZHFtLT5kZXYtPnZtX2lu
Zm8uZmlyc3Rfdm1pZF9rZmQ7DQo+ICsJCQlpIDw9IGRxbS0+ZGV2LT52bV9pbmZvLmxhc3Rfdm1p
ZF9rZmQ7IGkrKykgew0KPiArCQlpZiAoIWRxbS0+dm1pZF9wYXNpZFtpXSkgew0KPiArCQkJYWxs
b2NhdGVkX3ZtaWQgPSBpOw0KPiArCQkJYnJlYWs7DQo+ICsJCX0NCj4gKwl9DQo+ICsNCj4gKwlp
ZiAoYWxsb2NhdGVkX3ZtaWQgPCAwKSB7DQo+ICsJCXByX2Vycigibm8gbW9yZSB2bWlkIHRvIGFs
bG9jYXRlXG4iKTsNCj4gKwkJcmV0dXJuIC1FTk9TUEM7DQo+ICsJfQ0KPiArDQo+ICsJcHJfZGVi
dWcoInZtaWQgYWxsb2NhdGVkOiAlZFxuIiwgYWxsb2NhdGVkX3ZtaWQpOw0KPiArDQo+ICsJZHFt
LT52bWlkX3Bhc2lkW2FsbG9jYXRlZF92bWlkXSA9IHEtPnByb2Nlc3MtPnBhc2lkOw0KPiAgIA0K
PiAtCWJpdCA9IGZmcyhkcW0tPnZtaWRfYml0bWFwKSAtIDE7DQo+IC0JZHFtLT52bWlkX2JpdG1h
cCAmPSB+KDEgPDwgYml0KTsNCj4gKwlzZXRfcGFzaWRfdm1pZF9tYXBwaW5nKGRxbSwgcS0+cHJv
Y2Vzcy0+cGFzaWQsIGFsbG9jYXRlZF92bWlkKTsNCj4gICANCj4gLQlhbGxvY2F0ZWRfdm1pZCA9
IGJpdCArIGRxbS0+ZGV2LT52bV9pbmZvLmZpcnN0X3ZtaWRfa2ZkOw0KPiAtCXByX2RlYnVnKCJ2
bWlkIGFsbG9jYXRpb24gJWRcbiIsIGFsbG9jYXRlZF92bWlkKTsNCj4gICAJcXBkLT52bWlkID0g
YWxsb2NhdGVkX3ZtaWQ7DQo+ICAgCXEtPnByb3BlcnRpZXMudm1pZCA9IGFsbG9jYXRlZF92bWlk
Ow0KPiAgIA0KPiAtCXNldF9wYXNpZF92bWlkX21hcHBpbmcoZHFtLCBxLT5wcm9jZXNzLT5wYXNp
ZCwgcS0+cHJvcGVydGllcy52bWlkKTsNCj4gICAJcHJvZ3JhbV9zaF9tZW1fc2V0dGluZ3MoZHFt
LCBxcGQpOw0KPiAgIA0KPiAgIAkvKiBxcGQtPnBhZ2VfdGFibGVfYmFzZSBpcyBzZXQgZWFybGll
ciB3aGVuIHJlZ2lzdGVyX3Byb2Nlc3MoKQ0KPiBAQCAtMjc4LDggKzI4OCw2IEBAIHN0YXRpYyB2
b2lkIGRlYWxsb2NhdGVfdm1pZChzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwNCj4g
ICAJCQkJc3RydWN0IHFjbV9wcm9jZXNzX2RldmljZSAqcXBkLA0KPiAgIAkJCQlzdHJ1Y3QgcXVl
dWUgKnEpDQo+ICAgew0KPiAtCWludCBiaXQgPSBxcGQtPnZtaWQgLSBkcW0tPmRldi0+dm1faW5m
by5maXJzdF92bWlkX2tmZDsNCj4gLQ0KPiAgIAkvKiBPbiBHRlggdjcsIENQIGRvZXNuJ3QgZmx1
c2ggVEMgYXQgZGVxdWV1ZSAqLw0KPiAgIAlpZiAocS0+ZGV2aWNlLT5kZXZpY2VfaW5mby0+YXNp
Y19mYW1pbHkgPT0gQ0hJUF9IQVdBSUkpDQo+ICAgCQlpZiAoZmx1c2hfdGV4dHVyZV9jYWNoZV9u
b2Nwc2NoKHEtPmRldmljZSwgcXBkKSkNCj4gQEAgLTI4OSw4ICsyOTcsOCBAQCBzdGF0aWMgdm9p
ZCBkZWFsbG9jYXRlX3ZtaWQoc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0sDQo+ICAg
DQo+ICAgCS8qIFJlbGVhc2UgdGhlIHZtaWQgbWFwcGluZyAqLw0KPiAgIAlzZXRfcGFzaWRfdm1p
ZF9tYXBwaW5nKGRxbSwgMCwgcXBkLT52bWlkKTsNCj4gKwlkcW0tPnZtaWRfcGFzaWRbcXBkLT52
bWlkXSA9IDA7DQo+ICAgDQo+IC0JZHFtLT52bWlkX2JpdG1hcCB8PSAoMSA8PCBiaXQpOw0KPiAg
IAlxcGQtPnZtaWQgPSAwOw0KPiAgIAlxLT5wcm9wZXJ0aWVzLnZtaWQgPSAwOw0KPiAgIH0NCj4g
QEAgLTEwMTcsNyArMTAyNSw4IEBAIHN0YXRpYyBpbnQgaW5pdGlhbGl6ZV9ub2Nwc2NoKHN0cnVj
dCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtKQ0KPiAgIAkJCQlkcW0tPmFsbG9jYXRlZF9xdWV1
ZXNbcGlwZV0gfD0gMSA8PCBxdWV1ZTsNCj4gICAJfQ0KPiAgIA0KPiAtCWRxbS0+dm1pZF9iaXRt
YXAgPSAoMSA8PCBkcW0tPmRldi0+dm1faW5mby52bWlkX251bV9rZmQpIC0gMTsNCj4gKwltZW1z
ZXQoZHFtLT52bWlkX3Bhc2lkLCAwLCBWTUlEX05VTSAqIHNpemVvZih1aW50MTZfdCkpOw0KDQpK
dXN0IHVzZSBzaXplb2YoZHFtLT52bWlkX3Bhc2lkKSB0byBnZXQgdGhlIGFycmF5IHNpemUgdG8g
YXZvaWQgcHJvYmxlbXMgDQppZiB0aGUgYXJyYXkgc2l6ZSBldmVyIGNoYW5nZXMgaW4gdGhlIGZ1
dHVyZS4NCg0KUmVnYXJkcywNCiDCoCBGZWxpeA0KDQo+ICsNCj4gICAJZHFtLT5zZG1hX2JpdG1h
cCA9IH4wVUxMID4+ICg2NCAtIGdldF9udW1fc2RtYV9xdWV1ZXMoZHFtKSk7DQo+ICAgCWRxbS0+
eGdtaV9zZG1hX2JpdG1hcCA9IH4wVUxMID4+ICg2NCAtIGdldF9udW1feGdtaV9zZG1hX3F1ZXVl
cyhkcW0pKTsNCj4gICANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2Zk
L2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQv
a2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmgNCj4gaW5kZXggZWVkOGY5NTBiNjYzLi45OWM4YjM2
MzAxZWYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZp
Y2VfcXVldWVfbWFuYWdlci5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9kZXZpY2VfcXVldWVfbWFuYWdlci5oDQo+IEBAIC0xODgsNyArMTg4LDggQEAgc3RydWN0IGRl
dmljZV9xdWV1ZV9tYW5hZ2VyIHsNCj4gICAJdW5zaWduZWQgaW50CQkqYWxsb2NhdGVkX3F1ZXVl
czsNCj4gICAJdWludDY0X3QJCXNkbWFfYml0bWFwOw0KPiAgIAl1aW50NjRfdAkJeGdtaV9zZG1h
X2JpdG1hcDsNCj4gLQl1bnNpZ25lZCBpbnQJCXZtaWRfYml0bWFwOw0KPiArCS8qIHRoZSBwYXNp
ZCBtYXBwaW5nIGZvciBlYWNoIGtmZCB2bWlkICovDQo+ICsJdWludDE2X3QJCXZtaWRfcGFzaWRb
Vk1JRF9OVU1dOw0KPiAgIAl1aW50NjRfdAkJcGlwZWxpbmVzX2FkZHI7DQo+ICAgCXN0cnVjdCBr
ZmRfbWVtX29iagkqcGlwZWxpbmVfbWVtOw0KPiAgIAl1aW50NjRfdAkJZmVuY2VfZ3B1X2FkZHI7
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaA0KPiBpbmRleCAwZDJjN2ZhMWZh
NDYuLmEwODAxNTcyMDg0MSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX3ByaXYuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJp
di5oDQo+IEBAIC00Myw2ICs0Myw4IEBADQo+ICAgDQo+ICAgI2luY2x1ZGUgImFtZF9zaGFyZWQu
aCINCj4gICANCj4gKyNkZWZpbmUgVk1JRF9OVU0gMTYNCj4gKw0KPiAgICNkZWZpbmUgS0ZEX01B
WF9SSU5HX0VOVFJZX1NJWkUJOA0KPiAgIA0KPiAgICNkZWZpbmUgS0ZEX1NZU0ZTX0ZJTEVfTU9E
RSAwNDQ0DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
