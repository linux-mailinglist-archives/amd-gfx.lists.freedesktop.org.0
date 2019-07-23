Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC02717B7
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 14:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C2916E19C;
	Tue, 23 Jul 2019 12:08:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680084.outbound.protection.outlook.com [40.107.68.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD2426E19C
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 12:08:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xtzxvd9iwffUlZz+hpNPpVsfwF1RsTF9Zqp/udh2AVKNNzv5zAVoPhMasYDbE9Gz9xTplWB8/enk0+/LCgyssi2weZWKVrLujC2veyESEWqnehSDVaOSr77ErXus8maHaXdWNj4cNvDzwnLmfWKNPhoCNNjALe57qCVwtncxJtdk9f0WDdw0jVMu/j+cCsxu49gvZ9lLWRmfv0KRah1rrgQi+4MvI4RFD22bWx9CE5YsJMx1CPrU0EGW54zseqQIIj5Rp0P8vULMxY0Hc6rdXoKyJkxCjezLlPr+gG6c7zG5HZTzByKSqjqLjW8LifH/i48XsM6U2QQsTCttjmhmTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+pGzc+Hd+pp+yoNeLopCR27KzvFwQPuXk8uI3EXm5Y=;
 b=nY2F7A7SqjH01g3XJBtiJuyLMvuD0OceU04Q0ny0S97tBHsRcTdqCdCx4DRyBmPtJVINshOxWgb6XMEM9z0oaC7BzFG6yxcDZvKZ7o9LbcwNJwNWY7T8hbobbtH6MemgAGWNhFdZeVOg9BCTsHRzxKODqSO9s9IpaMXw5vvCH8aETwIHGdLuuGYiJK7uWlzt10HpWqQyegeRWYIKODcbwpR7eqo99a1s1vCbbs6g0DWMPB4ahlEqS2qJPmuqaLTjqdgiPt7IZcB1dB9LY5rgBcb+YoM826aLprmLEwz8y/P7TUXdUQtaQ9S5g4caMILqhgPDcydUOkZ1Kn43iw5X3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3821.namprd12.prod.outlook.com (10.255.237.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.15; Tue, 23 Jul 2019 12:08:15 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f%6]) with mapi id 15.20.2094.013; Tue, 23 Jul 2019
 12:08:15 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: fix temperature granularity error in smu11
Thread-Topic: [PATCH] drm/amd/powerplay: fix temperature granularity error in
 smu11
Thread-Index: AQHVQU9OHIipvp+bC0yHsFNY2j2yuw==
Date: Tue, 23 Jul 2019 12:08:15 +0000
Message-ID: <20190723120756.27823-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR04CA0020.apcprd04.prod.outlook.com
 (2603:1096:203:36::32) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.0
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 94a12934-ebcf-4c35-2dc1-08d70f6670bf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3821; 
x-ms-traffictypediagnostic: MN2PR12MB3821:
x-microsoft-antispam-prvs: <MN2PR12MB3821672392D09BB8723D55ACA2C70@MN2PR12MB3821.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(199004)(189003)(26005)(25786009)(6506007)(102836004)(386003)(81156014)(54906003)(316002)(2906002)(186003)(36756003)(6436002)(6916009)(256004)(2616005)(476003)(5640700003)(8936002)(81166006)(86362001)(4326008)(53936002)(68736007)(6486002)(6512007)(66066001)(66556008)(50226002)(66476007)(64756008)(66946007)(66446008)(2351001)(5660300002)(1076003)(2501003)(6116002)(3846002)(52116002)(486006)(71190400001)(7736002)(305945005)(8676002)(14454004)(478600001)(71200400001)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3821;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HA9zbBCWRS93rcvqkpfAZ85TnAJhy/7rn8wmxH/GfnJ6op+sxWtip3tIQJYmJC8MIp8WaKn+j4ESPW8OY0E9WF+z3OFa84u/+ph+JrLPMFhm0SFwE7/EnscvohMMWagIV/H7B0Sgkxp2l7TJwtk2g5w/lzgRUKchL1Z3/61uoYL1KlsuQynsqmC//vNSrRMhR7cHThkVDNqgilvrypqOZueMgxZvs28vni6j3piTO2QfzhtQaCtX4YjFQTsqPYArDMq9V5MfsMH/TfTBrG9t3XKEVj2Yy5VCd6C7zFf+u+2xI4t2TdZR38xQq+6bMTIUniwll5SCawsJkLOQSStxEWC3s02/8iyQ8MEhWkoJcveHipf+0tXrmZ6cTBJrfw0cSlpyf9IewYkU9UfT565zB5AQtIp2lQiErgiQ87OJIaw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94a12934-ebcf-4c35-2dc1-08d70f6670bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 12:08:15.2730 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3821
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+pGzc+Hd+pp+yoNeLopCR27KzvFwQPuXk8uI3EXm5Y=;
 b=LJ5DN0hG6CuDlT31ZtcwiZNF3JD5Jbogh5Ulj89VT304geKMMUyjfs3RMoUd93xoUwInuXeGrTTBVua/U1w/v8yFE2terUk2IK+EbQCxE6zEqQEbckavB5meahsToyE53k0OThnbnxAwILJ0PlM3j7/VjNaKCPUvyClz4ilsVNk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Cc: "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>, "Quan,
 Evan" <Evan.Quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

