Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 094D2C0724
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Sep 2019 16:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2066E895;
	Fri, 27 Sep 2019 14:18:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710067.outbound.protection.outlook.com [40.107.71.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6275A6E895
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Sep 2019 14:18:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AaBtEDucPIRaTpAtycdFEVECD2Zq3qpMbv/Jy3PLn+c4rPPtKcjZ8V9EP1k6O+E+kdv4FBvWYUDp2tIjlwNzBBLkdDe8y4kMUNhU/pzbBTakDULshNhTDdvhp7ilUTHhe6hCZdnwIQMaJ9t64UIzOBmHFX1+QT5rO0wjMvevcaaQR6puojpKaek4HAPcmHbOAtDDewIHO4njETLTkYNjMysrvDIxOLo6MJSo3NrDx43kBAPJlmkAmcZ4ny2siGp9Yysa6UmP/VsRT0UuPOOLwqg/THzu9sEqZVjg4U1+47N2AwoyeTH2ZgytASsQU1pp4ryOQQwpFFO/q5Z37BZ7Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTzvkdf/opUwm956Is59vrV+pWR94m+QQ9dy8mC2z+0=;
 b=Md1xDaS9sjykeWObhZ3F3sTAd/S07uaT/51ZNwEne4T5YRNsIj6VXMU7fK8MkOpxc8J3SRoX+gA3ZX+fZihrU1pncMhIPnao6XEpV6m+8QfMNlE0ZYe44cXR+1sfss8C+UFO+oB17VPFZuIrWUI6QjVSb7Dov3Ys9IY/A9z6CZDXohAcRJbp4o7gQstmKqOrGQcYQajRjlsW7ivzvO76VneTACIddZqHNCtMS1V641oI/7ymNzxqeMgjRSe67r+QbaXh6OHzPqFRYdjnjbRPCjovZSdn7Q3Zp/Kr5RIbHTDQ3ItqlkCfrM1hHgc7Eh8gJKQrKqsOM+szpKcehu9fvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3673.namprd12.prod.outlook.com (10.255.76.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Fri, 27 Sep 2019 14:18:40 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2284.023; Fri, 27 Sep 2019
 14:18:40 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Liang, Prike" <Prike.Liang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdkfd: fix kgd2kfd_device_init() definition conflict
 error
Thread-Topic: [PATCH] drm/amdkfd: fix kgd2kfd_device_init() definition
 conflict error
Thread-Index: AQHVdOy5Gdeati0HikqkW7SHta/wu6c/kw6A
Date: Fri, 27 Sep 2019 14:18:40 +0000
Message-ID: <c7587938-62b1-e050-5d0f-073f94827e51@amd.com>
References: <1569558805-30951-1-git-send-email-Prike.Liang@amd.com>
In-Reply-To: <1569558805-30951-1-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.54.211]
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-clientproxiedby: YTOPR0101CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::37) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4be54c1f-9a93-4c51-bd1e-08d743559816
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB3673; 
x-ms-traffictypediagnostic: DM6PR12MB3673:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB36732D6AA340FAB9544158BF92810@DM6PR12MB3673.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(189003)(199004)(64756008)(66446008)(478600001)(66476007)(2906002)(26005)(14454004)(6486002)(53546011)(6436002)(54906003)(14444005)(6512007)(229853002)(99286004)(71190400001)(102836004)(71200400001)(6116002)(186003)(58126008)(110136005)(52116002)(81156014)(81166006)(3846002)(8936002)(256004)(5660300002)(65806001)(386003)(6506007)(446003)(486006)(11346002)(2501003)(476003)(86362001)(76176011)(2616005)(8676002)(65956001)(66066001)(66946007)(316002)(36756003)(31686004)(4326008)(25786009)(305945005)(66556008)(6246003)(31696002)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3673;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7bvBZKGkcxILZr/auLgIQ+bRBdJsLj6jhiaZCOuy0xmO3cyfSsdGiM0ua66HZsGs5RKiySIDiWZ5ItBleX1I7k7OOUyHpO9rzzg4x4FbLsxNyxrlAHfOVqr6ja8pEsvEJIxwc9l7KyhVWRuDw1U4KXJzOtiNOjT8lwjFN3NjTYbE60beErRXIy5nwMJnrSY9CpelhKk+AZAMzIXdY19K9xKkc+Rn5fCeI/4l8BkcxcgE4xEerX3GetTH90+3pAUPuQhCe1t9LHxj1gRhBkHYTVUJWvQ9WTWwqqKvNbyI0BA90DpnckTYxL827Hmol8wuUNCtbq+ramBafmotlen3+CcOngGsCLc2HAgolqPG6Ffh7t5m8f5YXTT+Vb/z94dYBFIBkJKBD2sMzbmBRCaA8ICTBpqNPxCK/fJnpf7NFTQ=
Content-ID: <C3F56431CDC6254BAD0714CAB456A7CB@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4be54c1f-9a93-4c51-bd1e-08d743559816
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 14:18:40.0891 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +tL+gN/0C1G0jhDl6C5Z1IdBtOdg3NCF9iQOOT9FW/bSXaTWBcAXc87L3GyC6qORzD5etcX69ANFNiab0EvThA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3673
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTzvkdf/opUwm956Is59vrV+pWR94m+QQ9dy8mC2z+0=;
 b=eidzW8PwV6I4MBekPgYRZNo1MPQs2BK3s+8Z4r47e9Au7yJD7KO4LOHDnyzoQDsj34CkfYsL6seBMxSj7LmUy5mB2lxLtT3P6WPwa0x7xTTWW0hic+6oTvCVStN0XYrCddUkekMvjT7kJLkzXjgQnpo3BmQxRfCK/v/yZOIWYtA=
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Kasiviswanathan,
 Harish" <Harish.Kasiviswanathan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wOS0yNyAwOjMzLCBMaWFuZywgUHJpa2Ugd3JvdGU6DQo+IFRoZSBwYXRjaCBjNjcw
