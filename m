Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2360518234D
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Mar 2020 21:32:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF4B6E9FD;
	Wed, 11 Mar 2020 20:32:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 417906E9FD
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Mar 2020 20:32:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gRtV6+qiN+/fdVlhjg4SH/y+si2ANu8xmuxkEDTIpjM+PTzN4rEX4jhSxGOSyilsh26WJoQocEEvYj3twHEyUaPeBNu+YRbtUzH6hoUUIKOweY413KFT972wB6mxY0dq0fohW6AwR9QDSLtOmvfZpmat8mj9FSW1ob5HNwjyzxgQd5JHa7XIhwj8kRt00y9FXcK4bZgQqIuAfh5TWQnl4NEGpOEB7kGClO3T5EUAMMsdm2GIGnyYMbpdSw13G+z9kJrgbLfTusuOW36Q+M6+SUfIxlQKttVJOw3KX5hiQ8O7pExfkaGm2YE/OP8hUVTExInxVNLGXFgzXj6B8Skqyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l66xtCe6lDoS+5kHO4guYafE+k5E4sKFkQJ/RaPFnGM=;
 b=Wx1hJn5TjbQHfmvPMckupdvK1lXb5FcsQxVbv6fRNomDFQj+JYBpD8bnNjwzmjfaYf0kl9MhhGIJd2oDyoHrhtxOp+2cICyYcFQ5kivbejSlcArGmniBaJrrg1VhbYORU6kQ9Sjf3vDG8x99GlCVrOUHMvUy8W9+R6I91gUJVESqhYnBZSIpu5x+2ifix5Aw4KD/Ul6md4tzyky4NTUqr2WXw2Lvzw+U7LgcnkZm1yeOia/3anRqcuJmQLOEFmJYz/K1CSH/bEHEevTQdeGaekFUDAuzDlm7OvXKvOaI4Qc3wteMmHDDJ/lKe7g4d28DrtD6Z6ADTbn2GKY0dksS+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l66xtCe6lDoS+5kHO4guYafE+k5E4sKFkQJ/RaPFnGM=;
 b=k9GXdWT1cn/6xk0eXUCOVGJiG5R2zNme4OIfH5jKe+7In03CLJRFz52AYEQkUa9CvMzywDSYgJf6ui5u4whWdWbDFyYmnSfcEwmEz1zNOHE1ZtMPHBeQTkrJCq2ipLyNmq5u96VADBytmH9/hFWd23T6DXM2RsphHZVCuwKME+o=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nirmoy.Das@amd.com; 
Received: from DM5PR12MB2376.namprd12.prod.outlook.com (2603:10b6:4:b9::11) by
 DM5PR12MB1291.namprd12.prod.outlook.com (2603:10b6:3:75::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.17; Wed, 11 Mar 2020 20:32:36 +0000
Received: from DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::ac12:6413:cd14:4904]) by DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::ac12:6413:cd14:4904%4]) with mapi id 15.20.2793.018; Wed, 11 Mar 2020
 20:32:36 +0000
Subject: Re: [PATCH 1/1] drm/amdgpu: disable gpu_sched load balancer for vcn
 jobs
To: James Zhu <jamesz@amd.com>, 20200311195759.49332-1-nirmoy.das@amd.com,
 amd-gfx@lists.freedesktop.org
References: <20200311200032.50502-1-nirmoy.das@amd.com>
 <1f915a39-947b-bd06-7db0-8d748095fb52@amd.com>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <3ebdce1d-de24-4813-38ab-4ad2d70cd15e@amd.com>
Date: Wed, 11 Mar 2020 21:36:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <1f915a39-947b-bd06-7db0-8d748095fb52@amd.com>
Content-Language: en-US
X-ClientProxiedBy: ZR0P278CA0030.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::17) To DM5PR12MB2376.namprd12.prod.outlook.com
 (2603:10b6:4:b9::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2003:c5:8f28:ae00:bd65:d97d:c346:e601]
 (2003:c5:8f28:ae00:bd65:d97d:c346:e601) by
 ZR0P278CA0030.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1c::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.17 via Frontend Transport; Wed, 11 Mar 2020 20:32:34 +0000