aW4gdGhpcyBwYXRjaCwKZHJtL2FtZC9wb3dlcnBsYXk6IGFkZCBjYWxsYmFjayBmdW5jdGlvbiBv
ZiBnZXRfdGhlcm1hbF90ZW1wZXJhdHVyZV9yYW5nZQp0aGUgZHJpdmVyIG1pc3NlZCB0ZW1wZXJh
dHVyZSBncmFudWxhcml0eSBjaGFuZ2Ugb24gb3RoZXIgdGVtcGVyYXR1cmUuCgpTaWduZWQtb2Zm
LWJ5OiBLZXZpbiBXYW5nIDxrZXZpbjEud2FuZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jIHwgMTggKysrKysrKysrLS0tLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMKaW5kZXggNzQ1YjM1YTE2MDBkLi43MzU4MDJi
YjA3YjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFf
MC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jCkBAIC0x
MjI5LDE1ICsxMjI5LDE1IEBAIHN0YXRpYyBpbnQgc211X3YxMV8wX3N0YXJ0X3RoZXJtYWxfY29u
dHJvbChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKIAkJCXJldHVybiByZXQ7CiAJfQogCi0JYWRl
di0+cG0uZHBtLnRoZXJtYWwubWluX3RlbXAgPSByYW5nZS5taW47Ci0JYWRldi0+cG0uZHBtLnRo
ZXJtYWwubWF4X3RlbXAgPSByYW5nZS5tYXg7Ci0JYWRldi0+cG0uZHBtLnRoZXJtYWwubWF4X2Vk
Z2VfZW1lcmdlbmN5X3RlbXAgPSByYW5nZS5lZGdlX2VtZXJnZW5jeV9tYXg7Ci0JYWRldi0+cG0u
ZHBtLnRoZXJtYWwubWluX2hvdHNwb3RfdGVtcCA9IHJhbmdlLmhvdHNwb3RfbWluOwotCWFkZXYt
PnBtLmRwbS50aGVybWFsLm1heF9ob3RzcG90X2NyaXRfdGVtcCA9IHJhbmdlLmhvdHNwb3RfY3Jp
dF9tYXg7Ci0JYWRldi0+cG0uZHBtLnRoZXJtYWwubWF4X2hvdHNwb3RfZW1lcmdlbmN5X3RlbXAg
PSByYW5nZS5ob3RzcG90X2VtZXJnZW5jeV9tYXg7Ci0JYWRldi0+cG0uZHBtLnRoZXJtYWwubWlu
X21lbV90ZW1wID0gcmFuZ2UubWVtX21pbjsKLQlhZGV2LT5wbS5kcG0udGhlcm1hbC5tYXhfbWVt
X2NyaXRfdGVtcCA9IHJhbmdlLm1lbV9jcml0X21heDsKLQlhZGV2LT5wbS5kcG0udGhlcm1hbC5t
YXhfbWVtX2VtZXJnZW5jeV90ZW1wID0gcmFuZ2UubWVtX2VtZXJnZW5jeV9tYXg7CisJYWRldi0+
cG0uZHBtLnRoZXJtYWwubWluX3RlbXAgPSByYW5nZS5taW4gKiBTTVVfVEVNUEVSQVRVUkVfVU5J
VFNfUEVSX0NFTlRJR1JBREVTOworCWFkZXYtPnBtLmRwbS50aGVybWFsLm1heF90ZW1wID0gcmFu
Z2UubWF4ICogU01VX1RFTVBFUkFUVVJFX1VOSVRTX1BFUl9DRU5USUdSQURFUzsKKwlhZGV2LT5w
bS5kcG0udGhlcm1hbC5tYXhfZWRnZV9lbWVyZ2VuY3lfdGVtcCA9IHJhbmdlLmVkZ2VfZW1lcmdl
bmN5X21heCAqIFNNVV9URU1QRVJBVFVSRV9VTklUU19QRVJfQ0VOVElHUkFERVM7CisJYWRldi0+
cG0uZHBtLnRoZXJtYWwubWluX2hvdHNwb3RfdGVtcCA9IHJhbmdlLmhvdHNwb3RfbWluICogU01V
X1RFTVBFUkFUVVJFX1VOSVRTX1BFUl9DRU5USUdSQURFUzsKKwlhZGV2LT5wbS5kcG0udGhlcm1h
bC5tYXhfaG90c3BvdF9jcml0X3RlbXAgPSByYW5nZS5ob3RzcG90X2NyaXRfbWF4ICogU01VX1RF
TVBFUkFUVVJFX1VOSVRTX1BFUl9DRU5USUdSQURFUzsKKwlhZGV2LT5wbS5kcG0udGhlcm1hbC5t
YXhfaG90c3BvdF9lbWVyZ2VuY3lfdGVtcCA9IHJhbmdlLmhvdHNwb3RfZW1lcmdlbmN5X21heCAq
IFNNVV9URU1QRVJBVFVSRV9VTklUU19QRVJfQ0VOVElHUkFERVM7CisJYWRldi0+cG0uZHBtLnRo
ZXJtYWwubWluX21lbV90ZW1wID0gcmFuZ2UubWVtX21pbiAqIFNNVV9URU1QRVJBVFVSRV9VTklU
U19QRVJfQ0VOVElHUkFERVM7CisJYWRldi0+cG0uZHBtLnRoZXJtYWwubWF4X21lbV9jcml0X3Rl
bXAgPSByYW5nZS5tZW1fY3JpdF9tYXggKiBTTVVfVEVNUEVSQVRVUkVfVU5JVFNfUEVSX0NFTlRJ
R1JBREVTOworCWFkZXYtPnBtLmRwbS50aGVybWFsLm1heF9tZW1fZW1lcmdlbmN5X3RlbXAgPSBy
YW5nZS5tZW1fZW1lcmdlbmN5X21heCAqIFNNVV9URU1QRVJBVFVSRV9VTklUU19QRVJfQ0VOVElH
UkFERVM7CiAJYWRldi0+cG0uZHBtLnRoZXJtYWwubWluX3RlbXAgPSByYW5nZS5taW4gKiBTTVVf
VEVNUEVSQVRVUkVfVU5JVFNfUEVSX0NFTlRJR1JBREVTOwogCWFkZXYtPnBtLmRwbS50aGVybWFs
Lm1heF90ZW1wID0gcmFuZ2UubWF4ICogU01VX1RFTVBFUkFUVVJFX1VOSVRTX1BFUl9DRU5USUdS
QURFUzsKIAotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