NzA3IGRybS9hbWQ6IFBhc3MgZHJtX2RldmljZSB0byBrZmQgaW50cm9kdWNlZCB0aGlzIGlzc3Vl
IGFuZA0KPiBmaXggdGhlIGZvbGxvd2luZyBjb21waWxlciBlcnJvci4NCj4NCj4gICAgQ0MgW01d
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8vLi4vcG93ZXJwbGF5L3NtdW1nci9maWppX3Nt
dW1nci5vDQo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly9hbWRncHVfYW1ka2ZkLmM6NzQ2
OjY6IGVycm9yOiBjb25mbGljdGluZyB0eXBlcyBmb3Ig4oCYa2dkMmtmZF9kZXZpY2VfaW5pdOKA
mQ0KPiAgIGJvb2wga2dkMmtmZF9kZXZpY2VfaW5pdChzdHJ1Y3Qga2ZkX2RldiAqa2ZkLA0KPiAg
ICAgICAgXg0KPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvL2FtZGdwdV9hbWRrZmQuYzoyMzowOg0KPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8v
YW1kZ3B1X2FtZGtmZC5oOjI1Mzo2OiBub3RlOiBwcmV2aW91cyBkZWNsYXJhdGlvbiBvZiDigJhr
Z2Qya2ZkX2RldmljZV9pbml04oCZIHdhcyBoZXJlDQo+ICAgYm9vbCBrZ2Qya2ZkX2RldmljZV9p
bml0KHN0cnVjdCBrZmRfZGV2ICprZmQsDQo+ICAgICAgICBeDQo+IHNjcmlwdHMvTWFrZWZpbGUu
YnVpbGQ6MjczOiByZWNpcGUgZm9yIHRhcmdldCAnZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
L2FtZGdwdV9hbWRrZmQubycgZmFpbGVkDQo+IG1ha2VbMV06ICoqKiBbZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvL2FtZGdwdV9hbWRrZmQub10gRXJyb3IgMQ0KPg0KPiBTaWduZWQtb2ZmLWJ5
OiBQcmlrZSBMaWFuZyA8UHJpa2UuTGlhbmdAYW1kLmNvbT4NCg0KVGhpcyBmaXggaXMgZm9yIHRo
ZSBjYXNlIHRoYXQgQ09ORklHX0hTQV9BTUQgaXMgZGlzYWJsZWQuIFNvcnJ5IGZvciANCm1pc3Np
bmcgdGhhdCB3aGVuIHJldmlld2luZyBIYXJpc2gncyBjb2RlLg0KDQpSZXZpZXdlZC1ieTogRmVs
aXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQoNCg0KPiAtLS0NCj4gICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmMgfCAxICsNCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9hbWRrZmQuYw0KPiBpbmRleCAyMjEwNDdkLi45MjY2NmIxIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5jDQo+IEBAIC03NDQsNiArNzQ0
LDcgQEAgc3RydWN0IGtmZF9kZXYgKmtnZDJrZmRfcHJvYmUoc3RydWN0IGtnZF9kZXYgKmtnZCwg
c3RydWN0IHBjaV9kZXYgKnBkZXYsDQo+ICAgfQ0KPiAgIA0KPiAgIGJvb2wga2dkMmtmZF9kZXZp
Y2VfaW5pdChzdHJ1Y3Qga2ZkX2RldiAqa2ZkLA0KPiArCQkJIHN0cnVjdCBkcm1fZGV2aWNlICpk
ZGV2LA0KPiAgIAkJCSBjb25zdCBzdHJ1Y3Qga2dkMmtmZF9zaGFyZWRfcmVzb3VyY2VzICpncHVf
cmVzb3VyY2VzKQ0KPiAgIHsNCj4gICAJcmV0dXJuIGZhbHNlOw0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
