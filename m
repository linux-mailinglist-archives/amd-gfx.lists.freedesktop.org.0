Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BD7142BD8
	for <lists+amd-gfx@lfdr.de>; Mon, 20 Jan 2020 14:12:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0492C89CC9;
	Mon, 20 Jan 2020 13:12:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700079.outbound.protection.outlook.com [40.107.70.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E196E89CC9
 for <amd-gfx@lists.freedesktop.org>; Mon, 20 Jan 2020 13:12:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I7er60z6le4ws6TcJ1fLu7JpvPCabWPIaolNmT5YQsnNTIXp0belKFVqsnIkpwts6QPQgEcqclG+lJbW6j2U64cwhCUX062uNqatnMLn57USiM/dll1eGl/K43fF63yntopY5F7RtrDhptKGakmlRZZByxWnJEG14xx05FAmN8CWTD7+gIgWi9InGWO0vGe58TBEYYG09gEDb88V3IRwJkdwOWMlyMPiKXQuf7JnQkB4P04zu5Ll82LHYTS9ZYqd8FlhVIp7WPdXaa0z5Nmknl/O7lYBn24kPcttwIrRbLVgK7iCe7HufOxZWok/MKLWd2+5Qlv7uYzYACYzVwPRWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7D5ZRwQcoN5aToW/HzLoeGHbBUe3+9E1Rau96qjJFg8=;
 b=Go5djvy10QXWRJzGpipG9j75x48Li8ho8oCpMgwi/Kiuo2lxT1j8iCSVHQ/7k55CRylk0dWhzfjH06Jikw+tqgrm2Lxmo0x9/ldVoOpzWhj/uC0YA6K43Qnq2QpJAxWcXf9iB1KPoU62kTSzvR3iGllFZ1WOIqvSWvAhqP4IgmEq1F4ayo/Srkf8w/mVI7O6A9GNExp2Ca5e9CEuwmub64J7aakLrDYXj02lWNDsl4YxWLAAfjEf+mB09TeypbSwyDNmOOS+M05AVBspPY6h+/SOj6Iz5rRVhNErj/INnf+r2RqwEkch1XPkue3PaXPBXKPV1FRrJPEPCu21slCHSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7D5ZRwQcoN5aToW/HzLoeGHbBUe3+9E1Rau96qjJFg8=;
 b=BZxLkUhRcHKbnt2jxQluAaF15nBkgjqZqEn9LkPetjDmaNWE316sQbXNkPNVW2cGpZV7ly56zE9/6l+5UC9+ZcBgPilveiWmw8xiPTq2VZelfI41R4R0z1R7xMUbVf4S5cTM3b0A59xQ40VcgNwaBdoBIbSGXRT6Jqgw46aKyrQ=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2454.namprd12.prod.outlook.com (52.132.208.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.19; Mon, 20 Jan 2020 13:11:44 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::8dde:b52a:d97a:e89]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::8dde:b52a:d97a:e89%2]) with mapi id 15.20.2644.026; Mon, 20 Jan 2020
 13:11:44 +0000
