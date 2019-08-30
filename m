Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52277A2BD7
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Aug 2019 02:51:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE18C6E0EC;
	Fri, 30 Aug 2019 00:51:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710075.outbound.protection.outlook.com [40.107.71.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 371566E0EC
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Aug 2019 00:51:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HaXZ7cSgb1gPdHtg3pSaiiY/g94FteZ7LcApPusKoYObhBYrkgBZJj7IcomBr1i2a70+eL1nafkJm1r0Zvtlmf3vftP48uzuBkJtvYIbsfQL3NxYHarPljHPY9a8iirqcgRIY28k3M8KGz8IcSlPXdQImQ24nCmo6OM5fEcfbpVdicOTCW7MOgbtfj8qJDwZha6cF1LAnSnOboBbqN1h/lpWorAKEdDJGyqOG+fwj7zlKntOSVXyHXbQPe4BKnxgIQTNij8saO1hwvPO7XWmo2cAuXgZPz4pOoN9ZbbfETRpFNrRZk/0qkbxm/tFciEqfpIu5uTpOTlb8k+fAgoPeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Huwcpw2C7CXaYW/cZCInWymjgKa4kwRTt5Dvpz1oDI=;
 b=IFnJYhNwAHybInRH8eaPgpyvDxhLkSnzDsBYjKgmHZ4LvP/6cSrBT5h+tPBsbVtDi4zVOtJGFHISTimaU6JFlMHDxGrHeDNLbn3b8fnNlc6hghZCfUhynX22/w0UybwpRR5L9Jh5A5JmJdUJoiLgt4sffHwurWSf8SmCGHDTXR7UUdzzzyvz+pqGr1jh6PqFPs3f0vuWoUGRXrAuCiAu5xWa2d1eqNXFU9+LagCDGt4hHCgDpvNMQlH+MGgnYTN8utCltrjAa8JTpX21zqfBFOJ4/s6GBzJdSVscfwNeLASlDbLna345EHiHz+Wr3vcQILCP4+bB8shOKFEzQBriGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2938.namprd12.prod.outlook.com (20.179.104.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Fri, 30 Aug 2019 00:51:36 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2199.021; Fri, 30 Aug 2019
 00:51:36 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/4] drm/amdgpu: Determing PTE flags separately for each
 mapping (v3)
Thread-Topic: [PATCH 3/4] drm/amdgpu: Determing PTE flags separately for each
 mapping (v3)
Thread-Index: AQHVXs0TUTY3pGhZ30aM4jdeaeF9vw==
Date: Fri, 30 Aug 2019 00:51:35 +0000
Message-ID: <20190830005124.15610-1-Felix.Kuehling@amd.com>
References: <0bf604b8-0091-9cc7-fbac-44cb0485729e@amd.com>
In-Reply-To: <0bf604b8-0091-9cc7-fbac-44cb0485729e@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTOPR0101CA0067.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::44) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75317468-c0b8-405a-8674-08d72ce4355e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2938; 
x-ms-traffictypediagnostic: DM6PR12MB2938:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB29381510B938565E29B736E992BD0@DM6PR12MB2938.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:935;
x-forefront-prvs: 0145758B1D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(39860400002)(346002)(396003)(136003)(189003)(199004)(6116002)(14454004)(52116002)(54906003)(71200400001)(71190400001)(5660300002)(4326008)(8676002)(81156014)(81166006)(186003)(6916009)(386003)(6506007)(478600001)(2906002)(8936002)(50226002)(3846002)(102836004)(256004)(76176011)(14444005)(2351001)(25786009)(2616005)(476003)(26005)(86362001)(99286004)(6512007)(1076003)(5640700003)(53936002)(6486002)(486006)(7736002)(305945005)(66574012)(11346002)(66946007)(66066001)(316002)(2501003)(66476007)(64756008)(66446008)(66556008)(36756003)(6436002)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2938;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZmAAWZKzQ/8v0dL0AAspLponV8AGaw4/2G//NHbXFlN++za0nVMF56DAixi+MbEeml0n8HtxZKOGy4Jn0hA0RQWvDHo6CJZQC2qKi1+WfrDxdaK93LOkXja96XlCp/92yvwyJADLj7ctr+/eC95AJPIi/iT2wOjf7o8OYYXWhAsjp0ULEvUb3i1RjBWyS6vG4FgzTPgKbmp+CEkCUigSCXmxJynsFvv/MpEqYMzZKT2u/Ntk1MJuL32MZkpoSbWkZY/oywx9Ss/Am5pZpDQ9dRlUDM2wLOHJlCzQEp3dGU/4gXYlI+hnG5iOKdPqGJQ+G86Vs7Rvkp0fpy5WxfpqtBEt+T2MIOLORlNN8wvxjjHHXimthQBhSf/xBYroHFMKmGR/wjPtqLlzixmSwJ1NUI9bgglUivcUOb5WZO0hhh0=
Content-ID: <5E5D204889DE8140B9DB2A9621E61C96@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75317468-c0b8-405a-8674-08d72ce4355e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2019 00:51:35.9105 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RNZEdP8/kreftSo958ynuIv7+cq6nIeBydvNDHum4AzPxIY54pSAKL5wodNHIpRvnSd7IuZMAjXOXMH/YDTIWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2938
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Huwcpw2C7CXaYW/cZCInWymjgKa4kwRTt5Dvpz1oDI=;
 b=OANuTIovo340Lgw4OpJFJF4blnS0qTuanvEcpC09dY8AeMzzXMPeClYBnQNJajD0iHK/UacjLHfd2ECXTAKfy6wYfcazLX4L0M0CZeTuBfIT4NuM24nitaZeRid8kpnebJSIHr9AT1R7AZQ/bZ4sw+SAj+npjhFYDMZGcuKg64Y=
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
Cc: "Zeng, Oak" <Oak.Zeng@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIHNhbWUgQk8gY2FuIGJlIG1hcHBlZCB3aXRoIGRpZmZlcmVudCBQVEUgZmxhZ3MgYnkgZGlm
ZmVyZW50IEdQVXMuDQpUaGVyZWZvcmUgZGV0ZXJtaW5lIHRoZSBQVEUgZmxhZ3Mgc2VwYXJhdGVs
eSBmb3IgZWFjaCBtYXBwaW5nIGluc3RlYWQNCm9mIHN0b3JpbmcgdGhlbSBpbiB0aGUgS0ZEIGJ1
ZmZlciBvYmplY3QuDQoNCkFkZCBhIGhlbHBlciBmdW5jdGlvbiB0byBkZXRlcm1pbmUgdGhlIFBU
RSBmbGFncyB0byBiZSBleHRlbmRlZCB3aXRoDQpBU0lDIGFuZCBtZW1vcnktdHlwZS1zcGVjaWZp
YyBsb2dpYyBpbiBzdWJzZXF1ZW50IGNvbW1pdHMuDQoNCnYyOiBTcGxpdCBBcmN0dXJ1cy1zcGVj
aWZpYyBNVFlQRSBjaGFuZ2VzIGludG8gc2VwYXJhdGUgY29tbWl0DQp2MzogRml4IHJldHVybiB0
eXBlIG9mIGdldF9wdGVfZmxhZ3MgdG8gdWludDY0X3QNCg0KU2lnbmVkLW9mZi1ieTogRmVsaXgg
S3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQpBY2tlZC1ieTogQ2hyaXN0aWFuIEvD
tm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5oICAgIHwgIDIgKy0NCiAuLi4vZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYyAgfCAzOSArKysrKysrKysrKy0tLS0tLS0tDQogMiBm
aWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkNCg0KZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuaCBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuaA0KaW5kZXggZTUxOWRmM2ZkMmI2
Li4xYWY4ZjgzZjdlMDIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfYW1ka2ZkLmgNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9h
bWRrZmQuaA0KQEAgLTU3LDcgKzU3LDcgQEAgc3RydWN0IGtnZF9tZW0gew0KIAl1bnNpZ25lZCBp
bnQgbWFwcGVkX3RvX2dwdV9tZW1vcnk7DQogCXVpbnQ2NF90IHZhOw0KIA0KLQl1aW50MzJfdCBt
YXBwaW5nX2ZsYWdzOw0KKwl1aW50MzJfdCBhbGxvY19mbGFnczsNCiANCiAJYXRvbWljX3QgaW52
YWxpZDsNCiAJc3RydWN0IGFtZGtmZF9wcm9jZXNzX2luZm8gKnByb2Nlc3NfaW5mbzsNCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMNCmluZGV4
IDQ0YTUyYjA5Y2M1OC4uYWFlMTlkMjIxZjQyIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMNCkBAIC0zNTUsNiArMzU1LDIzIEBAIHN0
YXRpYyBpbnQgdm1fdXBkYXRlX3BkcyhzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSwgc3RydWN0IGFtZGdw
dV9zeW5jICpzeW5jKQ0KIAlyZXR1cm4gYW1kZ3B1X3N5bmNfZmVuY2UoTlVMTCwgc3luYywgdm0t
Pmxhc3RfdXBkYXRlLCBmYWxzZSk7DQogfQ0KIA0KK3N0YXRpYyB1aW50NjRfdCBnZXRfcHRlX2Zs
YWdzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBzdHJ1Y3Qga2dkX21lbSAqbWVtKQ0KK3sN
CisJYm9vbCBjb2hlcmVudCA9IG1lbS0+YWxsb2NfZmxhZ3MgJiBBTExPQ19NRU1fRkxBR1NfQ09I
RVJFTlQ7DQorCXVpbnQzMl90IG1hcHBpbmdfZmxhZ3M7DQorDQorCW1hcHBpbmdfZmxhZ3MgPSBB
TURHUFVfVk1fUEFHRV9SRUFEQUJMRTsNCisJaWYgKG1lbS0+YWxsb2NfZmxhZ3MgJiBBTExPQ19N
RU1fRkxBR1NfV1JJVEFCTEUpDQorCQltYXBwaW5nX2ZsYWdzIHw9IEFNREdQVV9WTV9QQUdFX1dS
SVRFQUJMRTsNCisJaWYgKG1lbS0+YWxsb2NfZmxhZ3MgJiBBTExPQ19NRU1fRkxBR1NfRVhFQ1VU
QUJMRSkNCisJCW1hcHBpbmdfZmxhZ3MgfD0gQU1ER1BVX1ZNX1BBR0VfRVhFQ1VUQUJMRTsNCisN
CisJbWFwcGluZ19mbGFncyB8PSBjb2hlcmVudCA/DQorCQlBTURHUFVfVk1fTVRZUEVfVUMgOiBB
TURHUFVfVk1fTVRZUEVfTkM7DQorDQorCXJldHVybiBhbWRncHVfZ21jX2dldF9wdGVfZmxhZ3Mo
YWRldiwgbWFwcGluZ19mbGFncyk7DQorfQ0KKw0KIC8qIGFkZF9ib190b192bSAtIEFkZCBhIEJP
IHRvIGEgVk0NCiAgKg0KICAqIEV2ZXJ5dGhpbmcgdGhhdCBuZWVkcyB0byBibyBkb25lIG9ubHkg
b25jZSB3aGVuIGEgQk8gaXMgZmlyc3QgYWRkZWQNCkBAIC00MDMsOCArNDIwLDcgQEAgc3RhdGlj
IGludCBhZGRfYm9fdG9fdm0oc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHN0cnVjdCBrZ2Rf
bWVtICptZW0sDQogCX0NCiANCiAJYm9fdmFfZW50cnktPnZhID0gdmE7DQotCWJvX3ZhX2VudHJ5
LT5wdGVfZmxhZ3MgPSBhbWRncHVfZ21jX2dldF9wdGVfZmxhZ3MoYWRldiwNCi0JCQkJCQkJIG1l
bS0+bWFwcGluZ19mbGFncyk7DQorCWJvX3ZhX2VudHJ5LT5wdGVfZmxhZ3MgPSBnZXRfcHRlX2Zs
YWdzKGFkZXYsIG1lbSk7DQogCWJvX3ZhX2VudHJ5LT5rZ2RfZGV2ID0gKHZvaWQgKilhZGV2Ow0K
IAlsaXN0X2FkZCgmYm9fdmFfZW50cnktPmJvX2xpc3QsIGxpc3RfYm9fdmEpOw0KIA0KQEAgLTEw
ODEsNyArMTA5Nyw2IEBAIGludCBhbWRncHVfYW1ka2ZkX2dwdXZtX2FsbG9jX21lbW9yeV9vZl9n
cHUoDQogCWludCBieXRlX2FsaWduOw0KIAl1MzIgZG9tYWluLCBhbGxvY19kb21haW47DQogCXU2
NCBhbGxvY19mbGFnczsNCi0JdWludDMyX3QgbWFwcGluZ19mbGFnczsNCiAJaW50IHJldDsNCiAN
CiAJLyoNCkBAIC0xMTQzLDE2ICsxMTU4LDcgQEAgaW50IGFtZGdwdV9hbWRrZmRfZ3B1dm1fYWxs
b2NfbWVtb3J5X29mX2dwdSgNCiAJCQlhZGV2LT5hc2ljX3R5cGUgIT0gQ0hJUF9WRUdBTSkgPw0K
IAkJCVZJX0JPX1NJWkVfQUxJR04gOiAxOw0KIA0KLQltYXBwaW5nX2ZsYWdzID0gQU1ER1BVX1ZN
X1BBR0VfUkVBREFCTEU7DQotCWlmIChmbGFncyAmIEFMTE9DX01FTV9GTEFHU19XUklUQUJMRSkN
Ci0JCW1hcHBpbmdfZmxhZ3MgfD0gQU1ER1BVX1ZNX1BBR0VfV1JJVEVBQkxFOw0KLQlpZiAoZmxh
Z3MgJiBBTExPQ19NRU1fRkxBR1NfRVhFQ1VUQUJMRSkNCi0JCW1hcHBpbmdfZmxhZ3MgfD0gQU1E
R1BVX1ZNX1BBR0VfRVhFQ1VUQUJMRTsNCi0JaWYgKGZsYWdzICYgQUxMT0NfTUVNX0ZMQUdTX0NP
SEVSRU5UKQ0KLQkJbWFwcGluZ19mbGFncyB8PSBBTURHUFVfVk1fTVRZUEVfVUM7DQotCWVsc2UN
Ci0JCW1hcHBpbmdfZmxhZ3MgfD0gQU1ER1BVX1ZNX01UWVBFX05DOw0KLQkoKm1lbSktPm1hcHBp
bmdfZmxhZ3MgPSBtYXBwaW5nX2ZsYWdzOw0KKwkoKm1lbSktPmFsbG9jX2ZsYWdzID0gZmxhZ3M7
DQogDQogCWFtZGdwdV9zeW5jX2NyZWF0ZSgmKCptZW0pLT5zeW5jKTsNCiANCkBAIC0xNjI1LDkg
KzE2MzEsMTAgQEAgaW50IGFtZGdwdV9hbWRrZmRfZ3B1dm1faW1wb3J0X2RtYWJ1ZihzdHJ1Y3Qg
a2dkX2RldiAqa2dkLA0KIA0KIAlJTklUX0xJU1RfSEVBRCgmKCptZW0pLT5ib192YV9saXN0KTsN
CiAJbXV0ZXhfaW5pdCgmKCptZW0pLT5sb2NrKTsNCi0JKCptZW0pLT5tYXBwaW5nX2ZsYWdzID0N
Ci0JCUFNREdQVV9WTV9QQUdFX1JFQURBQkxFIHwgQU1ER1BVX1ZNX1BBR0VfV1JJVEVBQkxFIHwN
Ci0JCUFNREdQVV9WTV9QQUdFX0VYRUNVVEFCTEUgfCBBTURHUFVfVk1fTVRZUEVfTkM7DQorCSgq
bWVtKS0+YWxsb2NfZmxhZ3MgPQ0KKwkJKChiby0+cHJlZmVycmVkX2RvbWFpbnMgJiBBTURHUFVf
R0VNX0RPTUFJTl9WUkFNKSA/DQorCQkgQUxMT0NfTUVNX0ZMQUdTX1ZSQU0gOiBBTExPQ19NRU1f
RkxBR1NfR1RUKSB8DQorCQlBTExPQ19NRU1fRkxBR1NfV1JJVEFCTEUgfCBBTExPQ19NRU1fRkxB
R1NfRVhFQ1VUQUJMRTsNCiANCiAJKCptZW0pLT5ibyA9IGFtZGdwdV9ib19yZWYoYm8pOw0KIAko
Km1lbSktPnZhID0gdmE7DQotLSANCjIuMTcuMQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
