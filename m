Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A989EB15B9
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Sep 2019 23:10:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FDD16EDF6;
	Thu, 12 Sep 2019 21:10:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820059.outbound.protection.outlook.com [40.107.82.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E346EDF6
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Sep 2019 21:10:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ihL8UOG4DLIcMjo9KGFU8bA0551jd1EBjokhIQAjt0e5V8BZ7Egoce7PpTVyG29Thnb5TQEqvFixMmykwZ8m0A2IPeUPrKZOUoyOxqRuXGGkuGtGG8gKrcoB2vgO0e0AKVo1oT7oDcuIEDJUKA0JIGi2+lS47GaZcf27gcSwCHWJ2b5mo1pZo5I+fd948xD3LqXj8t/9MNezSJK8vS5Hr4pfZ8VMwLFFeHXuBw9xB+kyD5z2iuO6U6eSeHJaGVodS16sky1R0uH37DMwyGFyv/4ZybRteCb6868DRCCD/T9gI8ujvqrADzXV+IYDztbh4o2D2hXrjJnoFyPYDzyWkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vEdeeUeeK3Zt/pOOKZG2I3KHq0jzVomFGZy4+isdkrw=;
 b=kuVQOMgP141u14cTrSxYqwq8S7NwCGoiMmnJQyRrujI7daxXmwGQpXDsh8HLKhBPYfk/FFqp3x9HUV5BjcV3QsBS1T4HdDt/u2eU6UcmFfcRn2Y8SUXejCfsea4MPAhkxds9m/yKIvV8O79AHdssJ2eXzZz5AW8nwuD7N00kyrM55aA79Mqy3fY/bBdk2o5YQLxF8kilmg22lnIKBTSoWQqez0L6dr9Ut7CL4lhefsffdTnGXklmM3LM98+9sBTFzJ+Di8pcN01oJt8R28lKv0ECOPD6HzkTMW5KRmGjUTNW4FZzYxBZt0tMn3TCrwaDOBcDdD6Qy5ywlhcWpB2lgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3356.namprd12.prod.outlook.com (20.178.198.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.13; Thu, 12 Sep 2019 21:10:26 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2241.022; Thu, 12 Sep 2019
 21:10:26 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "S, Shirish" <Shirish.S@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [PATCH] drm/amdgpu: remove needless usage of #ifdef
Thread-Topic: [PATCH] drm/amdgpu: remove needless usage of #ifdef
Thread-Index: AQHVaTWQG9HQejgUn0WN5EZAJ35mCacoipKA
Date: Thu, 12 Sep 2019 21:10:26 +0000
Message-ID: <51c26192-0c92-7ebe-5a44-1f06808c932a@amd.com>
References: <1568270671-21346-1-git-send-email-shirish.s@amd.com>
In-Reply-To: <1568270671-21346-1-git-send-email-shirish.s@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTXPR0101CA0045.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::22) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2aed08c-29cb-409f-76a2-08d737c5a21d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3356; 
x-ms-traffictypediagnostic: DM6PR12MB3356:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB33566D844117049A79BF9EF492B00@DM6PR12MB3356.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(189003)(199004)(86362001)(53546011)(31696002)(81156014)(6506007)(102836004)(8676002)(386003)(81166006)(305945005)(99286004)(7736002)(4326008)(6486002)(8936002)(6636002)(31686004)(14454004)(25786009)(2906002)(229853002)(478600001)(52116002)(36756003)(256004)(186003)(71190400001)(71200400001)(66946007)(66446008)(65806001)(26005)(66066001)(66476007)(66556008)(6116002)(6436002)(65956001)(53936002)(6246003)(316002)(476003)(110136005)(58126008)(6512007)(3846002)(486006)(64756008)(5660300002)(76176011)(11346002)(2616005)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3356;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Oqjzn1+EBcSq+aQt2DnqZtQRA9cWYG7F/T1Ku9alQWtPJ/dRt3eMmHUxXO9F31OXMW9us9xMRWT3vspDXI7IbxsTZiZc7iEohKGmIHnd6UMWriVa/NZGnMlmAkV39H9afVtcERQE1T3HXRUlOhMyaQ3vGZTFhbHCsZQMwkECrTDxfeS32VBITRIPYeLTHjmw4gLJVgru/GljtFSBjvzweuK0OuTH7xGykq7T/docrNoia9kN/JWNuftWH9zx+6lvdnX4EKeSQXnTtim7YAAwXcn3WUQJZlV/RCnW38dtNJIjkOExMh027P8yemDDvR/+uCQsmwJh1AcrHXofsUkqK4w3a/Z1LKg2y4J0E30qUhiB6Ts9It5Wb6bj2L4Q3dyzpl5YiLt2gTCzJEtUC7ohY2tJm6MS0ZZoe1pBD1MPRlM=
Content-ID: <D93AD06C30E49147BE61730DEEFF2E91@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2aed08c-29cb-409f-76a2-08d737c5a21d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 21:10:26.5228 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: db7iFU6tLzrP7WkPCQDEKTHxvG7Quv6VltTZQASVr2It8NBqxUocVND14MgxnmVbCNhReUDqDIYbh5BFHsZZCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3356
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vEdeeUeeK3Zt/pOOKZG2I3KHq0jzVomFGZy4+isdkrw=;
 b=uOLT79IMjV2mAXasv3DQbU4HTEqZT7tBqcy2dlYbhCM6FnQ/yWzki/7UZt2kq6ngLW5MjXoxWz9DdhmJf+Bkno9jJVolF4xg6LG1pzZv8gV8RYPvjbzZnhPclJDDr4vqhK5jjMOiUxbP9t1GWhm5TA7yYJ+u3/7hTx5sTkYzizA=
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wOS0xMiAyOjQ0IGEubS4sIFMsIFNoaXJpc2ggd3JvdGU6DQo+IGRlZmluZSBzY2hl
ZF9wb2xpY3kgaW4gY2FzZSBDT05GSUdfSFNBX0FNRCBpcyBub3QNCj4gZW5hYmxlZCwgd2l0aCB0
aGlzIHRoZXJlIGlzIG5vIG5lZWQgdG8gY2hlY2sgZm9yIENPTkZJR19IU0FfQU1EDQo+IGVsc2Ug
d2hlcmUgaW4gZHJpdmVyIGNvZGUuDQo+DQo+IFN1Z2dlc3RlZC1ieTogRmVsaXggS3VlaGxpbmcg
PEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFNoaXJpc2ggUyA8c2hp
cmlzaC5zQGFtZC5jb20+DQoNClJldmlld2VkLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3Vl
aGxpbmdAYW1kLmNvbT4NCg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdS5oICAgICAgICB8IDIgKysNCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZGV2aWNlLmMgfCA2ICstLS0tLQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUu
aA0KPiBpbmRleCBhMTUxNmEzLi42ZmYwMmJiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHUuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHUuaA0KPiBAQCAtMTcxLDYgKzE3MSw4IEBAIGV4dGVybiBpbnQgYW1kZ3B1X25vcmV0
cnk7DQo+ICAgZXh0ZXJuIGludCBhbWRncHVfZm9yY2VfYXNpY190eXBlOw0KPiAgICNpZmRlZiBD
T05GSUdfSFNBX0FNRA0KPiAgIGV4dGVybiBpbnQgc2NoZWRfcG9saWN5Ow0KPiArI2Vsc2UNCj4g
K3N0YXRpYyBjb25zdCBpbnQgc2NoZWRfcG9saWN5ID0gS0ZEX1NDSEVEX1BPTElDWV9IV1M7DQo+
ICAgI2VuZGlmDQo+ICAgDQo+ICAgI2lmZGVmIENPTkZJR19EUk1fQU1ER1BVX1NJDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMNCj4gaW5kZXggNzQwNjM4ZS4u
M2I1MjgyYiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2RldmljZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZp
Y2UuYw0KPiBAQCAtMTYyMywxMSArMTYyMyw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RldmljZV9p
cF9lYXJseV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPiAgIAl9DQo+ICAgDQo+
ICAgCWFkZXYtPnBtLnBwX2ZlYXR1cmUgPSBhbWRncHVfcHBfZmVhdHVyZV9tYXNrOw0KPiAtCWlm
IChhbWRncHVfc3Jpb3ZfdmYoYWRldikNCj4gLQkgICAgI2lmZGVmIENPTkZJR19IU0FfQU1EDQo+
IC0JICAgIHx8IHNjaGVkX3BvbGljeSA9PSBLRkRfU0NIRURfUE9MSUNZX05PX0hXUw0KPiAtCSAg
ICAjZW5kaWYNCj4gLQkgICAgKQ0KPiArCWlmIChhbWRncHVfc3Jpb3ZfdmYoYWRldikgfHwgc2No
ZWRfcG9saWN5ID09IEtGRF9TQ0hFRF9QT0xJQ1lfTk9fSFdTKQ0KPiAgIAkJYWRldi0+cG0ucHBf
ZmVhdHVyZSAmPSB+UFBfR0ZYT0ZGX01BU0s7DQo+ICAgDQo+ICAgCWZvciAoaSA9IDA7IGkgPCBh
ZGV2LT5udW1faXBfYmxvY2tzOyBpKyspIHsNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
