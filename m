Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9AE7E4A7
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 23:14:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC0D689BE8;
	Thu,  1 Aug 2019 21:14:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740043.outbound.protection.outlook.com [40.107.74.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC3E89E15
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 21:14:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hSWtUrYeVfFjpIJI7Z7msZtdfXFDQXrDzVPu4U/7uCkcI7HOTd2ZjMPMNtWcd3dCav5NHzTaBIPW66w9VUKBLUzoj8QxvwmPtTNRdslcUf85p+d2sf29yJpCb3WpzpnHM5iocGNrDvEplSM8RNUr58Oflc/sScD5X/gYYIqoB4QsoGitzVNi+saXzKFTfjlPUq94sGyvRbx2eUBYvZsQ9pegRpDyli+KwXUtFQVzRvWEgRJd9WperwK0NdqbtLjt8fQlRB2xnYt30ODg9OG0z+eRS3SqQTKwNbDfGKpOB8DKZ3W89ashydmvlS9GqFIXPn/VZLuPzJA9nzWAbupvgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0mLCGW7mlb/lyr6bysce8RCmmcU//rz2spaxELsnJBg=;
 b=RwVyYUdN9WrM7Wnv8INxSmF+manaXhA/2G8sb8y5R3crg6VpVekei5JlbOi2Hn8OBuNIj2vi6tEpJ4HT0yFubGxlWQfVULEQwtEdCRQD3daxInhrXDHKFcDzU4uSNNfjLRMtVUbaEQgF1zxDgrjf6QJG6QoGimgawiuaosp3E6lQV6VTXZCfLWmIDHP6+wPDgdXmolTPU4RMf8D+1yhNrKy0LqJdeU0wHHdYu1LdPZwggSCJPhCMiFw7nLtb+XXmURpwoF1gRJrS0rq0vffpkPwvrZ8jdfSHsikAXbP3UFJi2uWyaim02KRtDA+8d3a414iiRQcKTwxS5FKgHyUWXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from CY4PR12MB1767.namprd12.prod.outlook.com (10.175.62.137) by
 CY4PR12MB1509.namprd12.prod.outlook.com (10.172.68.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Thu, 1 Aug 2019 21:14:34 +0000
Received: from CY4PR12MB1767.namprd12.prod.outlook.com
 ([fe80::dc30:2f2e:a67b:270b]) by CY4PR12MB1767.namprd12.prod.outlook.com
 ([fe80::dc30:2f2e:a67b:270b%10]) with mapi id 15.20.2136.010; Thu, 1 Aug 2019
 21:14:34 +0000
From: "Greathouse, Joseph" <Joseph.Greathouse@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/amdkfd: Remove GPU ID in GWS queue creation
Thread-Topic: [PATCH v2] drm/amdkfd: Remove GPU ID in GWS queue creation
Thread-Index: AQHVSK4d77Tv3yGKdkSyJ/VLhOnfyQ==
Date: Thu, 1 Aug 2019 21:14:33 +0000
Message-ID: <20190801211417.4781-1-Joseph.Greathouse@amd.com>
References: <d4b6a8a2-20da-027b-bfe9-e77517411884@amd.com>
In-Reply-To: <d4b6a8a2-20da-027b-bfe9-e77517411884@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: SN2PR01CA0028.prod.exchangelabs.com (2603:10b6:804:2::38)
 To CY4PR12MB1767.namprd12.prod.outlook.com (2603:10b6:903:121::9)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.78.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d72d3787-af9b-429e-950a-08d716c54024
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR12MB1509; 
x-ms-traffictypediagnostic: CY4PR12MB1509:
x-microsoft-antispam-prvs: <CY4PR12MB150912AA9585C5F492059896F9DE0@CY4PR12MB1509.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(396003)(136003)(346002)(376002)(189003)(199004)(71190400001)(66066001)(52116002)(3846002)(6116002)(86362001)(76176011)(71200400001)(5660300002)(2501003)(102836004)(6506007)(386003)(99286004)(68736007)(11346002)(66556008)(64756008)(66446008)(476003)(2616005)(66946007)(486006)(478600001)(6916009)(2906002)(36756003)(2351001)(81166006)(81156014)(5640700003)(256004)(53936002)(6486002)(7736002)(66476007)(14444005)(6436002)(8936002)(305945005)(14454004)(50226002)(4326008)(26005)(8676002)(1076003)(446003)(316002)(6512007)(54906003)(186003)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1509;
 H:CY4PR12MB1767.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AsgQA+0PrjSQNILTkyvjrFRqjFidNkiMKAu+mf0tQ9bqBNADARW8nfy/OTJU3UIXhGgd2Xr4TtnVMtrE1qsV8t7ykos6RamGUGJYdDAQq2N0drAFtZIMP9gnjPj7WImX8dm/Vs5R08zzLmGkMvue7l0EE5iicd257zMLtYCUCkjaGt4m/Cx7PCMPPWJEkpJU4ssM6D5V+AfgSmIaAar2IAgasVUxA14rvx4OmbYvOVTB4VpT9+IFHIDxqFxDcLjqPcNiO1Mi4vmvUkyyRwcV9HeRuFSa6EP3jfbEswqTnTEOgrXS0bge+GByi3fTAQRinM6ulm968SDOax2DkuSJNq4xdeKHBLHHpF0P9fCXtT1L6PX4zD44qwIpr0uydK/7c1LGfELiwxuh/8CC/7kSdaE/VaSXZ68I5l2S3bt149A=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d72d3787-af9b-429e-950a-08d716c54024
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 21:14:33.9660 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgreatho@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1509
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0mLCGW7mlb/lyr6bysce8RCmmcU//rz2spaxELsnJBg=;
 b=0bhNVVWrGAcHjnATdVe2KKLqH6KB6w02nMaDwnl7a9pQd4oZ/hUbzYPzqm2j/bg4ul2qt3S6TB/8c9gLnieorgxSovb7SnwhRxccSn7qK7oI9UeVkYHCkWOoih+k6InMqo8yEwznxkLiZDTNO76PIgvsyOwQ1xwo4IedXd0sgtI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Joseph.Greathouse@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Greathouse,
 Joseph" <Joseph.Greathouse@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIGdwdV9pZCBhcmd1bWVudCBpcyBub3QgbmVlZGVkIHdoZW4gZW5hYmxpbmcgR1dTIG9uIGEg
cXVldWUuClRoZSBxdWV1ZSBjYW4gb25seSBiZSBhc3NvY2lhdGVkIHdpdGggb25lIGRldmljZSwg
c28gdGhlIG9ubHkKcG9zc2libGUgc2l0dWF0aW9ucyBmb3IgdGhlIGNhbGwgYXMgcHJldmlvdXNs
eSBkZWZpbmVkIHdlcmU6CjEpIHRoZSBncHVfaWQgd2FzIGZvciB0aGUgZGV2aWNlIGFzc29jaWF0
ZWQgd2l0aCB0aGUgdGFyZ2V0IHF1ZXVlCmFuZCB0aGluZ3Mgd29ya2VkIGFzIGV4cGVjdGVkLCBv
ciAyKSB0aGUgZ3B1X2lkIHdhcyBmb3IgYSBkZXZpY2UKbm90IGFzc29jaWF0ZWQgd2l0aCB0aGUg
dGFyZ2V0IHF1ZXVlIGFuZCB0aGUgcmVxdWVzdCB3YXMgdW5kZWZpbmVkLgoKSW4gcGFydGljdWxh
ciwgdGhlIHByZXZpb3VzIHJlc3VsdCBvZiB0aGUgdW5kZWZpbmVkIG9wZXJhdGlvbiBpcwp0aGF0
IHlvdSB3b3VsZCBhbGxvY2F0ZSB0aGUgbnVtYmVyIG9mIEdXUyBlbnRyaWVzIGF2YWlsYWJsZSBv
biB0aGUKZ3B1X2lkIGRldmljZSwgZXZlbiBpZiB0aGUgcXVldWUgd2FzIG9uIGEgZGV2aWNlIHdp
dGggYSBkaWZmZXJlbnQKbnVtYmVyIGF2YWlsYWJsZS4gRm9yIGV4YW1wbGU6IGEgcXVldWUgb24g
YSBkZXZpY2Ugd2l0aG91dCBHV1MKY2FwYWJpbGl0eSwgYnV0IHRoZSB1c2VyIHBhc3NlcyBpbiBh
IGdwdV9pZCBmb3IgYSBkZXZpY2Ugd2l0aCBHV1MuCldlIHdvdWxkIGVuZCB1cCB0cnlpbmcgdG8g
YWxsb2NhdGUgR1dTIG9uIHRoZSBkZXZpY2UgdGhhdCBkb2VzIG5vdApzdXBwb3J0IGl0LgoKUmF0
aGVyIHRoYW4gbGVhdmluZyB0aGlzIGZvb3RndW4gYXJvdW5kIGFuZCBtYWtpbmcgbGlmZSBtb3Jl
CmRpZmZpY3VsdCBmb3IgdXNlciBzcGFjZSwgd2UgY2FuIGluc3RlYWQgZ3JhYiB0aGUgZ3B1X2lk
IGZyb20gdGhlCnRhcmdldCBxdWV1ZS4gVGhlIGdwdV9pZCBhcmd1bWVudCBiZWluZyBwYXNzZWQg
aW4gaXMgdGh1cyBub3QKbmVlZGVkLgoKdjI6IEZpeGVkIHN0eWxpbmcsIHJlbW92ZWQgZ3B1X2lk
IHNpbmNlIGl0IG5ldmVyIGhpdCBtYWluIHJlbGVhc2UKCkNoYW5nZS1JZDogSTczYzAzMmQ3MTE1
YjYyNTA1YTZlN2M0OGQyYzA2MGZjM2M2ZWU5MTUKU2lnbmVkLW9mZi1ieTogSm9zZXBoIEdyZWF0
aG91c2UgPEpvc2VwaC5HcmVhdGhvdXNlQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX2NoYXJkZXYuYyAgICAgIHwgMjYgKysrKysrKysrKysrKystLS0tLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaCAgICAgICAgIHwgIDIgKysKIC4uLi9h
bWQvYW1ka2ZkL2tmZF9wcm9jZXNzX3F1ZXVlX21hbmFnZXIuYyAgICB8ICA5ICsrKysrKysKIGlu
Y2x1ZGUvdWFwaS9saW51eC9rZmRfaW9jdGwuaCAgICAgICAgICAgICAgICB8ICAzICstLQogNCBm
aWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jCmluZGV4IGY5MTEyNmY1ZjFiZS4uYjQ2NGFk
MWUyYzRjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRl
di5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMKQEAgLTE1
NzIsMjUgKzE1NzIsMzcgQEAgc3RhdGljIGludCBrZmRfaW9jdGxfYWxsb2NfcXVldWVfZ3dzKHN0
cnVjdCBmaWxlICpmaWxlcCwKIHsKIAlpbnQgcmV0dmFsOwogCXN0cnVjdCBrZmRfaW9jdGxfYWxs
b2NfcXVldWVfZ3dzX2FyZ3MgKmFyZ3MgPSBkYXRhOworCXN0cnVjdCBxdWV1ZSAqcTsKIAlzdHJ1
Y3Qga2ZkX2RldiAqZGV2OwogCiAJaWYgKCFod3NfZ3dzX3N1cHBvcnQpCiAJCXJldHVybiAtRU5P
REVWOwogCi0JZGV2ID0ga2ZkX2RldmljZV9ieV9pZChhcmdzLT5ncHVfaWQpOwotCWlmICghZGV2
KSB7Ci0JCXByX2RlYnVnKCJDb3VsZCBub3QgZmluZCBncHUgaWQgMHgleFxuIiwgYXJncy0+Z3B1
X2lkKTsKLQkJcmV0dXJuIC1FTk9ERVY7CisJbXV0ZXhfbG9jaygmcC0+bXV0ZXgpOworCXEgPSBw
cW1fZ2V0X3VzZXJfcXVldWUoJnAtPnBxbSwgYXJncy0+cXVldWVfaWQpOworCisJaWYgKHEpIHsK
KwkJZGV2ID0gcS0+ZGV2aWNlOworCX0KKwllbHNlIHsKKwkJcmV0dmFsID0gLUVJTlZBTDsKKwkJ
Z290byBvdXRfdW5sb2NrOworCX0KKworCWlmIChkZXYtPmRxbS0+c2NoZWRfcG9saWN5ID09IEtG
RF9TQ0hFRF9QT0xJQ1lfTk9fSFdTKSB7CisJCXJldHZhbCA9IC1FTk9ERVY7CisJCWdvdG8gb3V0
X3VubG9jazsKIAl9Ci0JaWYgKGRldi0+ZHFtLT5zY2hlZF9wb2xpY3kgPT0gS0ZEX1NDSEVEX1BP
TElDWV9OT19IV1MpCi0JCXJldHVybiAtRU5PREVWOwogCi0JbXV0ZXhfbG9jaygmcC0+bXV0ZXgp
OwogCXJldHZhbCA9IHBxbV9zZXRfZ3dzKCZwLT5wcW0sIGFyZ3MtPnF1ZXVlX2lkLCBhcmdzLT5u
dW1fZ3dzID8gZGV2LT5nd3MgOiBOVUxMKTsKIAltdXRleF91bmxvY2soJnAtPm11dGV4KTsKIAog
CWFyZ3MtPmZpcnN0X2d3cyA9IDA7CiAJcmV0dXJuIHJldHZhbDsKKworb3V0X3VubG9jazoKKwlt
dXRleF91bmxvY2soJnAtPm11dGV4KTsKKwlyZXR1cm4gcmV0dmFsOwogfQogCiBzdGF0aWMgaW50
IGtmZF9pb2N0bF9nZXRfZG1hYnVmX2luZm8oc3RydWN0IGZpbGUgKmZpbGVwLApkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaCBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9wcml2LmgKaW5kZXggYWE3YmYyMGQyMGY4Li45YjlhOGRhMTg3Yzgg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmgKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaApAQCAtOTE1LDYgKzkxNSw4IEBA
IGludCBwcW1fc2V0X2d3cyhzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyICpwcW0sIHVuc2ln
bmVkIGludCBxaWQsCiAJCQl2b2lkICpnd3MpOwogc3RydWN0IGtlcm5lbF9xdWV1ZSAqcHFtX2dl
dF9rZXJuZWxfcXVldWUoc3RydWN0IHByb2Nlc3NfcXVldWVfbWFuYWdlciAqcHFtLAogCQkJCQkJ
dW5zaWduZWQgaW50IHFpZCk7CitzdHJ1Y3QgcXVldWUgKnBxbV9nZXRfdXNlcl9xdWV1ZShzdHJ1
Y3QgcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyICpwcW0sCisJCQkJCQl1bnNpZ25lZCBpbnQgcWlkKTsK
IGludCBwcW1fZ2V0X3dhdmVfc3RhdGUoc3RydWN0IHByb2Nlc3NfcXVldWVfbWFuYWdlciAqcHFt
LAogCQkgICAgICAgdW5zaWduZWQgaW50IHFpZCwKIAkJICAgICAgIHZvaWQgX191c2VyICpjdGxf
c3RhY2ssCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vz
c19xdWV1ZV9tYW5hZ2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vz
c19xdWV1ZV9tYW5hZ2VyLmMKaW5kZXggN2U2YzNlZTgyZjViLi43YTYxYTViMDllZDggMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzX3F1ZXVlX21hbmFn
ZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzc19xdWV1ZV9t
YW5hZ2VyLmMKQEAgLTQ3Myw2ICs0NzMsMTUgQEAgc3RydWN0IGtlcm5lbF9xdWV1ZSAqcHFtX2dl
dF9rZXJuZWxfcXVldWUoCiAJcmV0dXJuIE5VTEw7CiB9CiAKK3N0cnVjdCBxdWV1ZSAqcHFtX2dl
dF91c2VyX3F1ZXVlKHN0cnVjdCBwcm9jZXNzX3F1ZXVlX21hbmFnZXIgKnBxbSwKKwkJCQkJdW5z
aWduZWQgaW50IHFpZCkKK3sKKwlzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9ub2RlICpwcW47CisKKwlw
cW4gPSBnZXRfcXVldWVfYnlfcWlkKHBxbSwgcWlkKTsKKwlyZXR1cm4gcHFuID8gcHFuLT5xIDog
TlVMTDsKK30KKwogaW50IHBxbV9nZXRfd2F2ZV9zdGF0ZShzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9t
YW5hZ2VyICpwcW0sCiAJCSAgICAgICB1bnNpZ25lZCBpbnQgcWlkLAogCQkgICAgICAgdm9pZCBf
X3VzZXIgKmN0bF9zdGFjaywKZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC9rZmRfaW9j
dGwuaCBiL2luY2x1ZGUvdWFwaS9saW51eC9rZmRfaW9jdGwuaAppbmRleCAwNzBkMWJjN2U3MjUu
LjRmNjY3NjQyOGM1YyAxMDA2NDQKLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L2tmZF9pb2N0bC5o
CisrKyBiL2luY2x1ZGUvdWFwaS9saW51eC9rZmRfaW9jdGwuaApAQCAtNDEyLDE3ICs0MTIsMTYg
QEAgc3RydWN0IGtmZF9pb2N0bF91bm1hcF9tZW1vcnlfZnJvbV9ncHVfYXJncyB7CiAKIC8qIEFs
bG9jYXRlIEdXUyBmb3Igc3BlY2lmaWMgcXVldWUKICAqCi0gKiBAZ3B1X2lkOiAgICAgIGRldmlj
ZSBpZGVudGlmaWVyCiAgKiBAcXVldWVfaWQ6ICAgIHF1ZXVlJ3MgaWQgdGhhdCBHV1MgaXMgYWxs
b2NhdGVkIGZvcgogICogQG51bV9nd3M6ICAgICBob3cgbWFueSBHV1MgdG8gYWxsb2NhdGUKICAq
IEBmaXJzdF9nd3M6ICAgaW5kZXggb2YgdGhlIGZpcnN0IEdXUyBhbGxvY2F0ZWQuCiAgKiAgICAg
ICAgICAgICAgIG9ubHkgc3VwcG9ydCBjb250aWd1b3VzIEdXUyBhbGxvY2F0aW9uCiAgKi8KIHN0
cnVjdCBrZmRfaW9jdGxfYWxsb2NfcXVldWVfZ3dzX2FyZ3MgewotCV9fdTMyIGdwdV9pZDsJCS8q
IHRvIEtGRCAqLwogCV9fdTMyIHF1ZXVlX2lkOwkJLyogdG8gS0ZEICovCiAJX191MzIgbnVtX2d3
czsJCS8qIHRvIEtGRCAqLwogCV9fdTMyIGZpcnN0X2d3czsJLyogZnJvbSBLRkQgKi8KKwlfX3Uz
MiBwYWQ7CiB9OwogCiBzdHJ1Y3Qga2ZkX2lvY3RsX2dldF9kbWFidWZfaW5mb19hcmdzIHsKLS0g
CjIuMTkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
