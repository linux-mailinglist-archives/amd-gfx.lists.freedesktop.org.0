Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3A314D33F
	for <lists+amd-gfx@lfdr.de>; Wed, 29 Jan 2020 23:52:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C466E455;
	Wed, 29 Jan 2020 22:52:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760074.outbound.protection.outlook.com [40.107.76.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7CB6E455
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 Jan 2020 22:52:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWdWW0FXo1A1fWiQXSn7IhuZxoBP39pd04cbWnN9EoTpo97mhZh5CNnX9yEDSMQMxWXWLV2oeWqe5utdMXawQ7B7HYEY4liCpLhjs7Ag2RrEK7UU6Ci4D0pS8pGK4KNZqeJ2qoMNBuWMFk5YAcUrmD4wzzntTGxeGcnjTujIZ9tgYmrCVDZ2Xpurk2RrDSJ9bc6ydZRuh/cxYcc0Dwhan20sJvucics1FZrVAIBvFZcS47XWOZrOM7MGgqe9hzcM/b5SzSwAj3rnrXD09D0SGPokq+PBqtsZNul3barpodYY11PwN3figxRyPXNK4KF7l1zkFltfsrEqDq9OyGspPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vpZMnwlC1oml/4BJdZ4mZn6EbWgCj6jmEkjZkvdKuKs=;
 b=OPSx/IAoDCEND2tjUI+qmPNuP8mnYcziNLRB94Q3e1ns8MDyy9i/1fxp9IqHOBK+EYfdXfhdqKakwwx4dBT4K136dWLxfNQen50RmPRmu5UM5I8z32kH7FpibkmgS8WSI71xmf6N/1PvMpPPZlxC0BEsqZ/ljAUZve9qSvQfVTHTHZD7CL/T/i42SrDwI8iN8duNYHjDbRL7SgB28RFM6PJqsGpnX4weSh6HEsNsLpyIosJhAYXMwudlZBoMc/pO4StfSQFUy25gBPEk9VHZEOdZzbR0w8XBCFsPydq3wyDBndbALF/zKWJtoDiLpJhWJaTaCEogHjjqYeUQ8K76LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vpZMnwlC1oml/4BJdZ4mZn6EbWgCj6jmEkjZkvdKuKs=;
 b=IEs/Po0X6eZhD/keur81wFIaVV8zk99OotTJUJBrkkdN2smgMHDcAxD4iEsS0uoxlZ/DYsVLdb0UifH7nSEsgqcEazLoXEQYlnu3/dAjkSChvAIYd6jq35FUch9KaeZpkCv3yGIVdwLdkyWRutH67Zw7lABxkFgZlY7reSbRT5s=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
Received: from MWHPR1201MB0095.namprd12.prod.outlook.com (10.174.255.8) by
 MWHPR1201MB0031.namprd12.prod.outlook.com (10.174.99.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.22; Wed, 29 Jan 2020 22:52:21 +0000
Received: from MWHPR1201MB0095.namprd12.prod.outlook.com
 ([fe80::ade9:4cf3:87ad:707]) by MWHPR1201MB0095.namprd12.prod.outlook.com
 ([fe80::ade9:4cf3:87ad:707%11]) with mapi id 15.20.2665.027; Wed, 29 Jan 2020
 22:52:21 +0000
Subject: Re: [Patch v1 5/5] drm/amdkfd: refactor runtime pm for baco
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 amd-gfx@lists.freedesktop.org
References: <20200128012923.25536-1-rajneesh.bhardwaj@amd.com>
 <20200128012923.25536-6-rajneesh.bhardwaj@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <be59d17b-cb49-16e9-db24-c14a8fe4fdee@amd.com>
Date: Wed, 29 Jan 2020 17:52:18 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
In-Reply-To: <20200128012923.25536-6-rajneesh.bhardwaj@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::38) To MWHPR1201MB0095.namprd12.prod.outlook.com
 (2603:10b6:301:4e::8)
MIME-Version: 1.0
Received: from [172.27.225.215] (165.204.55.251) by
 YTOPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2665.20 via Frontend
 Transport; Wed, 29 Jan 2020 22:52:20 +0000
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4cac9aac-5420-4814-0dbf-08d7a50de62b
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0031:|MWHPR1201MB0031:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1201MB003101DA3FA9644CC46551C592050@MWHPR1201MB0031.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 02973C87BC
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(199004)(189003)(26005)(66476007)(66946007)(66556008)(186003)(16526019)(6486002)(86362001)(31696002)(53546011)(16576012)(316002)(5660300002)(31686004)(81166006)(4326008)(2906002)(956004)(2616005)(52116002)(478600001)(36756003)(44832011)(8676002)(8936002)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR1201MB0031;
 H:MWHPR1201MB0095.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v7i0THE85sByx+tDonYgLQeLoXZV4sZsfphMMjDib8xYvih+i12QGw6XNKDD5++Ue7uJUGp3nZmYauctfxzDHgR4mrtkliU7dMSd+EkNAb2cM5LmRj13PocECdrj1GAi+vU3FEHfGcDTVqVF0TuVN09QrraFZ5H3dTLW9N3dhvidvjFE5M0aS5t68BCyMmFquCSOMzvWpUdvzKlt1/klaSExOnT9NxZb70Kxgk6JdSpjnup7BlPTn4u8nNz5QtBPowKT3JvZoXVf3e4m7vteoz8/156nQG4THGnt78bfKIM1rPnaU93FfYYv+E5P4huIRV3xo8Ev5GSwyEQ7rHiqU92yjHba6NSM37nxbHLE+q+xKcfBSoyP8FT6tWGt4vXMHwxBTy5qs37xP/CXQct+KmxNhdfeaDRFjWexi62jU4D/xvC+7pE0yakkPWDzNOd/
X-MS-Exchange-AntiSpam-MessageData: cm/+fZwNZ0s0xvR+FB1kxaXYja5N+aJ/+Pd/v3I5zDMWT+kFP9rsIQThhFuQ/w+ZR4KrM3ntEPIJj9kLaOSQYsjAN6ue8LyAbs/a0iqFbCoa7i2gN7YTJDGdUoDYbS0rkqC6IfxAFOClypUE3IMyGg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cac9aac-5420-4814-0dbf-08d7a50de62b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2020 22:52:21.3862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HZLqrHRBfIvpV+ltKGshJM/L7LjnfC8Qo5uhnvov4vUGxOIfTMrSRVpwTYn25RZXUhABjFaoWljTjGsJud4E9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0031
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
Cc: Alexander.Deucher@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SEkgUmFqbmVlc2gsCgpTZWUgY29tbWVudHMgaW5saW5lIC4uLgoKQW5kIGEgZ2VuZXJhbCBxdWVz
dGlvbjogV2h5IGRvIHlvdSBuZWVkIHRvIHNldCB0aGUgYXV0b3N1c3BlbmRfZGVsYXkgaW4gCnNv
IG1hbnkgcGxhY2VzPyBBbWRncHUgb25seSBoYXMgYSBzaW5nbGUgY2FsbCB0byB0aGlzIGZ1bmN0
aW9uIGR1cmluZyAKaW5pdGlhbGl6YXRpb24uCgpPbiAyMDIwLTAxLTI3IDIwOjI5LCBSYWpuZWVz
aCBCaGFyZHdhaiB3cm90ZToKPiBTbyBmYXIgdGhlIGtmZCBkcml2ZXIgaW1wbGVtZW50ZWQgc2Ft
ZSByb3V0aW5lcyBmb3IgcnVudGltZSBhbmQgc3lzdGVtCj4gd2lkZSBzdXNwZW5kIGFuZCByZXN1
bWUgKHMyaWRsZSBvciBtZW0pLiBEdXJpbmcgc3lzdGVtIHdpZGUgc3VzcGVuZCB0aGUKPiBrZmQg
YXF1aXJlcyBhbiBhdG9taWMgbG9jayB0aGF0IHByZXZlbnRzIGFueSBtb3JlIHVzZXIgcHJvY2Vz
c2VzIHRvCj4gY3JlYXRlIHF1ZXVlcyBhbmQgaW50ZXJhY3Qgd2l0aCBrZmQgZHJpdmVyIGFuZCBh
bWQgZ3B1LiBUaGlzIG1lY2hhbmlzbQo+IGNyZWF0ZWQgcHJvYmxlbSB3aGVuIGFtZGdwdSBkZXZp
Y2UgaXMgcnVudGltZSBzdXNwZW5kZWQgd2l0aCBCQUNPCj4gZW5hYmxlZC4gQW55IGFwcGxpY2F0
aW9uIHRoYXQgcmVsaWVzIG9uIGtmZCBkcml2ZXIgZmFpbHMgdG8gbG9hZCBiZWNhdXNlCj4gdGhl
IGRyaXZlciByZXBvcnRzIGEgbG9ja2VkIGtmZCBkZXZpY2Ugc2luY2UgZ3B1IGlzIHJ1bnRpbWUg
c3VzcGVuZGVkLgo+Cj4gSG93ZXZlciwgaW4gYW4gaWRlYWwgY2FzZSwgd2hlbiBncHUgaXMgcnVu
dGltZSAgc3VzcGVuZGVkIHRoZSBrZmQgZHJpdmVyCj4gc2hvdWxkIGJlIGFibGUgdG86Cj4KPiAg
IC0gYXV0byByZXN1bWUgYW1kZ3B1IGRyaXZlciB3aGVuZXZlciBhIGNsaWVudCByZXF1ZXN0cyBj
b21wdXRlIHNlcnZpY2UKPiAgIC0gcHJldmVudCBydW50aW1lIHN1c3BlbmQgZm9yIGFtZGdwdSAg
d2hpbGUga2ZkIGlzIGluIHVzZQo+Cj4gVGhpcyBjaGFuZ2UgcmVmYWN0b3JzIHRoZSBhbWRncHUg
YW5kIGFtZGtmZCBkcml2ZXJzIHRvIHN1cHBvcnQgQkFDTyBhbmQKPiBydW50aW1lIHJ1bnRpbWUg
cG93ZXIgbWFuYWdlbWVudC4KPgo+IFNpZ25lZC1vZmYtYnk6IFJham5lZXNoIEJoYXJkd2FqIDxy
YWpuZWVzaC5iaGFyZHdhakBhbWQuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2FtZGtmZC5jIHwgMTIgKysrKy0tLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmggfCAgOCArKystLS0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8ICA0ICstLQo+ICAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRrZmQva2ZkX2RldmljZS5jICAgIHwgMzEgKysrKysrKysrKysrKy0tLS0tLS0tLQo+
ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2lvbW11LmMgICAgIHwgIDUgKysrLQo+
ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3MuYyAgIHwgMTkgKysrKysr
KysrKy0tLQo+ICAgNiBmaWxlcyBjaGFuZ2VkLCA1MSBpbnNlcnRpb25zKCspLCAyOCBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
YW1ka2ZkLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmMKPiBp
bmRleCA4NjA5Mjg3NjIwZWEuLjMxNGM0YTJhMDM1NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmMKPiBAQCAtMTc4LDE4ICsxNzgsMTggQEAgdm9pZCBh
bWRncHVfYW1ka2ZkX2ludGVycnVwdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPiAgIAkJ
a2dkMmtmZF9pbnRlcnJ1cHQoYWRldi0+a2ZkLmRldiwgaWhfcmluZ19lbnRyeSk7Cj4gICB9Cj4g
ICAKPiAtdm9pZCBhbWRncHVfYW1ka2ZkX3N1c3BlbmQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpCj4gK3ZvaWQgYW1kZ3B1X2FtZGtmZF9zdXNwZW5kKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LCBib29sIHJ1bl9wbSkKPiAgIHsKPiAgIAlpZiAoYWRldi0+a2ZkLmRldikKPiAtCQlrZ2Qy
a2ZkX3N1c3BlbmQoYWRldi0+a2ZkLmRldik7Cj4gKwkJa2dkMmtmZF9zdXNwZW5kKGFkZXYtPmtm
ZC5kZXYsIHJ1bl9wbSk7Cj4gICB9Cj4gICAKPiAtaW50IGFtZGdwdV9hbWRrZmRfcmVzdW1lKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICtpbnQgYW1kZ3B1X2FtZGtmZF9yZXN1bWUoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGJvb2wgcnVuX3BtKQo+ICAgewo+ICAgCWludCByID0g
MDsKPiAgIAo+ICAgCWlmIChhZGV2LT5rZmQuZGV2KQo+IC0JCXIgPSBrZ2Qya2ZkX3Jlc3VtZShh
ZGV2LT5rZmQuZGV2KTsKPiArCQlyID0ga2dkMmtmZF9yZXN1bWUoYWRldi0+a2ZkLmRldiwgcnVu
X3BtKTsKPiAgIAo+ICAgCXJldHVybiByOwo+ICAgfQo+IEBAIC03MTMsMTEgKzcxMywxMSBAQCB2
b2lkIGtnZDJrZmRfZXhpdCh2b2lkKQo+ICAgewo+ICAgfQo+ICAgCj4gLXZvaWQga2dkMmtmZF9z
dXNwZW5kKHN0cnVjdCBrZmRfZGV2ICprZmQpCj4gK3ZvaWQga2dkMmtmZF9zdXNwZW5kKHN0cnVj
dCBrZmRfZGV2ICprZmQsIGJvb2wgcnVuX3BtKQo+ICAgewo+ICAgfQo+ICAgCj4gLWludCBrZ2Qy
a2ZkX3Jlc3VtZShzdHJ1Y3Qga2ZkX2RldiAqa2ZkKQo+ICtpbnQga2dkMmtmZF9yZXN1bWUoc3Ry
dWN0IGtmZF9kZXYgKmtmZCwgYm9vbCBydW5fcG0pCj4gICB7Cj4gICAJcmV0dXJuIDA7Cj4gICB9
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQu
aCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuaAo+IGluZGV4IDBm
YTg5OGQzMDIwNy4uM2RjZTRhNTFlNTIyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9hbWRrZmQuaAo+IEBAIC0xMjMsOCArMTIzLDggQEAgc3RydWN0IGFtZGtmZF9w
cm9jZXNzX2luZm8gewo+ICAgaW50IGFtZGdwdV9hbWRrZmRfaW5pdCh2b2lkKTsKPiAgIHZvaWQg
YW1kZ3B1X2FtZGtmZF9maW5pKHZvaWQpOwo+ICAgCj4gLXZvaWQgYW1kZ3B1X2FtZGtmZF9zdXNw
ZW5kKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKPiAtaW50IGFtZGdwdV9hbWRrZmRfcmVz
dW1lKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKPiArdm9pZCBhbWRncHVfYW1ka2ZkX3N1
c3BlbmQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGJvb2wgcnVuX3BtKTsKPiAraW50IGFt
ZGdwdV9hbWRrZmRfcmVzdW1lKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBib29sIHJ1bl9w
bSk7Cj4gICB2b2lkIGFtZGdwdV9hbWRrZmRfaW50ZXJydXB0KHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2LAo+ICAgCQkJY29uc3Qgdm9pZCAqaWhfcmluZ19lbnRyeSk7Cj4gICB2b2lkIGFtZGdw
dV9hbWRrZmRfZGV2aWNlX3Byb2JlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKPiBAQCAt
MjUwLDggKzI1MCw4IEBAIGJvb2wga2dkMmtmZF9kZXZpY2VfaW5pdChzdHJ1Y3Qga2ZkX2RldiAq
a2ZkLAo+ICAgCQkJIHN0cnVjdCBkcm1fZGV2aWNlICpkZGV2LAo+ICAgCQkJIGNvbnN0IHN0cnVj
dCBrZ2Qya2ZkX3NoYXJlZF9yZXNvdXJjZXMgKmdwdV9yZXNvdXJjZXMpOwo+ICAgdm9pZCBrZ2Qy
a2ZkX2RldmljZV9leGl0KHN0cnVjdCBrZmRfZGV2ICprZmQpOwo+IC12b2lkIGtnZDJrZmRfc3Vz
cGVuZChzdHJ1Y3Qga2ZkX2RldiAqa2ZkKTsKPiAtaW50IGtnZDJrZmRfcmVzdW1lKHN0cnVjdCBr
ZmRfZGV2ICprZmQpOwo+ICt2b2lkIGtnZDJrZmRfc3VzcGVuZChzdHJ1Y3Qga2ZkX2RldiAqa2Zk
LCBib29sIHJ1bl9wbSk7Cj4gK2ludCBrZ2Qya2ZkX3Jlc3VtZShzdHJ1Y3Qga2ZkX2RldiAqa2Zk
LCBib29sIHJ1bl9wbSk7Cj4gICBpbnQga2dkMmtmZF9wcmVfcmVzZXQoc3RydWN0IGtmZF9kZXYg
KmtmZCk7Cj4gICBpbnQga2dkMmtmZF9wb3N0X3Jlc2V0KHN0cnVjdCBrZmRfZGV2ICprZmQpOwo+
ICAgdm9pZCBrZ2Qya2ZkX2ludGVycnVwdChzdHJ1Y3Qga2ZkX2RldiAqa2ZkLCBjb25zdCB2b2lk
ICppaF9yaW5nX2VudHJ5KTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rl
dmljZS5jCj4gaW5kZXggZDllNWVhYzE4MmQzLi43ODdkNDllOWY0ZGUgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCj4gQEAgLTMzMTQsNyArMzMxNCw3
IEBAIGludCBhbWRncHVfZGV2aWNlX3N1c3BlbmQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgYm9v
bCBmYmNvbikKPiAgIAkJfQo+ICAgCX0KPiAgIAo+IC0JYW1kZ3B1X2FtZGtmZF9zdXNwZW5kKGFk
ZXYpOwo+ICsJYW1kZ3B1X2FtZGtmZF9zdXNwZW5kKGFkZXYsIGZiY29uKTsKClRoZSBsb2dpYyBz
ZWVtcyBpbnZlcnRlZCBoZXJlLiBUaGVyZSBhcmUgZm91ciBkaWZmZXJlbnQgcG1vcHMgY2FsbGJh
Y2tzIAp0aGF0IHVzZSBkaWZmZXJlbnQgdmFsdWVzIGZvciB0aGlzIHBhcmFtZXRlcjoKCiogYW1k
Z3B1X3Btb3BzX3N1c3BlbmQ6IHRydWUKKiBhbWRncHVfcG1vcHNfZnJlZXplOiB0cnVlCiogYW1k
Z3B1X3Btb3BzX3Bvd2Vyb2ZmOiB0cnVlCiogYW1kZ3B1X3Btb3BzX3J1bnRpbWVfc3VzcGVuZDog
ZmFsc2UKCkl0IGxvb2tzIGxpa2UgcnVudGltZV9zdXNwZW5kIHVzZXMgZmFsc2UsIHNvIHlvdSBz
aG91bGQgcGFzcyB0aGUgcnVuX3BtIApwYXJhbWV0ZXIgYXMgIWZiY29uLgoKCj4gICAKPiAgIAlh
bWRncHVfcmFzX3N1c3BlbmQoYWRldik7Cj4gICAKPiBAQCAtMzM5OCw3ICszMzk4LDcgQEAgaW50
IGFtZGdwdV9kZXZpY2VfcmVzdW1lKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIGJvb2wgZmJjb24p
Cj4gICAJCQl9Cj4gICAJCX0KPiAgIAl9Cj4gLQlyID0gYW1kZ3B1X2FtZGtmZF9yZXN1bWUoYWRl
dik7Cj4gKwlyID0gYW1kZ3B1X2FtZGtmZF9yZXN1bWUoYWRldiwgZmJjb24pOwo+ICAgCWlmIChy
KQo+ICAgCQlyZXR1cm4gcjsKPiAgIAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2
aWNlLmMKPiBpbmRleCAyYTllNDAxMzE3MzUuLmU5ZjAwYzNhMDY3YSAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMKPiBAQCAtMjMsNiArMjMsNyBAQAo+ICAgI2lu
Y2x1ZGUgPGxpbnV4L2JzZWFyY2guaD4KPiAgICNpbmNsdWRlIDxsaW51eC9wY2kuaD4KPiAgICNp
bmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+Cj4g
ICAjaW5jbHVkZSAia2ZkX3ByaXYuaCIKPiAgICNpbmNsdWRlICJrZmRfZGV2aWNlX3F1ZXVlX21h
bmFnZXIuaCIKPiAgICNpbmNsdWRlICJrZmRfcG00X2hlYWRlcnNfdmkuaCIKPiBAQCAtNzEwLDcg
KzcxMSw3IEBAIGJvb2wga2dkMmtmZF9kZXZpY2VfaW5pdChzdHJ1Y3Qga2ZkX2RldiAqa2ZkLAo+
ICAgdm9pZCBrZ2Qya2ZkX2RldmljZV9leGl0KHN0cnVjdCBrZmRfZGV2ICprZmQpCj4gICB7Cj4g
ICAJaWYgKGtmZC0+aW5pdF9jb21wbGV0ZSkgewo+IC0JCWtnZDJrZmRfc3VzcGVuZChrZmQpOwo+
ICsJCWtnZDJrZmRfc3VzcGVuZChrZmQsIHRydWUpOwo+ICAgCQlkZXZpY2VfcXVldWVfbWFuYWdl
cl91bmluaXQoa2ZkLT5kcW0pOwo+ICAgCQlrZmRfaW50ZXJydXB0X2V4aXQoa2ZkKTsKPiAgIAkJ
a2ZkX3RvcG9sb2d5X3JlbW92ZV9kZXZpY2Uoa2ZkKTsKPiBAQCAtNzMxLDcgKzczMiw3IEBAIGlu
dCBrZ2Qya2ZkX3ByZV9yZXNldChzdHJ1Y3Qga2ZkX2RldiAqa2ZkKQo+ICAgCj4gICAJa2ZkLT5k
cW0tPm9wcy5wcmVfcmVzZXQoa2ZkLT5kcW0pOwo+ICAgCj4gLQlrZ2Qya2ZkX3N1c3BlbmQoa2Zk
KTsKPiArCWtnZDJrZmRfc3VzcGVuZChrZmQsIHRydWUpOwoKVGhpcyBzaG91bGQgdXNlIGZhbHNl
LiBUaGlzIGlzIG5vdCBydW50aW1lIFBNLgoKCj4gICAKPiAgIAlrZmRfc2lnbmFsX3Jlc2V0X2V2
ZW50KGtmZCk7Cj4gICAJcmV0dXJuIDA7Cj4gQEAgLTc2NSwyMSArNzY2LDI0IEBAIGJvb2wga2Zk
X2lzX2xvY2tlZCh2b2lkKQo+ICAgCXJldHVybiAgKGF0b21pY19yZWFkKCZrZmRfbG9ja2VkKSA+
IDApOwo+ICAgfQo+ICAgCj4gLXZvaWQga2dkMmtmZF9zdXNwZW5kKHN0cnVjdCBrZmRfZGV2ICpr
ZmQpCj4gK3ZvaWQga2dkMmtmZF9zdXNwZW5kKHN0cnVjdCBrZmRfZGV2ICprZmQsIGJvb2wgcnVu
X3BtKQo+ICAgewo+ICAgCWlmICgha2ZkLT5pbml0X2NvbXBsZXRlKQo+ICAgCQlyZXR1cm47Cj4g
ICAKPiAtCS8qIEZvciBmaXJzdCBLRkQgZGV2aWNlIHN1c3BlbmQgYWxsIHRoZSBLRkQgcHJvY2Vz
c2VzICovCj4gLQlpZiAoYXRvbWljX2luY19yZXR1cm4oJmtmZF9sb2NrZWQpID09IDEpCj4gLQkJ
a2ZkX3N1c3BlbmRfYWxsX3Byb2Nlc3NlcygpOwo+ICsJLyogZm9yIHJ1bnRpbWUgc3VzcGVuZCwg
c2tpcCBsb2NraW5nIGtmZCAqLwo+ICsJaWYgKHJ1bl9wbSkgewoKVGhpcyBzaG91bGQgYmUgZG9u
ZSBmb3IgdGhlIG5vbi1ydW50aW1lIFBNIGNhc2U6IGlmICghcnVuX3BtKS4KCgo+ICsJCS8qIEZv
ciBmaXJzdCBLRkQgZGV2aWNlIHN1c3BlbmQgYWxsIHRoZSBLRkQgcHJvY2Vzc2VzICovCj4gKwkJ
aWYgKGF0b21pY19pbmNfcmV0dXJuKCZrZmRfbG9ja2VkKSA9PSAxKQo+ICsJCQlrZmRfc3VzcGVu
ZF9hbGxfcHJvY2Vzc2VzKCk7Cj4gKwl9Cj4gICAKPiArCXBtX3J1bnRpbWVfc2V0X2F1dG9zdXNw
ZW5kX2RlbGF5KGtmZC0+ZGRldi0+ZGV2LCA1MDAwKTsKPiAgIAlrZmQtPmRxbS0+b3BzLnN0b3Ao
a2ZkLT5kcW0pOwo+IC0KPiAgIAlrZmRfaW9tbXVfc3VzcGVuZChrZmQpOwo+ICAgfQo+ICAgCj4g
LWludCBrZ2Qya2ZkX3Jlc3VtZShzdHJ1Y3Qga2ZkX2RldiAqa2ZkKQo+ICtpbnQga2dkMmtmZF9y
ZXN1bWUoc3RydWN0IGtmZF9kZXYgKmtmZCwgYm9vbCBydW5fcG0pCj4gICB7Cj4gICAJaW50IHJl
dCwgY291bnQ7Cj4gICAKPiBAQCAtNzkwLDEwICs3OTQsMTMgQEAgaW50IGtnZDJrZmRfcmVzdW1l
KHN0cnVjdCBrZmRfZGV2ICprZmQpCj4gICAJaWYgKHJldCkKPiAgIAkJcmV0dXJuIHJldDsKPiAg
IAo+IC0JY291bnQgPSBhdG9taWNfZGVjX3JldHVybigma2ZkX2xvY2tlZCk7Cj4gLQlXQVJOX09O
Q0UoY291bnQgPCAwLCAiS0ZEIHN1c3BlbmQgLyByZXN1bWUgcmVmLiBlcnJvciIpOwo+IC0JaWYg
KGNvdW50ID09IDApCj4gLQkJcmV0ID0ga2ZkX3Jlc3VtZV9hbGxfcHJvY2Vzc2VzKCk7Cj4gKwkv
KiBmb3IgcnVudGltZSByZXN1bWUsIHNraXAgdW5sb2NraW5nIGtmZCAqLwo+ICsJaWYgKHJ1bl9w
bSkgewoKU2FtZSBhcyBhYm92ZS4KCgo+ICsJCWNvdW50ID0gYXRvbWljX2RlY19yZXR1cm4oJmtm
ZF9sb2NrZWQpOwo+ICsJCVdBUk5fT05DRShjb3VudCA8IDAsICJLRkQgc3VzcGVuZCAvIHJlc3Vt
ZSByZWYuIGVycm9yIik7Cj4gKwkJaWYgKGNvdW50ID09IDApCj4gKwkJCXJldCA9IGtmZF9yZXN1
bWVfYWxsX3Byb2Nlc3NlcygpOwo+ICsJfQo+ICAgCj4gICAJcmV0dXJuIHJldDsKPiAgIH0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2lvbW11LmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfaW9tbXUuYwo+IGluZGV4IDhkODcxNTE0NjcxZS4u
NjMwMWQ3N2VkM2Q2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9pb21tdS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2lvbW11LmMK
PiBAQCAtMjUsNiArMjUsNyBAQAo+ICAgI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KPiAgICNpbmNs
dWRlIDxsaW51eC9wY2kuaD4KPiAgICNpbmNsdWRlIDxsaW51eC9hbWQtaW9tbXUuaD4KPiArI2lu
Y2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4KPiAgICNpbmNsdWRlICJrZmRfcHJpdi5oIgo+ICAg
I2luY2x1ZGUgImtmZF9kYmdtZ3IuaCIKPiAgICNpbmNsdWRlICJrZmRfdG9wb2xvZ3kuaCIKPiBA
QCAtMTM0LDggKzEzNSwxMCBAQCB2b2lkIGtmZF9pb21tdV91bmJpbmRfcHJvY2VzcyhzdHJ1Y3Qg
a2ZkX3Byb2Nlc3MgKnApCj4gICAJc3RydWN0IGtmZF9wcm9jZXNzX2RldmljZSAqcGRkOwo+ICAg
Cj4gICAJbGlzdF9mb3JfZWFjaF9lbnRyeShwZGQsICZwLT5wZXJfZGV2aWNlX2RhdGEsIHBlcl9k
ZXZpY2VfbGlzdCkKPiAtCQlpZiAocGRkLT5ib3VuZCA9PSBQRERfQk9VTkQpCj4gKwkJaWYgKHBk
ZC0+Ym91bmQgPT0gUEREX0JPVU5EKSB7Cj4gICAJCQlhbWRfaW9tbXVfdW5iaW5kX3Bhc2lkKHBk
ZC0+ZGV2LT5wZGV2LCBwLT5wYXNpZCk7Cj4gKwkJCXBtX3J1bnRpbWVfc2V0X2F1dG9zdXNwZW5k
X2RlbGF5KHBkZC0+ZGV2LT5kZGV2LT5kZXYsIDUwMDApOwoKSSBkb24ndCB0aGluayB0aGlzIGlz
IHRoZSByaWdodCBwbGFjZS4gVGhpcyBjb2RlIHNob3VsZCBvbmx5IHJ1biBvbiBBUFVzIAp3aXRo
IElPTU1VdjIgZW5hYmxlZC4gUHJvYmFibHkgbWlzc2luZyBhIGNoZWNrIGF0IHRoZSBzdGFydCBv
ZiB0aGUgCmZ1bmN0aW9uLiBPbiBrZXJuZWxzIHdpdGggSU9NTVUgZGlzYWJsZWQsIHRoaXMgc291
cmNlIGZpbGUgaXMgbm90IApjb21waWxlZCBhdCBhbGwuCgpJIHRoaW5rIHRoaXMgY29kZSBzaG91
bGQgZ28gaW50byBrZmRfcHJvY2Vzc19kZXN0cm95X3BkZHMuCgoKPiArCQl9Cj4gICB9Cj4gICAK
PiAgIC8qIENhbGxiYWNrIGZvciBwcm9jZXNzIHNodXRkb3duIGludm9rZWQgYnkgdGhlIElPTU1V
IGRyaXZlciAqLwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRf
cHJvY2Vzcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3MuYwo+IGlu
ZGV4IDI1YjkwZjcwYWVjZC4uZDE5ZDVlOTc0MDVjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfcHJvY2Vzcy5jCj4gQEAgLTMxLDYgKzMxLDcgQEAKPiAgICNpbmNsdWRlIDxs
aW51eC9jb21wYXQuaD4KPiAgICNpbmNsdWRlIDxsaW51eC9tbWFuLmg+Cj4gICAjaW5jbHVkZSA8
bGludXgvZmlsZS5oPgo+ICsjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPgo+ICAgI2luY2x1
ZGUgImFtZGdwdV9hbWRrZmQuaCIKPiAgICNpbmNsdWRlICJhbWRncHUuaCIKPiAgIAo+IEBAIC04
NDMsMTUgKzg0NCwyNyBAQCBzdHJ1Y3Qga2ZkX3Byb2Nlc3NfZGV2aWNlICprZmRfYmluZF9wcm9j
ZXNzX3RvX2RldmljZShzdHJ1Y3Qga2ZkX2RldiAqZGV2LAo+ICAgCQlyZXR1cm4gRVJSX1BUUigt
RU5PTUVNKTsKPiAgIAl9Cj4gICAKPiArCWVyciA9IHBtX3J1bnRpbWVfZ2V0X3N5bmMoZGV2LT5k
ZGV2LT5kZXYpOwo+ICsJcG1fcnVudGltZV9zZXRfYXV0b3N1c3BlbmRfZGVsYXkoZGV2LT5kZGV2
LT5kZXYsIDYwMDAwKTsKCldoeSBhcmUgeW91IHVzaW5nIGEgZGlmZmVyZW50IGhhcmQtY29kZWQg
ZGVsYXkgKDYwcz8pIGhlcmU/CgpSZWdhcmRzLAogwqAgRmVsaXgKCj4gKwlpZiAoZXJyIDwgMCkK
PiArCQlyZXR1cm4gRVJSX1BUUihlcnIpOwo+ICsKPiAgIAllcnIgPSBrZmRfaW9tbXVfYmluZF9w
cm9jZXNzX3RvX2RldmljZShwZGQpOwo+ICAgCWlmIChlcnIpCj4gLQkJcmV0dXJuIEVSUl9QVFIo
ZXJyKTsKPiArCQlnb3RvIG91dDsKPiAgIAo+ICAgCWVyciA9IGtmZF9wcm9jZXNzX2RldmljZV9p
bml0X3ZtKHBkZCwgTlVMTCk7Cj4gICAJaWYgKGVycikKPiAtCQlyZXR1cm4gRVJSX1BUUihlcnIp
Owo+ICsJCWdvdG8gb3V0Owo+ICAgCj4gLQlyZXR1cm4gcGRkOwo+ICtvdXQ6Cj4gKwlwbV9ydW50
aW1lX21hcmtfbGFzdF9idXN5KGRldi0+ZGRldi0+ZGV2KTsKPiArCXBtX3J1bnRpbWVfcHV0X2F1
dG9zdXNwZW5kKGRldi0+ZGRldi0+ZGV2KTsKPiArCj4gKwlpZiAoIWVycikKPiArCQlyZXR1cm4g
cGRkOwo+ICsJZWxzZQo+ICsJCXJldHVybiBFUlJfUFRSKGVycik7Cj4gICB9Cj4gICAKPiAgIHN0
cnVjdCBrZmRfcHJvY2Vzc19kZXZpY2UgKmtmZF9nZXRfZmlyc3RfcHJvY2Vzc19kZXZpY2VfZGF0
YSgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