Subject: Re: [PATCH] drm/amdgpu: remove unnecessary conversion to bool
To: Nirmoy Das <nirmoy.aiemd@gmail.com>, amd-gfx@lists.freedesktop.org
References: <20200120125806.4895-1-nirmoy.das@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ee6665fc-9aae-229e-2551-4c09ccadc496@amd.com>
Date: Mon, 20 Jan 2020 14:11:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200120125806.4895-1-nirmoy.das@amd.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR01CA0052.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:e6::29) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR01CA0052.eurprd01.prod.exchangelabs.com (2603:10a6:208:e6::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.20 via Frontend
 Transport; Mon, 20 Jan 2020 13:11:42 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a9e7a345-d1dc-498e-6b4a-08d79daa4ba9
X-MS-TrafficTypeDiagnostic: DM5PR12MB2454:|DM5PR12MB2454:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB24544317D27403ED8141BC2983320@DM5PR12MB2454.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 0288CD37D9
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(346002)(366004)(396003)(199004)(189003)(30864003)(2616005)(36756003)(52116002)(5660300002)(16526019)(186003)(4326008)(316002)(2906002)(66574012)(86362001)(6486002)(478600001)(31686004)(6666004)(31696002)(81156014)(81166006)(8676002)(66476007)(66556008)(66946007)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2454;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ybH8PQNUHGYgNSL3y0yVCk1tXXkWb6NoUzVUXoVy7HxTMqehAh46lBzkJw1WnVxD44BbQW2nxstwPSXqNmmhGMHYotrf0Bia9GUmdrX4ksG6gLztVFMUgCOHHS+kQc9DrTCq6uK1NGzy4ZOxeMFu/E1VT86PPQ9bfJB3ZZCYBpIjtM+gZrzDBQlVJuzLv+0vXw6Lc6e6z2lvdnszwjAwZqcEdUDoDVT+j58thChONRcbk6jyTxoyiLWxBd8ku2ayXG2t8MeAgU3g27gpM+//8MpmRnqhtsew32yz/y2hIuEfqNr7w8nK7yd/d4j67PZNk3gzqQA0GE1IxNA+i+SZvxyHNqQyJm8yxZbr48S9mh9yoNiyf9QXFl06gcCvovgl6c9d9yVHKSdOtCR0t0Dvr6Asei6URK3+y3vuuMzbHpFOFypVQDbxzy81laCcOBdG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9e7a345-d1dc-498e-6b4a-08d79daa4ba9
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2020 13:11:43.9378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rtlkroAYhOaRVXKXsChpfIvr8bytD4VL0holvPJprqoJMxWbaKeZWy9b5rsf7Mgk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2454
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: alexander.deucher@amd.com, kenny.ho@amd.com, nirmoy.das@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2VsbCB0aGF0J3MgcmF0aGVyIG5pY2UgdG8gaGF2ZSwgYnV0IEkgd291bGQgYWRkIHNvbWV0aGlu
ZyBsaWtlIHRoZSAKZm9sbG93aW5nIGFzIGNvbW1pdCBtZXNzYWdlOgoKIkJldHRlciBjbGVhbiB0
aGF0IHVwIGJlZm9yZSBzb21lIGF1dG9tYXRpb24gc3RhcnRzIHRvIGNvbXBsYWluIGFib3V0IGl0
LiIKCkFtIDIwLjAxLjIwIHVtIDEzOjU4IHNjaHJpZWIgTmlybW95IERhczoKPiBTaWduZWQtb2Zm
LWJ5OiBOaXJtb3kgRGFzIDxuaXJtb3kuZGFzQGFtZC5jb20+CgpXaXRoIHRoZSBjb21taXQgbWVz
c2FnZSBjaGFuZ2VkIHRoZSBwYXRjaCBpcyBBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyAKPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4uCgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+IC0tLQo+ICAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FjcC5jICAgIHwgIDIgKy0KPiAgIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8ICAyICstCj4gICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hdGh1Yl92MV8wLmMgICAgfCAgNCArKy0tCj4gICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hdGh1Yl92Ml8wLmMgICAgfCAgNCArKy0tCj4gICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYyAgICAgfCAgNCArKy0tCj4gICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jICAgICAgfCAgNCArKy0tCj4gICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9qcGVnX3YyXzAuYyAgICAgfCAgMiArLQo+ICAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvanBlZ192Ml81LmMgICAgIHwgIDIgKy0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3YxXzAuYyAgICB8ICA0ICsrLS0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3YyXzAuYyAgICB8ICA0ICsrLS0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3Y5XzQuYyAgICB8ICA0ICsrLS0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L25hdmkxMF9paC5jICAgICB8ICAyICstCj4gICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9udi5jICAgICAgICAgICAgfCAgOCArKystLS0tCj4gICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYyAgICAgfCAgNCArKy0tCj4gICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y1XzAuYyAgICAgfCAgNCArKy0tCj4gICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9zaV9kbWEuYyAgICAgICAgfCAgMiArLQo+ICAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyAgICAgICAgIHwgMjggKysrKysrKysrKystLS0tLS0t
LS0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y1XzAuYyAgICAgIHwgIDIg
Ky0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92Nl8wLmMgICAgICB8ICAyICst
Cj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y2VfdjNfMC5jICAgICAgfCAgMiArLQo+
ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNlX3Y0XzAuYyAgICAgIHwgIDIgKy0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92MV8wLmMgICAgICB8ICAyICstCj4gICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jICAgICAgfCAgMiArLQo+ICAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzUuYyAgICAgIHwgIDIgKy0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZlZ2ExMF9paC5jICAgICB8ICAyICstCj4gICAyNSBmaWxl
cyBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspLCA1MCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYWNwLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYWNwLmMKPiBpbmRleCA4MjE1NWFjMzI4OGEuLjEyMjQ3
YTMyZjllZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
YWNwLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYWNwLmMKPiBA
QCAtNTI3LDcgKzUyNyw3IEBAIHN0YXRpYyBpbnQgYWNwX3NldF9wb3dlcmdhdGluZ19zdGF0ZSh2
b2lkICpoYW5kbGUsCj4gICAJCQkJICAgICBlbnVtIGFtZF9wb3dlcmdhdGluZ19zdGF0ZSBzdGF0
ZSkKPiAgIHsKPiAgIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqKWhhbmRsZTsKPiAtCWJvb2wgZW5hYmxlID0gc3RhdGUgPT0gQU1EX1BHX1NUQVRF
X0dBVEUgPyB0cnVlIDogZmFsc2U7Cj4gKwlib29sIGVuYWJsZSA9IChzdGF0ZSA9PSBBTURfUEdf
U1RBVEVfR0FURSk7Cj4gICAKPiAgIAlpZiAoYWRldi0+cG93ZXJwbGF5LnBwX2Z1bmNzICYmCj4g
ICAJCWFkZXYtPnBvd2VycGxheS5wcF9mdW5jcy0+c2V0X3Bvd2VyZ2F0aW5nX2J5X3NtdSkKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCj4gaW5kZXggZjU4ZWM5
ZWRiNzNmLi4xZGEwMzY1ODg5MWMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2RldmljZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2RldmljZS5jCj4gQEAgLTk4Niw3ICs5ODYsNyBAQCBzdGF0aWMgdm9pZCBhbWRncHVf
ZGV2aWNlX2NoZWNrX3ZtX3NpemUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gICBzdGF0
aWMgdm9pZCBhbWRncHVfZGV2aWNlX2NoZWNrX3NtdV9wcnZfYnVmZmVyX3NpemUoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpCj4gICB7Cj4gICAJc3RydWN0IHN5c2luZm8gc2k7Cj4gLQlib29s
IGlzX29zXzY0ID0gKHNpemVvZih2b2lkICopID09IDgpID8gdHJ1ZSA6IGZhbHNlOwo+ICsJYm9v
bCBpc19vc182NCA9IChzaXplb2Yodm9pZCAqKSA9PSA4KTsKPiAgIAl1aW50NjRfdCB0b3RhbF9t
ZW1vcnk7Cj4gICAJdWludDY0X3QgZHJhbV9zaXplX3NldmVuX0dCID0gMHgxQjgwMDAwMDA7Cj4g
ICAJdWludDY0X3QgZHJhbV9zaXplX3RocmVlX0dCID0gMHhCODAwMDAwMDsKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYXRodWJfdjFfMC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYXRodWJfdjFfMC5jCj4gaW5kZXggZDljYzc0NmFmNWU2Li44NDdjYTli
M2NlNGUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYXRodWJfdjFf
MC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYXRodWJfdjFfMC5jCj4gQEAg
LTc0LDkgKzc0LDkgQEAgaW50IGF0aHViX3YxXzBfc2V0X2Nsb2NrZ2F0aW5nKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LAo+ICAgCWNhc2UgQ0hJUF9WRUdBMjA6Cj4gICAJY2FzZSBDSElQX1JB
VkVOOgo+ICAgCQlhdGh1Yl91cGRhdGVfbWVkaXVtX2dyYWluX2Nsb2NrX2dhdGluZyhhZGV2LAo+
IC0JCQkJc3RhdGUgPT0gQU1EX0NHX1NUQVRFX0dBVEUgPyB0cnVlIDogZmFsc2UpOwo+ICsJCQkJ
c3RhdGUgPT0gQU1EX0NHX1NUQVRFX0dBVEUpOwo+ICAgCQlhdGh1Yl91cGRhdGVfbWVkaXVtX2dy
YWluX2xpZ2h0X3NsZWVwKGFkZXYsCj4gLQkJCQlzdGF0ZSA9PSBBTURfQ0dfU1RBVEVfR0FURSA/
IHRydWUgOiBmYWxzZSk7Cj4gKwkJCQlzdGF0ZSA9PSBBTURfQ0dfU1RBVEVfR0FURSk7Cj4gICAJ
CWJyZWFrOwo+ICAgCWRlZmF1bHQ6Cj4gICAJCWJyZWFrOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hdGh1Yl92Ml8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hdGh1Yl92Ml8wLmMKPiBpbmRleCBjZWI5YWE0ZGYwZTcuLjkyMWE2OWFiZGE1NSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hdGh1Yl92Ml8wLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hdGh1Yl92Ml8wLmMKPiBAQCAtNzcsOSArNzcs
OSBAQCBpbnQgYXRodWJfdjJfMF9zZXRfY2xvY2tnYXRpbmcoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsCj4gICAJY2FzZSBDSElQX05BVkkxNDoKPiAgIAljYXNlIENISVBfTkFWSTEyOgo+ICAg
CQlhdGh1Yl92Ml8wX3VwZGF0ZV9tZWRpdW1fZ3JhaW5fY2xvY2tfZ2F0aW5nKGFkZXYsCj4gLQkJ
CQlzdGF0ZSA9PSBBTURfQ0dfU1RBVEVfR0FURSA/IHRydWUgOiBmYWxzZSk7Cj4gKwkJCQlzdGF0
ZSA9PSBBTURfQ0dfU1RBVEVfR0FURSk7Cj4gICAJCWF0aHViX3YyXzBfdXBkYXRlX21lZGl1bV9n
cmFpbl9saWdodF9zbGVlcChhZGV2LAo+IC0JCQkJc3RhdGUgPT0gQU1EX0NHX1NUQVRFX0dBVEUg
PyB0cnVlIDogZmFsc2UpOwo+ICsJCQkJc3RhdGUgPT0gQU1EX0NHX1NUQVRFX0dBVEUpOwo+ICAg
CQlicmVhazsKPiAgIAlkZWZhdWx0Ogo+ICAgCQlicmVhazsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nZnhfdjEwXzAuYwo+IGluZGV4IDE4ZDc5ZTgzZWYzZi4uZTU1YTJjMDU4Y2FkIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKPiBAQCAtNDIzMCw3ICs0MjMw
LDcgQEAgc3RhdGljIGludCBnZnhfdjEwXzBfc2V0X3Bvd2VyZ2F0aW5nX3N0YXRlKHZvaWQgKmhh
bmRsZSwKPiAgIAkJCQkJICBlbnVtIGFtZF9wb3dlcmdhdGluZ19zdGF0ZSBzdGF0ZSkKPiAgIHsK
PiAgIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
KWhhbmRsZTsKPiAtCWJvb2wgZW5hYmxlID0gKHN0YXRlID09IEFNRF9QR19TVEFURV9HQVRFKSA/
IHRydWUgOiBmYWxzZTsKPiArCWJvb2wgZW5hYmxlID0gKHN0YXRlID09IEFNRF9QR19TVEFURV9H
QVRFKTsKPiAgIAlzd2l0Y2ggKGFkZXYtPmFzaWNfdHlwZSkgewo+ICAgCWNhc2UgQ0hJUF9OQVZJ
MTA6Cj4gICAJY2FzZSBDSElQX05BVkkxNDoKPiBAQCAtNDI1Niw3ICs0MjU2LDcgQEAgc3RhdGlj
IGludCBnZnhfdjEwXzBfc2V0X2Nsb2NrZ2F0aW5nX3N0YXRlKHZvaWQgKmhhbmRsZSwKPiAgIAlj
YXNlIENISVBfTkFWSTE0Ogo+ICAgCWNhc2UgQ0hJUF9OQVZJMTI6Cj4gICAJCWdmeF92MTBfMF91
cGRhdGVfZ2Z4X2Nsb2NrX2dhdGluZyhhZGV2LAo+IC0JCQkJCQkgc3RhdGUgPT0gQU1EX0NHX1NU
QVRFX0dBVEUgPyB0cnVlIDogZmFsc2UpOwo+ICsJCQkJCQkgc3RhdGUgPT0gQU1EX0NHX1NUQVRF
X0dBVEUpOwo+ICAgCQlicmVhazsKPiAgIAlkZWZhdWx0Ogo+ICAgCQlicmVhazsKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKPiBpbmRleCAzYTg0MWRjMjA0NzQuLjMzZTg1MWFk
NDk0MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwo+IEBAIC00NjUy
LDcgKzQ2NTIsNyBAQCBzdGF0aWMgaW50IGdmeF92OV8wX3NldF9wb3dlcmdhdGluZ19zdGF0ZSh2
b2lkICpoYW5kbGUsCj4gICAJCQkJCSAgZW51bSBhbWRfcG93ZXJnYXRpbmdfc3RhdGUgc3RhdGUp
Cj4gICB7Cj4gICAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKiloYW5kbGU7Cj4gLQlib29sIGVuYWJsZSA9IChzdGF0ZSA9PSBBTURfUEdfU1RBVEVf
R0FURSkgPyB0cnVlIDogZmFsc2U7Cj4gKwlib29sIGVuYWJsZSA9IChzdGF0ZSA9PSBBTURfUEdf
U1RBVEVfR0FURSk7Cj4gICAKPiAgIAlzd2l0Y2ggKGFkZXYtPmFzaWNfdHlwZSkgewo+ICAgCWNh
c2UgQ0hJUF9SQVZFTjoKPiBAQCAtNDcxNCw3ICs0NzE0LDcgQEAgc3RhdGljIGludCBnZnhfdjlf
MF9zZXRfY2xvY2tnYXRpbmdfc3RhdGUodm9pZCAqaGFuZGxlLAo+ICAgCWNhc2UgQ0hJUF9BUkNU
VVJVUzoKPiAgIAljYXNlIENISVBfUkVOT0lSOgo+ICAgCQlnZnhfdjlfMF91cGRhdGVfZ2Z4X2Ns
b2NrX2dhdGluZyhhZGV2LAo+IC0JCQkJCQkgc3RhdGUgPT0gQU1EX0NHX1NUQVRFX0dBVEUgPyB0
cnVlIDogZmFsc2UpOwo+ICsJCQkJCQkgc3RhdGUgPT0gQU1EX0NHX1NUQVRFX0dBVEUpOwo+ICAg
CQlicmVhazsKPiAgIAlkZWZhdWx0Ogo+ICAgCQlicmVhazsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvanBlZ192Ml8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9qcGVnX3YyXzAuYwo+IGluZGV4IGE3ODI5MmQ4NDg1NC4uZmYyZTZlMWNjZGU3IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2pwZWdfdjJfMC5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvanBlZ192Ml8wLmMKPiBAQCAtNjkwLDcgKzY5MCw3
IEBAIHN0YXRpYyBpbnQganBlZ192Ml8wX3NldF9jbG9ja2dhdGluZ19zdGF0ZSh2b2lkICpoYW5k
bGUsCj4gICAJCQkJCSAgZW51bSBhbWRfY2xvY2tnYXRpbmdfc3RhdGUgc3RhdGUpCj4gICB7Cj4g
ICAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKilo
YW5kbGU7Cj4gLQlib29sIGVuYWJsZSA9IChzdGF0ZSA9PSBBTURfQ0dfU1RBVEVfR0FURSkgPyB0
cnVlIDogZmFsc2U7Cj4gKwlib29sIGVuYWJsZSA9IChzdGF0ZSA9PSBBTURfQ0dfU1RBVEVfR0FU
RSk7Cj4gICAKPiAgIAlpZiAoZW5hYmxlKSB7Cj4gICAJCWlmIChqcGVnX3YyXzBfaXNfaWRsZSho
YW5kbGUpKQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9qcGVnX3Yy
XzUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2pwZWdfdjJfNS5jCj4gaW5kZXggMmM1
ODkzOWU2YWQwLi5jNmQwNDZkZjRiNzAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvanBlZ192Ml81LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9q
cGVnX3YyXzUuYwo+IEBAIC00NjksNyArNDY5LDcgQEAgc3RhdGljIGludCBqcGVnX3YyXzVfc2V0
X2Nsb2NrZ2F0aW5nX3N0YXRlKHZvaWQgKmhhbmRsZSwKPiAgIAkJCQkJICBlbnVtIGFtZF9jbG9j
a2dhdGluZ19zdGF0ZSBzdGF0ZSkKPiAgIHsKPiAgIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diA9IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWhhbmRsZTsKPiAtCWJvb2wgZW5hYmxlID0gKHN0
YXRlID09IEFNRF9DR19TVEFURV9HQVRFKSA/IHRydWUgOiBmYWxzZTsKPiArCWJvb2wgZW5hYmxl
ID0gKHN0YXRlID09IEFNRF9DR19TVEFURV9HQVRFKTsKPiAgIAlpbnQgaTsKPiAgIAo+ICAgCWZv
ciAoaSA9IDA7IGkgPCBhZGV2LT5qcGVnLm51bV9qcGVnX2luc3Q7ICsraSkgewo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92MV8wLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92MV8wLmMKPiBpbmRleCBhZGZkOGE2MTcxZWIuLjQ5YTNh
NTZlYzAxNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92
MV8wLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92MV8wLmMKPiBA
QCAtNTIzLDkgKzUyMyw5IEBAIGludCBtbWh1Yl92MV8wX3NldF9jbG9ja2dhdGluZyhzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwKPiAgIAljYXNlIENISVBfUkFWRU46Cj4gICAJY2FzZSBDSElQ
X1JFTk9JUjoKPiAgIAkJbW1odWJfdjFfMF91cGRhdGVfbWVkaXVtX2dyYWluX2Nsb2NrX2dhdGlu
ZyhhZGV2LAo+IC0JCQkJc3RhdGUgPT0gQU1EX0NHX1NUQVRFX0dBVEUgPyB0cnVlIDogZmFsc2Up
Owo+ICsJCQkJc3RhdGUgPT0gQU1EX0NHX1NUQVRFX0dBVEUpOwo+ICAgCQltbWh1Yl92MV8wX3Vw
ZGF0ZV9tZWRpdW1fZ3JhaW5fbGlnaHRfc2xlZXAoYWRldiwKPiAtCQkJCXN0YXRlID09IEFNRF9D
R19TVEFURV9HQVRFID8gdHJ1ZSA6IGZhbHNlKTsKPiArCQkJCXN0YXRlID09IEFNRF9DR19TVEFU
RV9HQVRFKTsKPiAgIAkJYnJlYWs7Cj4gICAJZGVmYXVsdDoKPiAgIAkJYnJlYWs7Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3YyXzAuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3YyXzAuYwo+IGluZGV4IGE3Y2IxODVkNjM5YS4uYmRl
MTg5NjgwNTIxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHVi
X3YyXzAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3YyXzAuYwo+
IEBAIC00MjcsOSArNDI3LDkgQEAgaW50IG1taHViX3YyXzBfc2V0X2Nsb2NrZ2F0aW5nKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LAo+ICAgCWNhc2UgQ0hJUF9OQVZJMTQ6Cj4gICAJY2FzZSBD
SElQX05BVkkxMjoKPiAgIAkJbW1odWJfdjJfMF91cGRhdGVfbWVkaXVtX2dyYWluX2Nsb2NrX2dh
dGluZyhhZGV2LAo+IC0JCQkJc3RhdGUgPT0gQU1EX0NHX1NUQVRFX0dBVEUgPyB0cnVlIDogZmFs
c2UpOwo+ICsJCQkJc3RhdGUgPT0gQU1EX0NHX1NUQVRFX0dBVEUpOwo+ICAgCQltbWh1Yl92Ml8w
X3VwZGF0ZV9tZWRpdW1fZ3JhaW5fbGlnaHRfc2xlZXAoYWRldiwKPiAtCQkJCXN0YXRlID09IEFN
RF9DR19TVEFURV9HQVRFID8gdHJ1ZSA6IGZhbHNlKTsKPiArCQkJCXN0YXRlID09IEFNRF9DR19T
VEFURV9HQVRFKTsKPiAgIAkJYnJlYWs7Cj4gICAJZGVmYXVsdDoKPiAgIAkJYnJlYWs7Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3Y5XzQuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3Y5XzQuYwo+IGluZGV4IGEzMmM5NzU3NzExZi4u
YTUyODFkZjhkODRmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21t
aHViX3Y5XzQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3Y5XzQu
Ywo+IEBAIC02MjUsOSArNjI1LDkgQEAgaW50IG1taHViX3Y5XzRfc2V0X2Nsb2NrZ2F0aW5nKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+ICAgCXN3aXRjaCAoYWRldi0+YXNpY190eXBlKSB7
Cj4gICAJY2FzZSBDSElQX0FSQ1RVUlVTOgo+ICAgCQltbWh1Yl92OV80X3VwZGF0ZV9tZWRpdW1f
Z3JhaW5fY2xvY2tfZ2F0aW5nKGFkZXYsCj4gLQkJCQlzdGF0ZSA9PSBBTURfQ0dfU1RBVEVfR0FU
RSA/IHRydWUgOiBmYWxzZSk7Cj4gKwkJCQlzdGF0ZSA9PSBBTURfQ0dfU1RBVEVfR0FURSk7Cj4g
ICAJCW1taHViX3Y5XzRfdXBkYXRlX21lZGl1bV9ncmFpbl9saWdodF9zbGVlcChhZGV2LAo+IC0J
CQkJc3RhdGUgPT0gQU1EX0NHX1NUQVRFX0dBVEUgPyB0cnVlIDogZmFsc2UpOwo+ICsJCQkJc3Rh
dGUgPT0gQU1EX0NHX1NUQVRFX0dBVEUpOwo+ICAgCQlicmVhazsKPiAgIAlkZWZhdWx0Ogo+ICAg
CQlicmVhazsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmF2aTEw
X2loLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYXZpMTBfaWguYwo+IGluZGV4IGY3
MzdjZTQ1OWMyOC4uY2Y1NTdhNDI4Mjk4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L25hdmkxMF9paC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
bmF2aTEwX2loLmMKPiBAQCAtNDI2LDcgKzQyNiw3IEBAIHN0YXRpYyBpbnQgbmF2aTEwX2loX3Nl
dF9jbG9ja2dhdGluZ19zdGF0ZSh2b2lkICpoYW5kbGUsCj4gICAJc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKiloYW5kbGU7Cj4gICAKPiAgIAluYXZp
MTBfaWhfdXBkYXRlX2Nsb2NrZ2F0aW5nX3N0YXRlKGFkZXYsCj4gLQkJCQlzdGF0ZSA9PSBBTURf
Q0dfU1RBVEVfR0FURSA/IHRydWUgOiBmYWxzZSk7Cj4gKwkJCQlzdGF0ZSA9PSBBTURfQ0dfU1RB
VEVfR0FURSk7Cj4gICAJcmV0dXJuIDA7Cj4gICB9Cj4gICAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252
LmMKPiBpbmRleCAyZTBmODkzMzQxMGUuLjJkMWJlYmRmMTYwMyAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvbnYuYwo+IEBAIC05NTAsMTMgKzk1MCwxMyBAQCBzdGF0aWMgaW50IG52X2NvbW1vbl9z
ZXRfY2xvY2tnYXRpbmdfc3RhdGUodm9pZCAqaGFuZGxlLAo+ICAgCWNhc2UgQ0hJUF9OQVZJMTQ6
Cj4gICAJY2FzZSBDSElQX05BVkkxMjoKPiAgIAkJYWRldi0+bmJpby5mdW5jcy0+dXBkYXRlX21l
ZGl1bV9ncmFpbl9jbG9ja19nYXRpbmcoYWRldiwKPiAtCQkJCXN0YXRlID09IEFNRF9DR19TVEFU
RV9HQVRFID8gdHJ1ZSA6IGZhbHNlKTsKPiArCQkJCXN0YXRlID09IEFNRF9DR19TVEFURV9HQVRF
KTsKPiAgIAkJYWRldi0+bmJpby5mdW5jcy0+dXBkYXRlX21lZGl1bV9ncmFpbl9saWdodF9zbGVl
cChhZGV2LAo+IC0JCQkJc3RhdGUgPT0gQU1EX0NHX1NUQVRFX0dBVEUgPyB0cnVlIDogZmFsc2Up
Owo+ICsJCQkJc3RhdGUgPT0gQU1EX0NHX1NUQVRFX0dBVEUpOwo+ICAgCQludl91cGRhdGVfaGRw
X21lbV9wb3dlcl9nYXRpbmcoYWRldiwKPiAtCQkJCSAgIHN0YXRlID09IEFNRF9DR19TVEFURV9H
QVRFID8gdHJ1ZSA6IGZhbHNlKTsKPiArCQkJCSAgIHN0YXRlID09IEFNRF9DR19TVEFURV9HQVRF
KTsKPiAgIAkJbnZfdXBkYXRlX2hkcF9jbG9ja19nYXRpbmcoYWRldiwKPiAtCQkJCXN0YXRlID09
IEFNRF9DR19TVEFURV9HQVRFID8gdHJ1ZSA6IGZhbHNlKTsKPiArCQkJCXN0YXRlID09IEFNRF9D
R19TVEFURV9HQVRFKTsKPiAgIAkJYnJlYWs7Cj4gICAJZGVmYXVsdDoKPiAgIAkJYnJlYWs7Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMKPiBpbmRleCAyY2UzMGE4ZmFlZDgu
LjdjZWE0NTEzYzMwMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9z
ZG1hX3Y0XzAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5j
Cj4gQEAgLTIxNzYsOSArMjE3Niw5IEBAIHN0YXRpYyBpbnQgc2RtYV92NF8wX3NldF9jbG9ja2dh
dGluZ19zdGF0ZSh2b2lkICpoYW5kbGUsCj4gICAJY2FzZSBDSElQX0FSQ1RVUlVTOgo+ICAgCWNh
c2UgQ0hJUF9SRU5PSVI6Cj4gICAJCXNkbWFfdjRfMF91cGRhdGVfbWVkaXVtX2dyYWluX2Nsb2Nr
X2dhdGluZyhhZGV2LAo+IC0JCQkJc3RhdGUgPT0gQU1EX0NHX1NUQVRFX0dBVEUgPyB0cnVlIDog
ZmFsc2UpOwo+ICsJCQkJc3RhdGUgPT0gQU1EX0NHX1NUQVRFX0dBVEUpOwo+ICAgCQlzZG1hX3Y0
XzBfdXBkYXRlX21lZGl1bV9ncmFpbl9saWdodF9zbGVlcChhZGV2LAo+IC0JCQkJc3RhdGUgPT0g
QU1EX0NHX1NUQVRFX0dBVEUgPyB0cnVlIDogZmFsc2UpOwo+ICsJCQkJc3RhdGUgPT0gQU1EX0NH
X1NUQVRFX0dBVEUpOwo+ICAgCQlicmVhazsKPiAgIAlkZWZhdWx0Ogo+ICAgCQlicmVhazsKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NV8wLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y1XzAuYwo+IGluZGV4IDM5MTI5MzdmODc4Zi4u
N2VlNjAzZGI4YzU3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Nk
bWFfdjVfMC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NV8wLmMK
PiBAQCAtMTUyNSw5ICsxNTI1LDkgQEAgc3RhdGljIGludCBzZG1hX3Y1XzBfc2V0X2Nsb2NrZ2F0
aW5nX3N0YXRlKHZvaWQgKmhhbmRsZSwKPiAgIAljYXNlIENISVBfTkFWSTE0Ogo+ICAgCWNhc2Ug
Q0hJUF9OQVZJMTI6Cj4gICAJCXNkbWFfdjVfMF91cGRhdGVfbWVkaXVtX2dyYWluX2Nsb2NrX2dh
dGluZyhhZGV2LAo+IC0JCQkJc3RhdGUgPT0gQU1EX0NHX1NUQVRFX0dBVEUgPyB0cnVlIDogZmFs
c2UpOwo+ICsJCQkJc3RhdGUgPT0gQU1EX0NHX1NUQVRFX0dBVEUpOwo+ICAgCQlzZG1hX3Y1XzBf
dXBkYXRlX21lZGl1bV9ncmFpbl9saWdodF9zbGVlcChhZGV2LAo+IC0JCQkJc3RhdGUgPT0gQU1E
X0NHX1NUQVRFX0dBVEUgPyB0cnVlIDogZmFsc2UpOwo+ICsJCQkJc3RhdGUgPT0gQU1EX0NHX1NU
QVRFX0dBVEUpOwo+ICAgCQlicmVhazsKPiAgIAlkZWZhdWx0Ogo+ICAgCQlicmVhazsKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2lfZG1hLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9zaV9kbWEuYwo+IGluZGV4IDlhZDg1ZWRkZjljNC4uN2Y2NGQ3MzA0
M2NmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NpX2RtYS5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2lfZG1hLmMKPiBAQCAtNjQ4LDcgKzY0
OCw3IEBAIHN0YXRpYyBpbnQgc2lfZG1hX3NldF9jbG9ja2dhdGluZ19zdGF0ZSh2b2lkICpoYW5k
bGUsCj4gICAJYm9vbCBlbmFibGU7Cj4gICAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKiloYW5kbGU7Cj4gICAKPiAtCWVuYWJsZSA9IChzdGF0ZSA9
PSBBTURfQ0dfU1RBVEVfR0FURSkgPyB0cnVlIDogZmFsc2U7Cj4gKwllbmFibGUgPSAoc3RhdGUg
PT0gQU1EX0NHX1NUQVRFX0dBVEUpOwo+ICAgCj4gICAJaWYgKGVuYWJsZSAmJiAoYWRldi0+Y2df
ZmxhZ3MgJiBBTURfQ0dfU1VQUE9SVF9TRE1BX01HQ0cpKSB7Cj4gICAJCWZvciAoaSA9IDA7IGkg
PCBhZGV2LT5zZG1hLm51bV9pbnN0YW5jZXM7IGkrKykgewo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
c29jMTUuYwo+IGluZGV4IDMxNzgwM2Y2YTU2MS4uYWY0MWVlNGM5NjM5IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9zb2MxNS5jCj4gQEAgLTE0NjcsMzggKzE0NjcsMzggQEAgc3RhdGljIGlu
dCBzb2MxNV9jb21tb25fc2V0X2Nsb2NrZ2F0aW5nX3N0YXRlKHZvaWQgKmhhbmRsZSwKPiAgIAlj
YXNlIENISVBfVkVHQTEyOgo+ICAgCWNhc2UgQ0hJUF9WRUdBMjA6Cj4gICAJCWFkZXYtPm5iaW8u
ZnVuY3MtPnVwZGF0ZV9tZWRpdW1fZ3JhaW5fY2xvY2tfZ2F0aW5nKGFkZXYsCj4gLQkJCQlzdGF0
ZSA9PSBBTURfQ0dfU1RBVEVfR0FURSA/IHRydWUgOiBmYWxzZSk7Cj4gKwkJCQlzdGF0ZSA9PSBB
TURfQ0dfU1RBVEVfR0FURSk7Cj4gICAJCWFkZXYtPm5iaW8uZnVuY3MtPnVwZGF0ZV9tZWRpdW1f
Z3JhaW5fbGlnaHRfc2xlZXAoYWRldiwKPiAtCQkJCXN0YXRlID09IEFNRF9DR19TVEFURV9HQVRF
ID8gdHJ1ZSA6IGZhbHNlKTsKPiArCQkJCXN0YXRlID09IEFNRF9DR19TVEFURV9HQVRFKTsKPiAg
IAkJc29jMTVfdXBkYXRlX2hkcF9saWdodF9zbGVlcChhZGV2LAo+IC0JCQkJc3RhdGUgPT0gQU1E
X0NHX1NUQVRFX0dBVEUgPyB0cnVlIDogZmFsc2UpOwo+ICsJCQkJc3RhdGUgPT0gQU1EX0NHX1NU
QVRFX0dBVEUpOwo+ICAgCQlzb2MxNV91cGRhdGVfZHJtX2Nsb2NrX2dhdGluZyhhZGV2LAo+IC0J
CQkJc3RhdGUgPT0gQU1EX0NHX1NUQVRFX0dBVEUgPyB0cnVlIDogZmFsc2UpOwo+ICsJCQkJc3Rh
dGUgPT0gQU1EX0NHX1NUQVRFX0dBVEUpOwo+ICAgCQlzb2MxNV91cGRhdGVfZHJtX2xpZ2h0X3Ns
ZWVwKGFkZXYsCj4gLQkJCQlzdGF0ZSA9PSBBTURfQ0dfU1RBVEVfR0FURSA/IHRydWUgOiBmYWxz
ZSk7Cj4gKwkJCQlzdGF0ZSA9PSBBTURfQ0dfU1RBVEVfR0FURSk7Cj4gICAJCXNvYzE1X3VwZGF0
ZV9yb21fbWVkaXVtX2dyYWluX2Nsb2NrX2dhdGluZyhhZGV2LAo+IC0JCQkJc3RhdGUgPT0gQU1E
X0NHX1NUQVRFX0dBVEUgPyB0cnVlIDogZmFsc2UpOwo+ICsJCQkJc3RhdGUgPT0gQU1EX0NHX1NU
QVRFX0dBVEUpOwo+ICAgCQlhZGV2LT5kZi5mdW5jcy0+dXBkYXRlX21lZGl1bV9ncmFpbl9jbG9j
a19nYXRpbmcoYWRldiwKPiAtCQkJCXN0YXRlID09IEFNRF9DR19TVEFURV9HQVRFID8gdHJ1ZSA6
IGZhbHNlKTsKPiArCQkJCXN0YXRlID09IEFNRF9DR19TVEFURV9HQVRFKTsKPiAgIAkJYnJlYWs7
Cj4gICAJY2FzZSBDSElQX1JBVkVOOgo+ICAgCWNhc2UgQ0hJUF9SRU5PSVI6Cj4gICAJCWFkZXYt
Pm5iaW8uZnVuY3MtPnVwZGF0ZV9tZWRpdW1fZ3JhaW5fY2xvY2tfZ2F0aW5nKGFkZXYsCj4gLQkJ
CQlzdGF0ZSA9PSBBTURfQ0dfU1RBVEVfR0FURSA/IHRydWUgOiBmYWxzZSk7Cj4gKwkJCQlzdGF0
ZSA9PSBBTURfQ0dfU1RBVEVfR0FURSk7Cj4gICAJCWFkZXYtPm5iaW8uZnVuY3MtPnVwZGF0ZV9t
ZWRpdW1fZ3JhaW5fbGlnaHRfc2xlZXAoYWRldiwKPiAtCQkJCXN0YXRlID09IEFNRF9DR19TVEFU
RV9HQVRFID8gdHJ1ZSA6IGZhbHNlKTsKPiArCQkJCXN0YXRlID09IEFNRF9DR19TVEFURV9HQVRF
KTsKPiAgIAkJc29jMTVfdXBkYXRlX2hkcF9saWdodF9zbGVlcChhZGV2LAo+IC0JCQkJc3RhdGUg
PT0gQU1EX0NHX1NUQVRFX0dBVEUgPyB0cnVlIDogZmFsc2UpOwo+ICsJCQkJc3RhdGUgPT0gQU1E
X0NHX1NUQVRFX0dBVEUpOwo+ICAgCQlzb2MxNV91cGRhdGVfZHJtX2Nsb2NrX2dhdGluZyhhZGV2
LAo+IC0JCQkJc3RhdGUgPT0gQU1EX0NHX1NUQVRFX0dBVEUgPyB0cnVlIDogZmFsc2UpOwo+ICsJ
CQkJc3RhdGUgPT0gQU1EX0NHX1NUQVRFX0dBVEUpOwo+ICAgCQlzb2MxNV91cGRhdGVfZHJtX2xp
Z2h0X3NsZWVwKGFkZXYsCj4gLQkJCQlzdGF0ZSA9PSBBTURfQ0dfU1RBVEVfR0FURSA/IHRydWUg
OiBmYWxzZSk7Cj4gKwkJCQlzdGF0ZSA9PSBBTURfQ0dfU1RBVEVfR0FURSk7Cj4gICAJCXNvYzE1
X3VwZGF0ZV9yb21fbWVkaXVtX2dyYWluX2Nsb2NrX2dhdGluZyhhZGV2LAo+IC0JCQkJc3RhdGUg
PT0gQU1EX0NHX1NUQVRFX0dBVEUgPyB0cnVlIDogZmFsc2UpOwo+ICsJCQkJc3RhdGUgPT0gQU1E
X0NHX1NUQVRFX0dBVEUpOwo+ICAgCQlicmVhazsKPiAgIAljYXNlIENISVBfQVJDVFVSVVM6Cj4g
ICAJCXNvYzE1X3VwZGF0ZV9oZHBfbGlnaHRfc2xlZXAoYWRldiwKPiAtCQkJCXN0YXRlID09IEFN
RF9DR19TVEFURV9HQVRFID8gdHJ1ZSA6IGZhbHNlKTsKPiArCQkJCXN0YXRlID09IEFNRF9DR19T
VEFURV9HQVRFKTsKPiAgIAkJYnJlYWs7Cj4gICAJZGVmYXVsdDoKPiAgIAkJYnJlYWs7Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92NV8wLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjVfMC5jCj4gaW5kZXggMDFlNjJmYjhlNmUwLi4wZmE4
YWFlMmQ3OGUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y1
XzAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92NV8wLmMKPiBAQCAt
NzYzLDcgKzc2Myw3IEBAIHN0YXRpYyBpbnQgdXZkX3Y1XzBfc2V0X2Nsb2NrZ2F0aW5nX3N0YXRl
KHZvaWQgKmhhbmRsZSwKPiAgIAkJCQkJICBlbnVtIGFtZF9jbG9ja2dhdGluZ19zdGF0ZSBzdGF0
ZSkKPiAgIHsKPiAgIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqKWhhbmRsZTsKPiAtCWJvb2wgZW5hYmxlID0gKHN0YXRlID09IEFNRF9DR19TVEFU
RV9HQVRFKSA/IHRydWUgOiBmYWxzZTsKPiArCWJvb2wgZW5hYmxlID0gKHN0YXRlID09IEFNRF9D
R19TVEFURV9HQVRFKTsKPiAgIAo+ICAgCWlmIChlbmFibGUpIHsKPiAgIAkJLyogd2FpdCBmb3Ig
U1RBVFVTIHRvIGNsZWFyICovCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3V2ZF92Nl8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjZfMC5jCj4g
aW5kZXggMjE3MDg0ZDU2YWI4Li5lMGFhZGNhZjZjOGIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y2XzAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3V2ZF92Nl8wLmMKPiBAQCAtMTQyMSw3ICsxNDIxLDcgQEAgc3RhdGljIGludCB1dmRf
djZfMF9zZXRfY2xvY2tnYXRpbmdfc3RhdGUodm9pZCAqaGFuZGxlLAo+ICAgCQkJCQkgIGVudW0g
YW1kX2Nsb2NrZ2F0aW5nX3N0YXRlIHN0YXRlKQo+ICAgewo+ICAgCXN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNlICopaGFuZGxlOwo+IC0JYm9vbCBlbmFi
bGUgPSAoc3RhdGUgPT0gQU1EX0NHX1NUQVRFX0dBVEUpID8gdHJ1ZSA6IGZhbHNlOwo+ICsJYm9v
bCBlbmFibGUgPSAoc3RhdGUgPT0gQU1EX0NHX1NUQVRFX0dBVEUpOwo+ICAgCj4gICAJaWYgKGVu
YWJsZSkgewo+ICAgCQkvKiB3YWl0IGZvciBTVEFUVVMgdG8gY2xlYXIgKi8KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNlX3YzXzAuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3ZjZV92M18wLmMKPiBpbmRleCA0NzVhZTY4ZjM4ZjUuLjIxN2RiMTg3MjA3
YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y2VfdjNfMC5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNlX3YzXzAuYwo+IEBAIC03MzksNyAr
NzM5LDcgQEAgc3RhdGljIGludCB2Y2VfdjNfMF9zZXRfY2xvY2tnYXRpbmdfc3RhdGUodm9pZCAq
aGFuZGxlLAo+ICAgCQkJCQkgIGVudW0gYW1kX2Nsb2NrZ2F0aW5nX3N0YXRlIHN0YXRlKQo+ICAg
ewo+ICAgCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICopaGFuZGxlOwo+IC0JYm9vbCBlbmFibGUgPSAoc3RhdGUgPT0gQU1EX0NHX1NUQVRFX0dBVEUp
ID8gdHJ1ZSA6IGZhbHNlOwo+ICsJYm9vbCBlbmFibGUgPSAoc3RhdGUgPT0gQU1EX0NHX1NUQVRF
X0dBVEUpOwo+ICAgCWludCBpOwo+ICAgCj4gICAJaWYgKCEoYWRldi0+Y2dfZmxhZ3MgJiBBTURf
Q0dfU1VQUE9SVF9WQ0VfTUdDRykpCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3ZjZV92NF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y2VfdjRfMC5j
Cj4gaW5kZXggNjgzNzAxY2Y3MjcwLi4zZmQxMDJlZmI3YWYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvdmNlX3Y0XzAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3ZjZV92NF8wLmMKPiBAQCAtODg3LDcgKzg4Nyw3IEBAIHN0YXRpYyBpbnQgdmNl
X3Y0XzBfc2V0X2Nsb2NrZ2F0aW5nX3N0YXRlKHZvaWQgKmhhbmRsZSwKPiAgIAkJCQkJICBlbnVt
IGFtZF9jbG9ja2dhdGluZ19zdGF0ZSBzdGF0ZSkKPiAgIHsKPiAgIAlzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWhhbmRsZTsKPiAtCWJvb2wgZW5h
YmxlID0gKHN0YXRlID09IEFNRF9DR19TVEFURV9HQVRFKSA/IHRydWUgOiBmYWxzZTsKPiArCWJv
b2wgZW5hYmxlID0gKHN0YXRlID09IEFNRF9DR19TVEFURV9HQVRFKTsKPiAgIAlpbnQgaTsKPiAg
IAo+ICAgCWlmICgoYWRldi0+YXNpY190eXBlID09IENISVBfUE9MQVJJUzEwKSB8fAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjFfMC5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvdmNuX3YxXzAuYwo+IGluZGV4IGU2NTQ5MzhmNmNjYS4uMWEyNGZh
ZGQzMGUyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92MV8w
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjFfMC5jCj4gQEAgLTEz
NDYsNyArMTM0Niw3IEBAIHN0YXRpYyBpbnQgdmNuX3YxXzBfc2V0X2Nsb2NrZ2F0aW5nX3N0YXRl
KHZvaWQgKmhhbmRsZSwKPiAgIAkJCQkJICBlbnVtIGFtZF9jbG9ja2dhdGluZ19zdGF0ZSBzdGF0
ZSkKPiAgIHsKPiAgIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqKWhhbmRsZTsKPiAtCWJvb2wgZW5hYmxlID0gKHN0YXRlID09IEFNRF9DR19TVEFU
RV9HQVRFKSA/IHRydWUgOiBmYWxzZTsKPiArCWJvb2wgZW5hYmxlID0gKHN0YXRlID09IEFNRF9D
R19TVEFURV9HQVRFKTsKPiAgIAo+ICAgCWlmIChlbmFibGUpIHsKPiAgIAkJLyogd2FpdCBmb3Ig
U1RBVFVTIHRvIGNsZWFyICovCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3Zjbl92Ml8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jCj4g
aW5kZXggZjRkYjhhZjY1MzZiLi5iOGRjMTM2ZDJhMDEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3Zjbl92Ml8wLmMKPiBAQCAtMTIxMyw3ICsxMjEzLDcgQEAgc3RhdGljIGludCB2Y25f
djJfMF9zZXRfY2xvY2tnYXRpbmdfc3RhdGUodm9pZCAqaGFuZGxlLAo+ICAgCQkJCQkgIGVudW0g
YW1kX2Nsb2NrZ2F0aW5nX3N0YXRlIHN0YXRlKQo+ICAgewo+ICAgCXN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNlICopaGFuZGxlOwo+IC0JYm9vbCBlbmFi
bGUgPSAoc3RhdGUgPT0gQU1EX0NHX1NUQVRFX0dBVEUpID8gdHJ1ZSA6IGZhbHNlOwo+ICsJYm9v
bCBlbmFibGUgPSAoc3RhdGUgPT0gQU1EX0NHX1NUQVRFX0dBVEUpOwo+ICAgCj4gICAJaWYgKGVu
YWJsZSkgewo+ICAgCQkvKiB3YWl0IGZvciBTVEFUVVMgdG8gY2xlYXIgKi8KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzUuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3Zjbl92Ml81LmMKPiBpbmRleCBjOGI2M2Q1N2E1NDEuLjY5NzBkM2ExYWU2
ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfNS5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzUuYwo+IEBAIC0xNjYzLDcg
KzE2NjMsNyBAQCBzdGF0aWMgaW50IHZjbl92Ml81X3NldF9jbG9ja2dhdGluZ19zdGF0ZSh2b2lk
ICpoYW5kbGUsCj4gICAJCQkJCSAgZW51bSBhbWRfY2xvY2tnYXRpbmdfc3RhdGUgc3RhdGUpCj4g
ICB7Cj4gICAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKiloYW5kbGU7Cj4gLQlib29sIGVuYWJsZSA9IChzdGF0ZSA9PSBBTURfQ0dfU1RBVEVfR0FU
RSkgPyB0cnVlIDogZmFsc2U7Cj4gKwlib29sIGVuYWJsZSA9IChzdGF0ZSA9PSBBTURfQ0dfU1RB
VEVfR0FURSk7Cj4gICAKPiAgIAlpZiAoYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKQo+ICAgCQlyZXR1
cm4gMDsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmVnYTEwX2lo
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92ZWdhMTBfaWguYwo+IGluZGV4IGQ5ZTMz
MTA4NGVhMC4uNDA3YzYwOTNjMmVjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3ZlZ2ExMF9paC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmVn
YTEwX2loLmMKPiBAQCAtNzE3LDcgKzcxNyw3IEBAIHN0YXRpYyBpbnQgdmVnYTEwX2loX3NldF9j
bG9ja2dhdGluZ19zdGF0ZSh2b2lkICpoYW5kbGUsCj4gICAJc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKiloYW5kbGU7Cj4gICAKPiAgIAl2ZWdhMTBf
aWhfdXBkYXRlX2Nsb2NrZ2F0aW5nX3N0YXRlKGFkZXYsCj4gLQkJCQlzdGF0ZSA9PSBBTURfQ0df
U1RBVEVfR0FURSA/IHRydWUgOiBmYWxzZSk7Cj4gKwkJCQlzdGF0ZSA9PSBBTURfQ0dfU1RBVEVf
R0FURSk7Cj4gICAJcmV0dXJuIDA7Cj4gICAKPiAgIH0KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeAo=