X-Originating-IP: [2003:c5:8f28:ae00:bd65:d97d:c346:e601]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ea81af30-53d0-4bea-090d-08d7c5fb55cf
X-MS-TrafficTypeDiagnostic: DM5PR12MB1291:|DM5PR12MB1291:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1291FD74646486E924DCE6A18BFC0@DM5PR12MB1291.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:785;
X-Forefront-PRVS: 0339F89554
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(366004)(396003)(136003)(199004)(6486002)(53546011)(478600001)(31686004)(36756003)(2906002)(81156014)(81166006)(8676002)(8936002)(52116002)(316002)(31696002)(16526019)(2616005)(66946007)(186003)(66476007)(66556008)(5660300002)(4326008)(6666004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1291;
 H:DM5PR12MB2376.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h0LeVqW8sFqssHWLIs3M1MccC9efn32a0ih/ar9N3EwAo4xDdRuoNOR7WTjzhYDFfYdOEXCUM5o+ZZ5kH+xpfC3/Oxjl6y2uKXUm+SSJV0CiF1qnNsvJuE5kbmg6snbGMLpuOc8ci2F6f9SCsmptAYZNPy0J7FkEZzSajdlnhQHlqPgz6L7JVlR/9c1t5sfw2FXt5Vp/PnOZrIM/j04LO5pI6//GirYIrcuF9mR9KMDYeL/b4hWlJds8NQ4zOGowk3aOFpjFDRp67DWm2QD7kOR3pp2fPi30CJBTznscTZc+jBJa86ffceiWX6rlDUTwxNu3GEyYqDKo5jnm4f76LuCRLhsXSQY+5miDXgT7+JFqwUc0o+ttV4Cj7iF4fdzL6N/eJmeyM7jas9J1FPudjw8dmjIDxyookuPWYufqYdHkpShZ/mfe1H9SIXr7Mp/C
X-MS-Exchange-AntiSpam-MessageData: grMfyhqmCw4VjX4nrI7wEmMxN2NdmZMnEy9xgZZHhshdpbX6qYRz9m17W4SrpZ+tegF9NNp8cV+N6PGGfV6y91t7asojgP466D0oRJuxBuuTTXsybDhoCjva8Tv6fO9oCfrSaxfHDPqWj6pSgUuCYZ6Ua/FevnK0Vg518947/dwqRxycIHCaMqkBuysARXKMUoPrRcLAmc5StKr0O4BE9A==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea81af30-53d0-4bea-090d-08d7c5fb55cf
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2020 20:32:36.4788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e0Ihzl9FEUFbhfSTW1MqIcaIfM3hQR/KNxCq69Ojpj18SUdhbR+3kp2Oe4HusqBHxLYrO3mCWJZZWfl3iDTTGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1291
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
Cc: Boyuan.Zhang@amd.com, nirmoy.das@amd.com, alexander.deucher@amd.com,
 James.Zhu@amd.com, Leo.Liu@amd.com, christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Ck9uIDMvMTEvMjAgOToxNCBQTSwgSmFtZXMgWmh1IHdyb3RlOgo+Cj4gT24gMjAyMC0wMy0xMSA0
OjAwIHAubS4sIE5pcm1veSBEYXMgd3JvdGU6Cj4+IFZDTiBIV8KgIGRvZXNuJ3Qgc3VwcG9ydCBk
eW5hbWljIGxvYWQgYmFsYW5jZSBvbiBtdWx0aXBsZQo+PiBpbnN0YW5jZXMgZm9yIGEgY29udGV4
dC4gVGhpcyBwYXRjaCBtb2RpZmllcyBlbnRpdHkncwo+PiBzY2hlZF9saXN0IHRvIGEgc2NoZWRf
bGlzdCBjb25zaXN0IG9mIG9ubHkgb25lIGRybSBzY2hlZHVsZXIuCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IE5pcm1veSBEYXMgPG5pcm1veS5kYXNAYW1kLmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jwqDCoCB8wqAgNCArKysrCj4+IMKgIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jdHguY8KgIHwgMTMgKysrKysrKysrKysrKwo+
PiDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmjCoCB8wqAgMSArCj4+
IMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2IuY8KgIHzCoCAzICsrKwo+
PiDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmluZy5oIHzCoCAxICsKPj4g
wqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YxXzAuY8KgwqDCoCB8wqAgMiArKwo+
PiDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jwqDCoMKgIHzCoCAyICsr
Cj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml81LmPCoMKgwqAgfMKgIDIg
KysKPj4gwqAgOCBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYyAKPj4gYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYwo+PiBpbmRleCA4MzA0ZDBjODc4OTkuLmRi
MGVlZjE5YzYzNiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2NzLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMK
Pj4gQEAgLTEyMDMsNiArMTIwMyw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2NzX3N1Ym1pdChzdHJ1
Y3QgCj4+IGFtZGdwdV9jc19wYXJzZXIgKnAsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgdW5pb24gZHJtX2FtZGdwdV9jcyAqY3MpCj4+IMKgIHsKPj4gwqDCoMKgwqDCoCBz
dHJ1Y3QgYW1kZ3B1X2Zwcml2ICpmcHJpdiA9IHAtPmZpbHAtPmRyaXZlcl9wcml2Owo+PiArwqDC
oMKgIHN0cnVjdCBhbWRncHVfcmluZyAqcmluZyA9IHRvX2FtZGdwdV9yaW5nKHAtPmVudGl0eS0+
cnEtPnNjaGVkKTsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0eSAqZW50aXR5
ID0gcC0+ZW50aXR5Owo+PiDCoMKgwqDCoMKgIGVudW0gZHJtX3NjaGVkX3ByaW9yaXR5IHByaW9y
aXR5Owo+PiDCoMKgwqDCoMKgIHN0cnVjdCBhbWRncHVfYm9fbGlzdF9lbnRyeSAqZTsKPj4gQEAg
LTEyNTcsNiArMTI1OCw5IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2NzX3N1Ym1pdChzdHJ1Y3QgCj4+
IGFtZGdwdV9jc19wYXJzZXIgKnAsCj4+IMKgwqDCoMKgwqAgcHJpb3JpdHkgPSBqb2ItPmJhc2Uu
c19wcmlvcml0eTsKPj4gwqDCoMKgwqDCoCBkcm1fc2NoZWRfZW50aXR5X3B1c2hfam9iKCZqb2It
PmJhc2UsIGVudGl0eSk7Cj4+IMKgICvCoMKgwqAgaWYgKHJpbmctPmZ1bmNzLT5ub19ncHVfc2No
ZWRfbG9hZGJhbGFuY2UpCj4+ICvCoMKgwqDCoMKgwqDCoCBhbWRncHVfY3R4X2Rpc2FibGVfZ3B1
X3NjaGVkX2xvYWRfYmFsYW5jZShlbnRpdHkpOwo+Cj4gRG9lcyB0aGlzIG1lYW4gdGhhdCBvbmx5
IHZjbiBJUCBpbnN0YW5jZXMgMCBkZWMvZW5jIHdpbGwgYmUgc2NoZWR1bGVkPwoKTm8sIG5vdCBy
ZWFsbHkuwqAgZHJtX3NjaGVkX2pvYl9pbml0KCkgZ2V0cyBjYWxsZWQgYmVmb3JlIAphbWRncHVf
Y3R4X2Rpc2FibGVfZ3B1X3NjaGVkX2xvYWRfYmFsYW5jZSgpLgoKMXN0IGRybV9zY2hlZF9qb2Jf
aW5pdCgpIGNhbGwgd2lsbCBjaG9vc2UgYSBsZWFzdCBsb2FkZWQgVkNOIGluc3RhbmNlIAphbmQg
dGhhdCBWQ04gaW5zdGFuY2Ugd2lsbCBzdGF5IGZvciB0aGUgd2hvbGUgY29udGV4dCBsaWZlLgoK
ClJlZ2FyZHMsCgpOaXJtb3kKCj4KPiBCZXN0IFJlZ2FyZHMhCj4KPiBKYW1lcwo+Cj4+ICsKPj4g
wqDCoMKgwqDCoCBhbWRncHVfdm1fbW92ZV90b19scnVfdGFpbChwLT5hZGV2LCAmZnByaXYtPnZt
KTsKPj4gwqAgwqDCoMKgwqDCoCB0dG1fZXVfZmVuY2VfYnVmZmVyX29iamVjdHMoJnAtPnRpY2tl
dCwgJnAtPnZhbGlkYXRlZCwgCj4+IHAtPmZlbmNlKTsKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jdHguYyAKPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfY3R4LmMKPj4gaW5kZXggZmE1NzViZGMwM2M4Li4xMTI3ZThmNzc3MjEg
MTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jdHguYwo+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmMKPj4gQEAgLTU1
OSw2ICs1NTksMTkgQEAgdm9pZCBhbWRncHVfY3R4X3ByaW9yaXR5X292ZXJyaWRlKHN0cnVjdCAK
Pj4gYW1kZ3B1X2N0eCAqY3R4LAo+PiDCoMKgwqDCoMKgIH0KPj4gwqAgfQo+PiDCoCArLyoqCj4+
ICsgKiBhbWRncHVfY3R4X2Rpc2FibGVfZ3B1X3NjaGVkX2xvYWRfYmFsYW5jZSAtIGRpc2FibGUg
Z3B1X3NjaGVkJ3MgCj4+IGxvYWQgYmFsYW5jZXIKPj4gKyAqIEBlbnRpdHk6IGVudGl0eSBvbiB3
aGljaCBsb2FkIGJhbGFuY2VyIHdpbGwgYmUgZGlzYWJsZWQKPj4gKyAqLwo+PiArdm9pZCBhbWRn
cHVfY3R4X2Rpc2FibGVfZ3B1X3NjaGVkX2xvYWRfYmFsYW5jZShzdHJ1Y3QgCj4+IGRybV9zY2hl
ZF9lbnRpdHkgKmVudGl0eSkKPj4gK3sKPj4gK8KgwqDCoCBzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVs
ZXIgKipzY2hlZHMgPSAmZW50aXR5LT5ycS0+c2NoZWQ7Cj4+ICsKPj4gK8KgwqDCoCAvKiBkaXNh
YmxlIGdwdV9zY2hlZCdzIGpvYiBsb2FkIGJhbGFuY2VyIGJ5IGFzc2lnbmluZyBvbmx5IG9uZSAq
Lwo+PiArwqDCoMKgIC8qIGRybSBzY2hlZHVsZXIgdG8gdGhlIGVudGl0eSAqLwo+PiArwqDCoMKg
IGRybV9zY2hlZF9lbnRpdHlfbW9kaWZ5X3NjaGVkKGVudGl0eSwgc2NoZWRzLCAxKTsKPj4gK30K
Pj4gKwo+PiDCoCBpbnQgYW1kZ3B1X2N0eF93YWl0X3ByZXZfZmVuY2Uoc3RydWN0IGFtZGdwdV9j
dHggKmN0eCwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1
Y3QgZHJtX3NjaGVkX2VudGl0eSAqZW50aXR5KQo+PiDCoCB7Cj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmggCj4+IGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2N0eC5oCj4+IGluZGV4IGRlNDkwZjE4M2FmMi4uM2EyZjkwMGI4
MDAwIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4
LmgKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2N0eC5oCj4+IEBA
IC05MCw1ICs5MCw2IEBAIHZvaWQgYW1kZ3B1X2N0eF9tZ3JfZmluaShzdHJ1Y3QgYW1kZ3B1X2N0
eF9tZ3IgKm1ncik7Cj4+IMKgIMKgIHZvaWQgYW1kZ3B1X2N0eF9pbml0X3NjaGVkKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KTsKPj4gwqAgK3ZvaWQgYW1kZ3B1X2N0eF9kaXNhYmxlX2dwdV9z
Y2hlZF9sb2FkX2JhbGFuY2Uoc3RydWN0IAo+PiBkcm1fc2NoZWRfZW50aXR5ICplbnRpdHkpOwo+
PiDCoCDCoCAjZW5kaWYKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9qb2IuYyAKPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9i
LmMKPj4gaW5kZXggNDk4MWU0NDNhODg0Li42NGRhZDdiYTc0ZGEgMTAwNjQ0Cj4+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2IuYwo+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmMKPj4gQEAgLTE0MCw2ICsxNDAsNyBAQCB2b2lk
IGFtZGdwdV9qb2JfZnJlZShzdHJ1Y3QgYW1kZ3B1X2pvYiAqam9iKQo+PiDCoCBpbnQgYW1kZ3B1
X2pvYl9zdWJtaXQoc3RydWN0IGFtZGdwdV9qb2IgKmpvYiwgc3RydWN0IAo+PiBkcm1fc2NoZWRf
ZW50aXR5ICplbnRpdHksCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2b2lkICpv
d25lciwgc3RydWN0IGRtYV9mZW5jZSAqKmYpCj4+IMKgIHsKPj4gK8KgwqDCoCBzdHJ1Y3QgYW1k
Z3B1X3JpbmcgKnJpbmcgPSB0b19hbWRncHVfcmluZyhlbnRpdHktPnJxLT5zY2hlZCk7Cj4+IMKg
wqDCoMKgwqAgZW51bSBkcm1fc2NoZWRfcHJpb3JpdHkgcHJpb3JpdHk7Cj4+IMKgwqDCoMKgwqAg
aW50IHI7Cj4+IMKgIEBAIC0xNTQsNiArMTU1LDggQEAgaW50IGFtZGdwdV9qb2Jfc3VibWl0KHN0
cnVjdCBhbWRncHVfam9iICpqb2IsIAo+PiBzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0eSAqZW50aXR5
LAo+PiDCoMKgwqDCoMKgIGFtZGdwdV9qb2JfZnJlZV9yZXNvdXJjZXMoam9iKTsKPj4gwqDCoMKg
wqDCoCBwcmlvcml0eSA9IGpvYi0+YmFzZS5zX3ByaW9yaXR5Owo+PiDCoMKgwqDCoMKgIGRybV9z
Y2hlZF9lbnRpdHlfcHVzaF9qb2IoJmpvYi0+YmFzZSwgZW50aXR5KTsKPj4gK8KgwqDCoCBpZiAo
cmluZy0+ZnVuY3MtPm5vX2dwdV9zY2hlZF9sb2FkYmFsYW5jZSkKPj4gK8KgwqDCoMKgwqDCoMKg
IGFtZGdwdV9jdHhfZGlzYWJsZV9ncHVfc2NoZWRfbG9hZF9iYWxhbmNlKGVudGl0eSk7Cj4+IMKg
IMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+IMKgIH0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yaW5nLmggCj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3JpbmcuaAo+PiBpbmRleCA0NDhjNzZjYmYzZWQuLmY3OGZlMWE2OTEyYiAx
MDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3JpbmcuaAo+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmluZy5oCj4+IEBAIC0x
MTUsNiArMTE1LDcgQEAgc3RydWN0IGFtZGdwdV9yaW5nX2Z1bmNzIHsKPj4gwqDCoMKgwqDCoCB1
MzLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5vcDsKPj4gwqDCoMKgwqDCoCBib29swqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzdXBwb3J0XzY0Yml0X3B0cnM7Cj4+IMKgwqDCoMKgwqAgYm9vbMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgbm9fdXNlcl9mZW5jZTsKPj4gK8KgwqDCoCBib29swqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBub19ncHVfc2NoZWRfbG9hZGJhbGFuY2U7Cj4+IMKgwqDCoMKgwqAgdW5z
aWduZWTCoMKgwqDCoMKgwqDCoCB2bWh1YjsKPj4gwqDCoMKgwqDCoCB1bnNpZ25lZMKgwqDCoMKg
wqDCoMKgIGV4dHJhX2R3Owo+PiDCoCBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvdmNuX3YxXzAuYyAKPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjFf
MC5jCj4+IGluZGV4IDcxZjYxYWZkYzY1NS4uNzQ5Y2NkYjVmYmZiIDEwMDY0NAo+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjFfMC5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L3Zjbl92MV8wLmMKPj4gQEAgLTE4NzEsNiArMTg3MSw3IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X3JpbmdfZnVuY3MgCj4+IHZjbl92MV8wX2RlY19yaW5nX3Zt
X2Z1bmNzID0gewo+PiDCoMKgwqDCoMKgIC5hbGlnbl9tYXNrID0gMHhmLAo+PiDCoMKgwqDCoMKg
IC5zdXBwb3J0XzY0Yml0X3B0cnMgPSBmYWxzZSwKPj4gwqDCoMKgwqDCoCAubm9fdXNlcl9mZW5j
ZSA9IHRydWUsCj4+ICvCoMKgwqAgLm5vX2dwdV9zY2hlZF9sb2FkYmFsYW5jZSA9IHRydWUsCj4+
IMKgwqDCoMKgwqAgLnZtaHViID0gQU1ER1BVX01NSFVCXzAsCj4+IMKgwqDCoMKgwqAgLmdldF9y
cHRyID0gdmNuX3YxXzBfZGVjX3JpbmdfZ2V0X3JwdHIsCj4+IMKgwqDCoMKgwqAgLmdldF93cHRy
ID0gdmNuX3YxXzBfZGVjX3JpbmdfZ2V0X3dwdHIsCj4+IEBAIC0xOTA1LDYgKzE5MDYsNyBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9yaW5nX2Z1bmNzIAo+PiB2Y25fdjFfMF9lbmNfcmlu
Z192bV9mdW5jcyA9IHsKPj4gwqDCoMKgwqDCoCAubm9wID0gVkNOX0VOQ19DTURfTk9fT1AsCj4+
IMKgwqDCoMKgwqAgLnN1cHBvcnRfNjRiaXRfcHRycyA9IGZhbHNlLAo+PiDCoMKgwqDCoMKgIC5u
b191c2VyX2ZlbmNlID0gdHJ1ZSwKPj4gK8KgwqDCoCAubm9fZ3B1X3NjaGVkX2xvYWRiYWxhbmNl
ID0gdHJ1ZSwKPj4gwqDCoMKgwqDCoCAudm1odWIgPSBBTURHUFVfTU1IVUJfMCwKPj4gwqDCoMKg
wqDCoCAuZ2V0X3JwdHIgPSB2Y25fdjFfMF9lbmNfcmluZ19nZXRfcnB0ciwKPj4gwqDCoMKgwqDC
oCAuZ2V0X3dwdHIgPSB2Y25fdjFfMF9lbmNfcmluZ19nZXRfd3B0ciwKPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMgCj4+IGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYwo+PiBpbmRleCBmMjc0NWZkMWRkYjMuLmM0ODQyM2I1
NGJjNSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAu
Ywo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jCj4+IEBAIC0x
OTU0LDYgKzE5NTQsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZF9pcF9mdW5jcyAKPj4gdmNu
X3YyXzBfaXBfZnVuY3MgPSB7Cj4+IMKgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X3Jpbmdf
ZnVuY3MgdmNuX3YyXzBfZGVjX3Jpbmdfdm1fZnVuY3MgPSB7Cj4+IMKgwqDCoMKgwqAgLnR5cGUg
PSBBTURHUFVfUklOR19UWVBFX1ZDTl9ERUMsCj4+IMKgwqDCoMKgwqAgLmFsaWduX21hc2sgPSAw
eGYsCj4+ICvCoMKgwqAgLm5vX2dwdV9zY2hlZF9sb2FkYmFsYW5jZSA9IHRydWUsCj4+IMKgwqDC
oMKgwqAgLnZtaHViID0gQU1ER1BVX01NSFVCXzAsCj4+IMKgwqDCoMKgwqAgLmdldF9ycHRyID0g
dmNuX3YyXzBfZGVjX3JpbmdfZ2V0X3JwdHIsCj4+IMKgwqDCoMKgwqAgLmdldF93cHRyID0gdmNu
X3YyXzBfZGVjX3JpbmdfZ2V0X3dwdHIsCj4+IEBAIC0xOTg0LDYgKzE5ODUsNyBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IGFtZGdwdV9yaW5nX2Z1bmNzIAo+PiB2Y25fdjJfMF9kZWNfcmluZ192bV9m
dW5jcyA9IHsKPj4gwqAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfcmluZ19mdW5jcyB2Y25f
djJfMF9lbmNfcmluZ192bV9mdW5jcyA9IHsKPj4gwqDCoMKgwqDCoCAudHlwZSA9IEFNREdQVV9S
SU5HX1RZUEVfVkNOX0VOQywKPj4gwqDCoMKgwqDCoCAuYWxpZ25fbWFzayA9IDB4M2YsCj4+ICvC
oMKgwqAgLm5vX2dwdV9zY2hlZF9sb2FkYmFsYW5jZSA9IHRydWUsCj4+IMKgwqDCoMKgwqAgLm5v
cCA9IFZDTl9FTkNfQ01EX05PX09QLAo+PiDCoMKgwqDCoMKgIC52bWh1YiA9IEFNREdQVV9NTUhV
Ql8wLAo+PiDCoMKgwqDCoMKgIC5nZXRfcnB0ciA9IHZjbl92Ml8wX2VuY19yaW5nX2dldF9ycHRy
LAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzUuYyAK
Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfNS5jCj4+IGluZGV4IDliMjJl
MmI1NTEzMi4uMWNjOGUxNDIwZmM4IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS92Y25fdjJfNS5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zj
bl92Ml81LmMKPj4gQEAgLTE0NzgsNiArMTQ3OCw3IEBAIHN0YXRpYyB2b2lkIHZjbl92Ml81X2Rl
Y19yaW5nX3NldF93cHRyKHN0cnVjdCAKPj4gYW1kZ3B1X3JpbmcgKnJpbmcpCj4+IMKgIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X3JpbmdfZnVuY3MgdmNuX3YyXzVfZGVjX3Jpbmdfdm1fZnVu
Y3MgPSB7Cj4+IMKgwqDCoMKgwqAgLnR5cGUgPSBBTURHUFVfUklOR19UWVBFX1ZDTl9ERUMsCj4+
IMKgwqDCoMKgwqAgLmFsaWduX21hc2sgPSAweGYsCj4+ICvCoMKgwqAgLm5vX2dwdV9zY2hlZF9s
b2FkYmFsYW5jZSA9IHRydWUsCj4+IMKgwqDCoMKgwqAgLnZtaHViID0gQU1ER1BVX01NSFVCXzEs
Cj4+IMKgwqDCoMKgwqAgLmdldF9ycHRyID0gdmNuX3YyXzVfZGVjX3JpbmdfZ2V0X3JwdHIsCj4+
IMKgwqDCoMKgwqAgLmdldF93cHRyID0gdmNuX3YyXzVfZGVjX3JpbmdfZ2V0X3dwdHIsCj4+IEBA
IC0xNTc3LDYgKzE1NzgsNyBAQCBzdGF0aWMgdm9pZCB2Y25fdjJfNV9lbmNfcmluZ19zZXRfd3B0
cihzdHJ1Y3QgCj4+IGFtZGdwdV9yaW5nICpyaW5nKQo+PiDCoCBzdGF0aWMgY29uc3Qgc3RydWN0
IGFtZGdwdV9yaW5nX2Z1bmNzIHZjbl92Ml81X2VuY19yaW5nX3ZtX2Z1bmNzID0gewo+PiDCoMKg
wqDCoMKgIC50eXBlID0gQU1ER1BVX1JJTkdfVFlQRV9WQ05fRU5DLAo+PiDCoMKgwqDCoMKgIC5h
bGlnbl9tYXNrID0gMHgzZiwKPj4gK8KgwqDCoCAubm9fZ3B1X3NjaGVkX2xvYWRiYWxhbmNlID0g
dHJ1ZSwKPj4gwqDCoMKgwqDCoCAubm9wID0gVkNOX0VOQ19DTURfTk9fT1AsCj4+IMKgwqDCoMKg
wqAgLnZtaHViID0gQU1ER1BVX01NSFVCXzEsCj4+IMKgwqDCoMKgwqAgLmdldF9ycHRyID0gdmNu
X3YyXzVfZW5jX3JpbmdfZ2V0X3JwdHIsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeAo=
