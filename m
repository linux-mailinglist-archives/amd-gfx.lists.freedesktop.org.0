Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78716179FDD
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Mar 2020 07:17:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FC9E6E069;
	Thu,  5 Mar 2020 06:17:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2088.outbound.protection.outlook.com [40.107.236.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F296E069
 for <amd-gfx@lists.freedesktop.org>; Thu,  5 Mar 2020 06:17:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IciJQ2goLIvC1RZfCyTEXwhte8T+ksLD8Q1Fuzx/XpEutmu8ruTLnZVrJVguYh6Z1Fvx+Wx5OXdcLpj4DFPTfP1l7JsAsbS08GHT57hq2+fHmKy0O90FDikfGbg1gbWZUXqG5506g/ypLKOb4DyB/oL5sYagBRJ7piDXhdLCw8vBd4pZVYv80OsQQpvwY8ankoLz68ENnutxKmIv80rvNOjFaLsPB4RjyPYpsJvY1ndMCxo3ZQPxTB4CKPQQ0f9rbkt2EEo8+jCPnB2KvRHl/qZfBXOvGLeeBlCC4GM/zFED9eDYUeb/fzeTgfkwsnSR9WmFLwlHMpnGpwzbU8URJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IH6FqsJt8qV4C/InNNt0+r8kmRygcrxbBQf0WyXYBJw=;
 b=XuYZQDJNHgbTCoImaWo98W8o8AqhbCJ2tO/epu4aqYDlf7vJEnA8gD1deNsbosiJ5vf0GTOOMxa3+hInx9z5cttZhC2267zqklosk9giRvos4pM9ejR5yZqJGfXxZKc+0nTJn4nmliE9G+jdBI1z6p7JNJiv/3byKbH1UzeTRE1NbuWUYnqfTnDkmZIptFt4GYgH9lOQyXB/yuCBd4aKMfdBiEsgZM86hbCFwJbF7g+k0txW3TlIJDVZjc8dBy5zxagJWvlz7LYttiASrfVBQ4FacXmuT0DV0qDJExc70KUNoflAOmDLWCdPxl7Ygttd1mtjslcRDjtBo7Xct4B3uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IH6FqsJt8qV4C/InNNt0+r8kmRygcrxbBQf0WyXYBJw=;
 b=U6nR2ypEPQVwX3cIugGsz3ZfOx6KnFNuwwVpTEUBl4UI07bnp8mTXtRra18DAc3PeN5DVOc0GM2WfBXlCnfyxKt4afKghIFoOrFT0UYVbyZ6BzqwHHUk7bXr0DCUbEPrBKT5yxF3TE58U3FjYMiVHLmwmxkeBjVz29leXDnu2jg=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nirmoy.Das@amd.com; 
Received: from DM5PR12MB2376.namprd12.prod.outlook.com (2603:10b6:4:b9::11) by
 DM5PR12MB1385.namprd12.prod.outlook.com (2603:10b6:3:6e::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.15; Thu, 5 Mar 2020 06:17:53 +0000
Received: from DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::ac12:6413:cd14:4904]) by DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::ac12:6413:cd14:4904%4]) with mapi id 15.20.2772.019; Thu, 5 Mar 2020
 06:17:53 +0000
Subject: Re: [PATCH v6 1/1] drm/amdgpu: set compute queue priority at mqd_init
To: Luben Tuikov <luben.tuikov@amd.com>, Nirmoy Das <nirmoy.aiemd@gmail.com>, 
 amd-gfx@lists.freedesktop.org
References: <20200303125039.53141-1-nirmoy.das@amd.com>
 <2085216f-f82c-3d2e-8f91-b05c2cf76a50@amd.com>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <8a5a1348-79f7-f7a2-c686-df16726def9b@amd.com>
Date: Thu, 5 Mar 2020 07:21:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <2085216f-f82c-3d2e-8f91-b05c2cf76a50@amd.com>
Content-Language: en-US
X-ClientProxiedBy: AM4PR08CA0057.eurprd08.prod.outlook.com
 (2603:10a6:205:2::28) To DM5PR12MB2376.namprd12.prod.outlook.com
 (2603:10b6:4:b9::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2003:c5:8f2e:a500:1f22:cf19:9085:11a1]
 (2003:c5:8f2e:a500:1f22:cf19:9085:11a1) by
 AM4PR08CA0057.eurprd08.prod.outlook.com (2603:10a6:205:2::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.15 via Frontend Transport; Thu, 5 Mar 2020 06:17:51 +0000
X-Originating-IP: [2003:c5:8f2e:a500:1f22:cf19:9085:11a1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d9926b66-373d-424d-ecac-08d7c0ccef95
X-MS-TrafficTypeDiagnostic: DM5PR12MB1385:|DM5PR12MB1385:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1385EAD7447B65B444F31A498BE20@DM5PR12MB1385.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 03333C607F
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(366004)(346002)(376002)(199004)(189003)(6486002)(2616005)(36756003)(478600001)(45080400002)(6666004)(966005)(16526019)(186003)(66556008)(31696002)(66476007)(66946007)(4326008)(8676002)(81156014)(8936002)(53546011)(52116002)(81166006)(31686004)(30864003)(2906002)(110136005)(316002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1385;
 H:DM5PR12MB2376.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T4L5ekAMQCJIgKCIRqK2hOstcDozXZcJsARUIoAHFv7n7JjrjRHEI65xa44AFQI3Av7JlBKQVIAcatyz+400EdSbjz41e8OKG7oE/Vy0NvvDML/R0bLsj3F2L7J+lH/7XH3c9IokjSjLND3EYe8cX4+fwVLr5xaU8nQIbF40AZ9Sr00eijZG3E38GX1I+4VLUtw4wMDNF3qW6DUY296SEGLDf7YK0/tpyqLBBSyr1dVN6TPyob1/Stw/mdBeZHxLa9XVY62igAO4w7tH5xw1kaRhTSomZK602apaBXlA2xmyf7Ol9COklZCemnO3olB25PbyvHoSL0KU1HS3WDGdcv8nHQdCbIwy4ZuGqft4Z5v0muNVhcb9J56ulwgbDVgjcNyG+mRlPw5ySXv06eIo5cj/KuywmjPm+dG/aqPDWyYNyB8QRyQLkJFTRMk/btRQoeinbCsgcHDOJS++j9CJDriNg6Df8VQ951YgpPpRmAy4NRc2gNGu+wQtxIpLpDQ91TzsVjXSaSRfTwyj54HJAg==
X-MS-Exchange-AntiSpam-MessageData: tZeU3e4BDbYqqaWwcBSCJwvW9q+PUAFZTvIez7ObPjl3aFcVVEKJYioLejhThKObArDUoeLTe4qJy7sc2HgwJ9pWdJMW1Kfj8A2vtzCERuOQGebViXUtTUkpwBkR1vtF8q6tX/s1c7BBjxYrjFrnZl39OHgiZ1HF2HyAF+Jm+zGU1GKrylSoKkQ8gDa9Zs+jp3z+7pjwB+Sql89WKaN2cQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9926b66-373d-424d-ecac-08d7c0ccef95
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2020 06:17:52.5323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tc3yABLjjhibx758w80UxXZ/nADp0moGu/iURTn6bSniih3iCEl4c6CR9LFa7HH/Hge89M0lqvatMwU0rR6AYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1385
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
Cc: alexander.deucher@amd.com, Ray.Huang@amd.com, nirmoy.das@amd.com,
 christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Ck9uIDMvNC8yMCAxMDo0MSBQTSwgTHViZW4gVHVpa292IHdyb3RlOgo+IE9uIDIwMjAtMDMtMDMg
Nzo1MCBhLm0uLCBOaXJtb3kgRGFzIHdyb3RlOgo+PiBXZSB3ZXJlIGNoYW5naW5nIGNvbXB1dGUg
cmluZyBwcmlvcml0eSB3aGlsZSByaW5ncyB3ZXJlIGJlaW5nIHVzZWQKPj4gYmVmb3JlIGV2ZXJ5
IGpvYiBzdWJtaXNzaW9uIHdoaWNoIGlzIG5vdCByZWNvbW1lbmRlZC4gVGhpcyBwYXRjaAo+PiBz
ZXRzIGNvbXB1dGUgcXVldWUgcHJpb3JpdHkgYXQgbXFkIGluaXRpYWxpemF0aW9uIGZvciBnZng4
LCBnZng5IGFuZAo+PiBnZngxMC4KPj4KPj4gUG9saWN5OiBtYWtlIHF1ZXVlIDAgb2YgZWFjaCBw
aXBlIGFzIGhpZ2ggcHJpb3JpdHkgY29tcHV0ZSBxdWV1ZQo+Pgo+PiBIaWdoL25vcm1hbCBwcmlv
cml0eSBjb21wdXRlIHNjaGVkIGxpc3RzIGFyZSBnZW5lcmF0ZWQgZnJvbSBzZXQgb2YgaGlnaC9u
b3JtYWwKPj4gcHJpb3JpdHkgY29tcHV0ZSBxdWV1ZXMuIEF0IGNvbnRleHQgY3JlYXRpb24sIGVu
dGl0eSBvZiBjb21wdXRlIHF1ZXVlCj4+IGdldCBhIHNjaGVkIGxpc3QgZnJvbSBoaWdoIG9yIG5v
cm1hbCBwcmlvcml0eSBkZXBlbmRpbmcgb24gY3R4LT5wcmlvcml0eQo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBOaXJtb3kgRGFzIDxuaXJtb3kuZGFzQGFtZC5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jICAgfCAgNCAtLQo+PiAgIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jdHguYyAgfCA2MCArKysrKysrKysrKysrKysrKysrKyst
LS0KPj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmMgIHwgIDggKysr
Kwo+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguaCAgfCAxNSArKysr
Ky0KPj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmMgIHwgIDYgLS0t
Cj4+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3JpbmcuaCB8ICAxICsKPj4g
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYyAgIHwgMTkgKysrKysrKysK
Pj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjhfMC5jICAgIHwgMjMgKysrKysr
Ky0tCj4+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyAgICB8IDIwICsr
KysrKysrCj4+ICAgOSBmaWxlcyBjaGFuZ2VkLCAxMzUgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRp
b25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfY3MuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jCj4+IGluZGV4
IGYzOTdmZjk3YjRlNC4uODMwNGQwYzg3ODk5IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfY3MuYwo+PiBAQCAtMTIwNSw3ICsxMjA1LDYgQEAgc3RhdGljIGludCBhbWRn
cHVfY3Nfc3VibWl0KHN0cnVjdCBhbWRncHVfY3NfcGFyc2VyICpwLAo+PiAgIAlzdHJ1Y3QgYW1k
Z3B1X2Zwcml2ICpmcHJpdiA9IHAtPmZpbHAtPmRyaXZlcl9wcml2Owo+PiAgIAlzdHJ1Y3QgZHJt
X3NjaGVkX2VudGl0eSAqZW50aXR5ID0gcC0+ZW50aXR5Owo+PiAgIAllbnVtIGRybV9zY2hlZF9w
cmlvcml0eSBwcmlvcml0eTsKPj4gLQlzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmc7Cj4+ICAgCXN0
cnVjdCBhbWRncHVfYm9fbGlzdF9lbnRyeSAqZTsKPj4gICAJc3RydWN0IGFtZGdwdV9qb2IgKmpv
YjsKPj4gICAJdWludDY0X3Qgc2VxOwo+PiBAQCAtMTI1OCw5ICsxMjU3LDYgQEAgc3RhdGljIGlu
dCBhbWRncHVfY3Nfc3VibWl0KHN0cnVjdCBhbWRncHVfY3NfcGFyc2VyICpwLAo+PiAgIAlwcmlv
cml0eSA9IGpvYi0+YmFzZS5zX3ByaW9yaXR5Owo+PiAgIAlkcm1fc2NoZWRfZW50aXR5X3B1c2hf
am9iKCZqb2ItPmJhc2UsIGVudGl0eSk7Cj4+Cj4+IC0JcmluZyA9IHRvX2FtZGdwdV9yaW5nKGVu
dGl0eS0+cnEtPnNjaGVkKTsKPj4gLQlhbWRncHVfcmluZ19wcmlvcml0eV9nZXQocmluZywgcHJp
b3JpdHkpOwo+PiAtCj4+ICAgCWFtZGdwdV92bV9tb3ZlX3RvX2xydV90YWlsKHAtPmFkZXYsICZm
cHJpdi0+dm0pOwo+Pgo+PiAgIAl0dG1fZXVfZmVuY2VfYnVmZmVyX29iamVjdHMoJnAtPnRpY2tl
dCwgJnAtPnZhbGlkYXRlZCwgcC0+ZmVuY2UpOwo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2N0eC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2N0eC5jCj4+IGluZGV4IDk0YTZjNDJmMjllYS4uNGFkOTQ0Zjg1NjcyIDEwMDY0NAo+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmMKPj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2N0eC5jCj4+IEBAIC02MSwxMiArNjEs
MzAgQEAgc3RhdGljIGludCBhbWRncHVfY3R4X3ByaW9yaXR5X3Blcm1pdChzdHJ1Y3QgZHJtX2Zp
bGUgKmZpbHAsCj4+ICAgCXJldHVybiAtRUFDQ0VTOwo+PiAgIH0KPj4KPj4gK3N0YXRpYyBlbnVt
IGdmeF9waXBlX3ByaW9yaXR5IGFtZGdwdV9jdHhfc2NoZWRfcHJpb190b19jb21wdXRlX3ByaW8o
ZW51bSBkcm1fc2NoZWRfcHJpb3JpdHkgcHJpbykKPj4gK3sKPj4gKwlzd2l0Y2gocHJpbykgewo+
IExLQ1Mgd2FudHMgYSBzcGFjZSBhZnRlciBhIGtleXdvcmQgKCJzd2l0Y2giKSBhbmQgYmVmb3Jl
IHBhcmVudGhlc2lzICIoIi4KPiBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL3Y0LjEw
L3Byb2Nlc3MvY29kaW5nLXN0eWxlLmh0bWwjcGxhY2luZy1icmFjZXMtYW5kLXNwYWNlcwo+Cj4g
UGxlYXNlIHJlYWQgdGhlIExLQ1MgaW4geW91IGxvY2FsIExpbnV4IHNvdXJjZSBjb2RlOgo+IERv
Y3VtZW50YXRpb24vcHJvY2Vzcy9jb2Rpbmctc3R5bGUucnN0Cj4gc28gd2UgZG9uJ3QgaGF2ZSB0
byBwb2ludCB0aGF0IG91dCBhbnltb3JlLgpZZXMgdGhpcyBpcyBoYXBwZW5pbmcgbW9yZSB0aGFu
IG9mdGVuIHdpdGggbWUuIEkgd2lsbCBiZSBjYXJlZnVsLgo+Cj4+ICsJY2FzZSBEUk1fU0NIRURf
UFJJT1JJVFlfTUlOOgo+PiArCWNhc2UgRFJNX1NDSEVEX1BSSU9SSVRZX05PUk1BTDoKPj4gKwlj
YXNlIERSTV9TQ0hFRF9QUklPUklUWV9ISUdIX1NXOgo+PiArCQlyZXR1cm4gQU1ER1BVX0dGWF9Q
SVBFX1BSSU9fTk9STUFMOwo+IFRoaXMgaXMgdGFrZW4gY2FyZSBvZiBieSB0aGUgImRlZmF1bHQ6
IiBsYWJlbCBhbmQKPiB1bm5lY2Vzc2FyeSBoZXJlIChjYW4gYmUgcmVtb3ZlZCBjb21wbGV0ZWx5
KS4KVGhhbmtzIQo+Cj4+ICsJY2FzZSBEUk1fU0NIRURfUFJJT1JJVFlfSElHSF9IVzoKPj4gKwlj
YXNlIERSTV9TQ0hFRF9QUklPUklUWV9LRVJORUw6Cj4+ICsJCXJldHVybiBBTURHUFVfR0ZYX1BJ
UEVfUFJJT19ISUdIOwo+PiArCWRlZmF1bHQ6Cj4+ICsJCXJldHVybiBBTURHUFVfR0ZYX1BJUEVf
UFJJT19OT1JNQUw7Cj4+ICsJfQo+IFRoaXMgY2FuIGJlIGEgbWFwLiBXZSdyZSBtYXBwaW5nIGZy
b20gb25lIGludGVnZXIKPiBzcGFjZSB0byBhbm90aGVyLiBUaGVyZSBpcyBubyByZWFzb24gZm9y
IGEganVtcCBzd2l0Y2guCj4KPiBGb3IgaW5zdGFuY2UsCj4KPiAvKiBNYXAgb2YgdGhlIERSTSBz
Y2hlZHVsaW5nIHByaW9yaXR5IHRvIHBpcGUKPiAgICogcHJpb3JpdHkuCj4gICAqLwo+IGNvbnN0
IGVudW0gZ2Z4X3BpcGVfcHJpb3JpdHkgczJwX3ByaW9fbWFwW10gPSB7Cj4gCVswXSA9IEFNREdQ
VV9HRlhfUElQRV9QUklPX05PUk1BTCwKPiAJWzFdID0gQU1ER1BVX0dGWF9QSVBFX1BSSU9fTk9S
TUFMLAo+IAlbMl0gPSBBTURHUFVfR0ZYX1BJUEVfUFJJT19OT1JNQUwsCj4gCVszXSA9IEFNREdQ
VV9HRlhfUElQRV9QUklPX05PUk1BTCwKPiAJWzRdID0gQU1ER1BVX0dGWF9QSVBFX1BSSU9fTk9S
TUFMLAo+IAlbNV0gPSBBTURHUFVfR0ZYX1BJUEVfUFJJT19OT1JNQUwsCj4gCVs2XSA9IEFNREdQ
VV9HRlhfUElQRV9QUklPX0hJR0gsCj4gCVs3XSA9IEFNREdQVV9HRlhfUElQRV9QUklPX0hJR0gs
Cj4gCVs4XSA9IEFNREdQVV9HRlhfUElQRV9QUklPX05PUk1BTCwKPiB9Owo+Cj4gLyogTWFwIGl0
IQo+ICAgKi8KPiBwaXBlX3ByaW8gPSBzMnBfcHJpb19tYXBbc2NoZWRfcHJpbyArIDJdOyAgICMj
IFlvdSBjYW4gdmlldyB0aGlzIGFzIHkgPSBmKHggKyAyKS4KCkkgdGhpbmsgdGhhdCB3b3VsZCBi
ZSBvdmVyLWVuZ2luZWVyaW5nIGZvciBub3Qgc28gbXVjaCBvZiBleHRyYSBiZW5lZml0LiAKQSBz
d2l0Y2ggc3RhdGVtZW50IGhlcmUgaXPCoCBtb3JlIGV4cHJlc3NpdmUgYW5kCgpiaXQgbW9yZSBp
bW11bmUgdG8gY2hhbmdlcyB0aGF0IG1pZ2h0IGhhcHBlbiB0byBEUk1fU0NIRURfUFJJT1JJVFlf
Ki4gSSAKd291bGQgcmF0aGVyIGxldCBjb21waWxlciBkb2VzIGl0cwoKam9iLgoKPgo+IE5vdGUg
dGhhdCBpZiB5b3UgZml4IGVudW0gZHJtX3NjaGVkX3ByaW9yaXR5IGFzIEkgZGVzY3JpYmVkCj4g
aW4gYW4gZWFybGllciByZXZpZXcsIHlvdSdkIG5vdCBuZWVkIHRoZSBhZGRpdGl2ZSBmYWN0b3Ig
b2YgMgo+IGluIHRoZSBhYm92ZSBsaW5lYXIgdHJhbnNmb3JtYXRpb24uCgpBIHF1aWNrIHNlYXJj
aCBsZWFkcyBtZSBhbWRncHVfc2NoZWRfaW9jdGwoKSB3aGljaCBpcyB1c2luZyAKRFJNX1NDSEVE
X1BSSU9SSVRZX0lOVkFMSUQKCnRvIGluZGljYXRlIGEgaW52YWxpZCB2YWx1ZSBmcm9tIHVzZXJz
cGFjZS4gSSBkb24ndCBrbm93IG11Y2ggYWJvdXQgZHJtIAphcGkgdG8gc3VnZ2VzdCBhbnkgdXNl
ZnVsCgpjaGFuZ2VzIHJlZ2FyZGluZyB0aGlzLiBCdXQgYWdhaW4gdGhpcyBpc24ndCBpbiB0aGUg
c2NvcGUgb2YgdGhpcyBwYXRjaCAKc2VyaWVzLgoKPgo+PiArCj4+ICsJcmV0dXJuIEFNREdQVV9H
RlhfUElQRV9QUklPX05PUk1BTDsKPiBZb3UgZG9uJ3QgbmVlZCBhIHJldHVybiBoZXJlIGF0IGFs
bCwgd2hlbiB5b3UgaGF2ZSBhICJkZWZhdWx0OiIgbGFiZWwKPiB1cCB0aGVyZS4KSSB3YXMgZG9p
bmcgdG8gdG8gbWFrZSBnY2MgaGFwcHkgYnV0IGl0IHNlZW1zIGdjYyBpcyBoYXBweSBldmVuIHdp
dGhvdXQgCnRoYXQuCj4+ICt9Cj4+ICsKPj4gICBzdGF0aWMgaW50IGFtZGdwdV9jdHhfaW5pdF9l
bnRpdHkoc3RydWN0IGFtZGdwdV9jdHggKmN0eCwgY29uc3QgdTMyIGh3X2lwLCBjb25zdCB1MzIg
cmluZykKPj4gICB7Cj4+ICAgCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gY3R4LT5hZGV2
Owo+PiAgIAlzdHJ1Y3QgYW1kZ3B1X2N0eF9lbnRpdHkgKmVudGl0eTsKPj4gICAJc3RydWN0IGRy
bV9ncHVfc2NoZWR1bGVyICoqc2NoZWRzID0gTlVMTCwgKnNjaGVkID0gTlVMTDsKPj4gICAJdW5z
aWduZWQgbnVtX3NjaGVkcyA9IDA7Cj4+ICsJZW51bSBnZnhfcGlwZV9wcmlvcml0eSBod19wcmlv
Owo+PiAgIAllbnVtIGRybV9zY2hlZF9wcmlvcml0eSBwcmlvcml0eTsKPj4gICAJaW50IHI7Cj4+
Cj4+IEBAIC04NSw4ICsxMDMsOSBAQCBzdGF0aWMgaW50IGFtZGdwdV9jdHhfaW5pdF9lbnRpdHko
c3RydWN0IGFtZGdwdV9jdHggKmN0eCwgY29uc3QgdTMyIGh3X2lwLCBjb25zdAo+PiAgIAkJCW51
bV9zY2hlZHMgPSAxOwo+PiAgIAkJCWJyZWFrOwo+PiAgIAkJY2FzZSBBTURHUFVfSFdfSVBfQ09N
UFVURToKPj4gLQkJCXNjaGVkcyA9IGFkZXYtPmdmeC5jb21wdXRlX3NjaGVkOwo+PiAtCQkJbnVt
X3NjaGVkcyA9IGFkZXYtPmdmeC5udW1fY29tcHV0ZV9zY2hlZDsKPj4gKwkJCWh3X3ByaW8gPSBh
bWRncHVfY3R4X3NjaGVkX3ByaW9fdG9fY29tcHV0ZV9wcmlvKHByaW9yaXR5KTsKPj4gKwkJCXNj
aGVkcyA9IGFkZXYtPmdmeC5jb21wdXRlX3ByaW9fc2NoZWRbaHdfcHJpb107Cj4+ICsJCQludW1f
c2NoZWRzID0gYWRldi0+Z2Z4Lm51bV9jb21wdXRlX3NjaGVkW2h3X3ByaW9dOwo+PiAgIAkJCWJy
ZWFrOwo+PiAgIAkJY2FzZSBBTURHUFVfSFdfSVBfRE1BOgo+PiAgIAkJCXNjaGVkcyA9IGFkZXYt
PnNkbWEuc2RtYV9zY2hlZDsKPj4gQEAgLTYyOCwyMCArNjQ3LDQ3IEBAIHZvaWQgYW1kZ3B1X2N0
eF9tZ3JfZmluaShzdHJ1Y3QgYW1kZ3B1X2N0eF9tZ3IgKm1ncikKPj4gICAJbXV0ZXhfZGVzdHJv
eSgmbWdyLT5sb2NrKTsKPj4gICB9Cj4+Cj4+ICsKPj4gK3N0YXRpYyB2b2lkIGFtZGdwdV9jdHhf
aW5pdF9jb21wdXRlX3NjaGVkKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+PiArewo+PiAr
CWludCBudW1fY29tcHV0ZV9zY2hlZF9ub3JtYWwgPSAwOwo+PiArCWludCBudW1fY29tcHV0ZV9z
Y2hlZF9oaWdoID0gQU1ER1BVX01BWF9DT01QVVRFX1JJTkdTIC0gMTsKPj4gKwlpbnQgaTsKPj4g
Kwo+PiArCS8qIGZpbGwgY29tcHV0ZV9zY2hlZCBhcnJheSBhczogc3RhcnQgZnJvbSAwdGggaW5k
ZXggZm9yIG5vcm1hbCBwcmlvcml0eSBzY2hlZHMgYW5kCj4+ICsJICogc3RhcnQgZnJvbSAobGFz
dF9pbmRleCAtIG51bV9jb21wdXRlX3NjaGVkX25vcm1hbCkgZm9yIGhpZ2ggcHJpb3JpdHkKPj4g
KwkgKiBzY2hlZHMgKi8KPiBTZWUgdGhlIExLQ1MgZ3VpZGUgaGVyZSBvbiBjb21tZW50cy4KPiBo
dHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL3Y0LjEwL3Byb2Nlc3MvY29kaW5nLXN0eWxl
Lmh0bWwjY29tbWVudGluZwo+Cj4gVG8gcXVvdGUgZnJvbSBEb2N1bWVudGF0aW9uL3Byb2Nlc3Mv
Y29kaW5nLXN0eWxlLnJzdDoKPgo+ICAgICJORVZFUgo+ICAgICB0cnkgdG8gZXhwbGFpbiBIT1cg
eW91ciBjb2RlIHdvcmtzIGluIGEgY29tbWVudDogaXQncyBtdWNoIGJldHRlciB0bwo+ICAgICB3
cml0ZSB0aGUgY29kZSBzbyB0aGF0IHRoZSAqKndvcmtpbmcqKiBpcyBvYnZpb3VzLCBhbmQgaXQn
cyBhIHdhc3RlIG9mCj4gICAgIHRpbWUgdG8gZXhwbGFpbiBiYWRseSB3cml0dGVuIGNvZGUuCj4K
PiAgICAgR2VuZXJhbGx5LCB5b3Ugd2FudCB5b3VyIGNvbW1lbnRzIHRvIHRlbGwgV0hBVCB5b3Vy
IGNvZGUgZG9lcywgbm90IEhPVy4iCj4KPiBQbGVhc2UgY29tbWVudCBvbiB3aHkgYW5kIHdoYXQg
eW91J3JlIGRvaW5nIGFzIG9wcG9zZWQgdG8gaG93Lgo+IE9yIGlmIHlvdSBkb24ndCB3YW50IHRv
IGRvIHRoaXMsIHNpbXBseSByZW1vdmUgdGhlIGNvbW1lbnQuCj4KPiBSZW1lbWJlciwgeW91IHdh
bnQgdG8gbWFrZSBpdCBjbGVhciB3aHkgYW5kIHdoYXQgdGhlIGNvZGUgZG9lcyBoZXJlLAo+IGFz
IG9wcG9zZWQgdG8gaG93IGl0J3MgZG9pbmcgaXQuCm5vdGVkLgo+Cj4gVXNlIHRoaXMgc3R5bGUg
b2YgY29tbWVudGluZywgbGlrZSBDaHJpc3RpYW4gZG9lczoKPgo+IHByZXZpb3VzIGNvZGUgZW5k
cyBoZXJlOwo+Cj4gLyogQ29tbWVudCBsaW5lIDEuCj4gICAqIENvbW1lbnQgbGluZSAyLgo+ICAg
Ki8KPiBjb2RlIHN0YXJ0cyBoZXJlLS1ubyBleHRyYSBlbXB0eSBsaW5lcy4uLgo+Cj4+ICsJZm9y
IChpID0gMDsgaSA8IGFkZXYtPmdmeC5udW1fY29tcHV0ZV9yaW5nczsgaSsrKSB7Cj4+ICsJCWlm
ICghYWRldi0+Z2Z4LmNvbXB1dGVfcmluZ1tpXS5oYXNfaGlnaF9wcmlvKQo+PiArCQkJYWRldi0+
Z2Z4LmNvbXB1dGVfc2NoZWRbbnVtX2NvbXB1dGVfc2NoZWRfbm9ybWFsKytdID0KPj4gKwkJCQkm
YWRldi0+Z2Z4LmNvbXB1dGVfcmluZ1tpXS5zY2hlZDsKPj4gKwkJZWxzZQo+PiArCQkJYWRldi0+
Z2Z4LmNvbXB1dGVfc2NoZWRbbnVtX2NvbXB1dGVfc2NoZWRfaGlnaC0tXSA9Cj4+ICsJCQkJJmFk
ZXYtPmdmeC5jb21wdXRlX3JpbmdbaV0uc2NoZWQ7Cj4+ICsJfQo+PiArCj4+ICsJLyogY29tcHV0
ZSByaW5nIG9ubHkgaGFzIHR3byBwcmlvcml0eSBmb3Igbm93ICovCj4+ICsJaSA9IEFNREdQVV9H
RlhfUElQRV9QUklPX05PUk1BTDsKPj4gKwlhZGV2LT5nZnguY29tcHV0ZV9wcmlvX3NjaGVkW2ld
ID0gJmFkZXYtPmdmeC5jb21wdXRlX3NjaGVkWzBdOwo+PiArCWFkZXYtPmdmeC5udW1fY29tcHV0
ZV9zY2hlZFtpXSA9IG51bV9jb21wdXRlX3NjaGVkX25vcm1hbDsKPj4gKwo+PiArCWkgPSBBTURH
UFVfR0ZYX1BJUEVfUFJJT19ISUdIOwo+PiArCWFkZXYtPmdmeC5jb21wdXRlX3ByaW9fc2NoZWRb
aV0gPQo+PiArCQkmYWRldi0+Z2Z4LmNvbXB1dGVfc2NoZWRbbnVtX2NvbXB1dGVfc2NoZWRfaGln
aCAtIDFdOwo+PiArCWFkZXYtPmdmeC5udW1fY29tcHV0ZV9zY2hlZFtpXSA9Cj4+ICsJCWFkZXYt
PmdmeC5udW1fY29tcHV0ZV9yaW5ncyAtIG51bV9jb21wdXRlX3NjaGVkX25vcm1hbDsKPj4gK30K
Pj4gKwo+PiAgIHZvaWQgYW1kZ3B1X2N0eF9pbml0X3NjaGVkKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KQo+PiAgIHsKPj4gICAJaW50IGksIGo7Cj4+Cj4+ICsJYW1kZ3B1X2N0eF9pbml0X2Nv
bXB1dGVfc2NoZWQoYWRldik7Cj4+ICAgCWZvciAoaSA9IDA7IGkgPCBhZGV2LT5nZngubnVtX2dm
eF9yaW5nczsgaSsrKSB7Cj4+ICAgCQlhZGV2LT5nZnguZ2Z4X3NjaGVkW2ldID0gJmFkZXYtPmdm
eC5nZnhfcmluZ1tpXS5zY2hlZDsKPj4gICAJCWFkZXYtPmdmeC5udW1fZ2Z4X3NjaGVkKys7Cj4+
ICAgCX0KPj4KPj4gLQlmb3IgKGkgPSAwOyBpIDwgYWRldi0+Z2Z4Lm51bV9jb21wdXRlX3Jpbmdz
OyBpKyspIHsKPj4gLQkJYWRldi0+Z2Z4LmNvbXB1dGVfc2NoZWRbaV0gPSAmYWRldi0+Z2Z4LmNv
bXB1dGVfcmluZ1tpXS5zY2hlZDsKPj4gLQkJYWRldi0+Z2Z4Lm51bV9jb21wdXRlX3NjaGVkKys7
Cj4+IC0JfQo+PiAtCj4+ICAgCWZvciAoaSA9IDA7IGkgPCBhZGV2LT5zZG1hLm51bV9pbnN0YW5j
ZXM7IGkrKykgewo+PiAgIAkJYWRldi0+c2RtYS5zZG1hX3NjaGVkW2ldID0gJmFkZXYtPnNkbWEu
aW5zdGFuY2VbaV0ucmluZy5zY2hlZDsKPj4gICAJCWFkZXYtPnNkbWEubnVtX3NkbWFfc2NoZWQr
KzsKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZngu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguYwo+PiBpbmRleCA3NDAz
NTg4Njg0YjMuLjk1MjcyNWU3MjQzYyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2dmeC5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9nZnguYwo+PiBAQCAtMTkyLDYgKzE5MiwxNCBAQCBzdGF0aWMgYm9vbCBhbWRncHVf
Z2Z4X2lzX211bHRpcGlwZV9jYXBhYmxlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+PiAg
IAlyZXR1cm4gYWRldi0+Z2Z4Lm1lYy5udW1fbWVjID4gMTsKPj4gICB9Cj4+Cj4+ICtib29sIGFt
ZGdwdV9nZnhfaXNfaGlnaF9wcmlvcml0eV9jb21wdXRlX3F1ZXVlKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LAo+PiArCQkJCQkgICAgICAgaW50IHF1ZXVlKQo+PiArewo+PiArCS8qIFBvbGlj
eTogbWFrZSBxdWV1ZSAwIG9mIGVhY2ggcGlwZSBhcyBoaWdoIHByaW9yaXR5IGNvbXB1dGUgcXVl
dWUgKi8KPj4gKwlyZXR1cm4gKHF1ZXVlID09IDApOwo+PiArCj4+ICt9Cj4+ICsKPj4gICB2b2lk
IGFtZGdwdV9nZnhfY29tcHV0ZV9xdWV1ZV9hY3F1aXJlKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KQo+PiAgIHsKPj4gICAJaW50IGksIHF1ZXVlLCBwaXBlLCBtZWM7Cj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmggYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmgKPj4gaW5kZXggMzdiYTA1YjYzYjJhLi40N2E1Y2Rh
ZTI4YzUgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9n
ZnguaAo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmgKPj4g
QEAgLTQxLDYgKzQxLDE2IEBACj4+ICAgI2RlZmluZSBBTURHUFVfTUFYX0dGWF9RVUVVRVMgS0dE
X01BWF9RVUVVRVMKPj4gICAjZGVmaW5lIEFNREdQVV9NQVhfQ09NUFVURV9RVUVVRVMgS0dEX01B
WF9RVUVVRVMKPj4KPj4gK2VudW0gZ2Z4X3BpcGVfcHJpb3JpdHkgewo+PiArCUFNREdQVV9HRlhf
UElQRV9QUklPX05PUk1BTCA9IDEsCj4+ICsJQU1ER1BVX0dGWF9QSVBFX1BSSU9fSElHSCwKPj4g
KwlBTURHUFVfR0ZYX1BJUEVfUFJJT19NQVgKPiBQbGVhc2UgZG9uJ3QgY2FsbCBpdCAiTUFYIi4g
Ik1heGltdW0gdmFsdWUiIG1lYW5zCj4gdGhhdCB0aGF0IHZhbHVlIGlzIGluIHRoZSBkb21haW4g
b2YgdmFsdWVzCj4gdGhlIHByaW9yeSBjYW4gdGFrZSwgYW5kIGl0IGlzIG5vdC4gVGhhdCBpcywK
PiBwcmlvcml0eSBjb3VsZCBuZXZlciBiZSBBTURHUFVfR0ZYX1BJUEVfUFJJT19NQVguCj4KPiBJ
ZiB5b3Ugd2FudCB0byBrbm93IHRoZSBzaXplIG9mIHRoZSBkb21haW4gb2YgdmFsdWVzLAo+IGp1
c3QgY2FsbCBpdCB0aGF0Ogo+IEFNREdQVV9HRlhfUElQRV9QUklPX05VTS9fU0laRS4KPgo+IGVu
dW0gZ2Z4X3BpcGVfcHJpb3JpdHkgewo+IAlBTURHUFVfR0ZYX1BJUEVfUFJJT19VTkRFRklORUQs
Cj4gCUFNREdQVV9HRlhfUElQRV9QUklPX05PUk1BTCwKPiAJQU1ER1BVX0dGWF9QSVBFX1BSSU9f
SElHSCwKPgo+IAlBTURHUFVfR0ZYX1BJUEVfUFJJT19TSVpFLAo+IH07Cj4KPiBOYXR1cmFsbHkg
MCB3b3VsZCBiZSB1bmRlZmluZWQsIHlldCBuYW1lZC4KPiBOb3RlIHRoZSBlbXB0eSBsaW5lIGJl
Zm9yZSB0aGUgc2l6ZS4KPgo+IFJlZ2FyZHMsCj4gTHViZW4KPgo+PiArCj4+ICt9Owo+PiArCj4+
ICsjZGVmaW5lIEFNREdQVV9HRlhfUVVFVUVfUFJJT1JJVFlfTUlOSU1VTSAgMAo+PiArI2RlZmlu
ZSBBTURHUFVfR0ZYX1FVRVVFX1BSSU9SSVRZX01BWElNVU0gIDE1Cj4+ICsKPj4gICBzdHJ1Y3Qg
YW1kZ3B1X21lYyB7Cj4+ICAgCXN0cnVjdCBhbWRncHVfYm8JKmhwZF9lb3Bfb2JqOwo+PiAgIAl1
NjQJCQlocGRfZW9wX2dwdV9hZGRyOwo+PiBAQCAtMjgwLDggKzI5MCw5IEBAIHN0cnVjdCBhbWRn
cHVfZ2Z4IHsKPj4gICAJdWludDMyX3QJCQludW1fZ2Z4X3NjaGVkOwo+PiAgIAl1bnNpZ25lZAkJ
CW51bV9nZnhfcmluZ3M7Cj4+ICAgCXN0cnVjdCBhbWRncHVfcmluZwkJY29tcHV0ZV9yaW5nW0FN
REdQVV9NQVhfQ09NUFVURV9SSU5HU107Cj4+ICsJc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICAg
ICAgICAqKmNvbXB1dGVfcHJpb19zY2hlZFtBTURHUFVfR0ZYX1BJUEVfUFJJT19NQVhdOwo+PiAg
IAlzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIJKmNvbXB1dGVfc2NoZWRbQU1ER1BVX01BWF9DT01Q
VVRFX1JJTkdTXTsKPj4gLQl1aW50MzJfdAkJCW51bV9jb21wdXRlX3NjaGVkOwo+PiArCXVpbnQz
Ml90ICAgICAgICAgICAgICAgICAgICAgICAgbnVtX2NvbXB1dGVfc2NoZWRbQU1ER1BVX0dGWF9Q
SVBFX1BSSU9fTUFYXTsKPj4gICAJdW5zaWduZWQJCQludW1fY29tcHV0ZV9yaW5nczsKPj4gICAJ
c3RydWN0IGFtZGdwdV9pcnFfc3JjCQllb3BfaXJxOwo+PiAgIAlzdHJ1Y3QgYW1kZ3B1X2lycV9z
cmMJCXByaXZfcmVnX2lycTsKPj4gQEAgLTM2Myw2ICszNzQsOCBAQCB2b2lkIGFtZGdwdV9nZnhf
Yml0X3RvX21lY19xdWV1ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgaW50IGJpdCwKPj4g
ICAJCQkJIGludCAqbWVjLCBpbnQgKnBpcGUsIGludCAqcXVldWUpOwo+PiAgIGJvb2wgYW1kZ3B1
X2dmeF9pc19tZWNfcXVldWVfZW5hYmxlZChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgaW50
IG1lYywKPj4gICAJCQkJICAgICBpbnQgcGlwZSwgaW50IHF1ZXVlKTsKPj4gK2Jvb2wgYW1kZ3B1
X2dmeF9pc19oaWdoX3ByaW9yaXR5X2NvbXB1dGVfcXVldWUoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsCj4+ICsJCQkJCSAgICAgICBpbnQgcXVldWUpOwo+PiAgIGludCBhbWRncHVfZ2Z4X21l
X3F1ZXVlX3RvX2JpdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgaW50IG1lLAo+PiAgIAkJ
CSAgICAgICBpbnQgcGlwZSwgaW50IHF1ZXVlKTsKPj4gICB2b2lkIGFtZGdwdV9nZnhfYml0X3Rv
X21lX3F1ZXVlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBpbnQgYml0LAo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5jCj4+IGluZGV4IGQ0MmJlODgwYTIzNi4uNDk4
MWU0NDNhODg0IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfam9iLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5j
Cj4+IEBAIC0xMTcsMTIgKzExNywxMCBAQCB2b2lkIGFtZGdwdV9qb2JfZnJlZV9yZXNvdXJjZXMo
c3RydWN0IGFtZGdwdV9qb2IgKmpvYikKPj4KPj4gICBzdGF0aWMgdm9pZCBhbWRncHVfam9iX2Zy
ZWVfY2Ioc3RydWN0IGRybV9zY2hlZF9qb2IgKnNfam9iKQo+PiAgIHsKPj4gLQlzdHJ1Y3QgYW1k
Z3B1X3JpbmcgKnJpbmcgPSB0b19hbWRncHVfcmluZyhzX2pvYi0+c2NoZWQpOwo+PiAgIAlzdHJ1
Y3QgYW1kZ3B1X2pvYiAqam9iID0gdG9fYW1kZ3B1X2pvYihzX2pvYik7Cj4+Cj4+ICAgCWRybV9z
Y2hlZF9qb2JfY2xlYW51cChzX2pvYik7Cj4+Cj4+IC0JYW1kZ3B1X3JpbmdfcHJpb3JpdHlfcHV0
KHJpbmcsIHNfam9iLT5zX3ByaW9yaXR5KTsKPj4gICAJZG1hX2ZlbmNlX3B1dChqb2ItPmZlbmNl
KTsKPj4gICAJYW1kZ3B1X3N5bmNfZnJlZSgmam9iLT5zeW5jKTsKPj4gICAJYW1kZ3B1X3N5bmNf
ZnJlZSgmam9iLT5zY2hlZF9zeW5jKTsKPj4gQEAgLTE0Myw3ICsxNDEsNiBAQCBpbnQgYW1kZ3B1
X2pvYl9zdWJtaXQoc3RydWN0IGFtZGdwdV9qb2IgKmpvYiwgc3RydWN0IGRybV9zY2hlZF9lbnRp
dHkgKmVudGl0eSwKPj4gICAJCSAgICAgIHZvaWQgKm93bmVyLCBzdHJ1Y3QgZG1hX2ZlbmNlICoq
ZikKPj4gICB7Cj4+ICAgCWVudW0gZHJtX3NjaGVkX3ByaW9yaXR5IHByaW9yaXR5Owo+PiAtCXN0
cnVjdCBhbWRncHVfcmluZyAqcmluZzsKPj4gICAJaW50IHI7Cj4+Cj4+ICAgCWlmICghZikKPj4g
QEAgLTE1OCw5ICsxNTUsNiBAQCBpbnQgYW1kZ3B1X2pvYl9zdWJtaXQoc3RydWN0IGFtZGdwdV9q
b2IgKmpvYiwgc3RydWN0IGRybV9zY2hlZF9lbnRpdHkgKmVudGl0eSwKPj4gICAJcHJpb3JpdHkg
PSBqb2ItPmJhc2Uuc19wcmlvcml0eTsKPj4gICAJZHJtX3NjaGVkX2VudGl0eV9wdXNoX2pvYigm
am9iLT5iYXNlLCBlbnRpdHkpOwo+Pgo+PiAtCXJpbmcgPSB0b19hbWRncHVfcmluZyhlbnRpdHkt
PnJxLT5zY2hlZCk7Cj4+IC0JYW1kZ3B1X3JpbmdfcHJpb3JpdHlfZ2V0KHJpbmcsIHByaW9yaXR5
KTsKPj4gLQo+PiAgIAlyZXR1cm4gMDsKPj4gICB9Cj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmluZy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3JpbmcuaAo+PiBpbmRleCAyNGNhZmYwODVkMDAuLmRjZWExZWY5Mjg4MyAx
MDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3JpbmcuaAo+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmluZy5oCj4+IEBAIC0y
MjIsNiArMjIyLDcgQEAgc3RydWN0IGFtZGdwdV9yaW5nIHsKPj4gICAJc3RydWN0IG11dGV4CQlw
cmlvcml0eV9tdXRleDsKPj4gICAJLyogcHJvdGVjdGVkIGJ5IHByaW9yaXR5X211dGV4ICovCj4+
ICAgCWludAkJCXByaW9yaXR5Owo+PiArCWJvb2wJCQloYXNfaGlnaF9wcmlvOwo+Pgo+PiAgICNp
ZiBkZWZpbmVkKENPTkZJR19ERUJVR19GUykKPj4gICAJc3RydWN0IGRlbnRyeSAqZW50Owo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYwo+PiBpbmRleCA5NmNmNjE3ZTQxZDEu
LmMxZGE0MWUzNTMyMyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z2Z4X3YxMF8wLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8w
LmMKPj4gQEAgLTMyMTEsNiArMzIxMSwyMiBAQCBzdGF0aWMgaW50IGdmeF92MTBfMF9jcF9hc3lu
Y19nZnhfcmluZ19yZXN1bWUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4+ICAgCXJldHVy
biByOwo+PiAgIH0KPj4KPj4gK3N0YXRpYyB2b2lkIGdmeF92MTBfMF9jb21wdXRlX21xZF9zZXRf
cHJpb3JpdHkoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCBzdHJ1Y3QgdjEwX2NvbXB1dGVfbXFk
ICptcWQpCj4+ICt7Cj4+ICsJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSByaW5nLT5hZGV2
Owo+PiArCj4+ICsJaWYgKHJpbmctPmZ1bmNzLT50eXBlID09IEFNREdQVV9SSU5HX1RZUEVfQ09N
UFVURSkgewo+PiArCQlpZiAoYW1kZ3B1X2dmeF9pc19oaWdoX3ByaW9yaXR5X2NvbXB1dGVfcXVl
dWUoYWRldiwgcmluZy0+cXVldWUpKSB7Cj4+ICsJCQltcWQtPmNwX2hxZF9waXBlX3ByaW9yaXR5
ID0gQU1ER1BVX0dGWF9QSVBFX1BSSU9fSElHSDsKPj4gKwkJCXJpbmctPmhhc19oaWdoX3ByaW8g
PSB0cnVlOwo+PiArCQkJbXFkLT5jcF9ocWRfcXVldWVfcHJpb3JpdHkgPQo+PiArCQkJCUFNREdQ
VV9HRlhfUVVFVUVfUFJJT1JJVFlfTUFYSU1VTTsKPj4gKwkJfSBlbHNlIHsKPj4gKwkJCXJpbmct
Pmhhc19oaWdoX3ByaW8gPSBmYWxzZTsKPj4gKwkJfQo+PiArCX0KPj4gK30KPj4gKwo+PiAgIHN0
YXRpYyBpbnQgZ2Z4X3YxMF8wX2NvbXB1dGVfbXFkX2luaXQoc3RydWN0IGFtZGdwdV9yaW5nICpy
aW5nKQo+PiAgIHsKPj4gICAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSByaW5nLT5hZGV2
Owo+PiBAQCAtMzMzNiw2ICszMzUyLDkgQEAgc3RhdGljIGludCBnZnhfdjEwXzBfY29tcHV0ZV9t
cWRfaW5pdChzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpCj4+ICAgCXRtcCA9IFJFR19TRVRfRklF
TEQodG1wLCBDUF9IUURfSUJfQ09OVFJPTCwgTUlOX0lCX0FWQUlMX1NJWkUsIDMpOwo+PiAgIAlt
cWQtPmNwX2hxZF9pYl9jb250cm9sID0gdG1wOwo+Pgo+PiArCS8qIHNldCBzdGF0aWMgcHJpb3Jp
dHkgZm9yIGEgY29tcHV0ZSBxdWV1ZS9yaW5nICovCj4+ICsJZ2Z4X3YxMF8wX2NvbXB1dGVfbXFk
X3NldF9wcmlvcml0eShyaW5nLCBtcWQpOwo+PiArCj4+ICAgCS8qIG1hcF9xdWV1ZXMgcGFja2V0
IGRvZXNuJ3QgbmVlZCBhY3RpdmF0ZSB0aGUgcXVldWUsCj4+ICAgCSAqIHNvIG9ubHkga2lxIG5l
ZWQgc2V0IHRoaXMgZmllbGQuCj4+ICAgCSAqLwo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ2Z4X3Y4XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dm
eF92OF8wLmMKPj4gaW5kZXggMzkzYTEzMjRkYWE5Li42NjhjOGViMmIyY2MgMTAwNjQ0Cj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OF8wLmMKPj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y4XzAuYwo+PiBAQCAtNDQzMCw2ICs0NDMwLDIyIEBA
IHN0YXRpYyBpbnQgZ2Z4X3Y4XzBfZGVhY3RpdmF0ZV9ocWQoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsIHUzMiByZXEpCj4+ICAgCXJldHVybiByOwo+PiAgIH0KPj4KPj4gK3N0YXRpYyB2b2lk
IGdmeF92OF8wX21xZF9zZXRfcHJpb3JpdHkoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCBzdHJ1
Y3QgdmlfbXFkICptcWQpCj4+ICt7Cj4+ICsJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBy
aW5nLT5hZGV2Owo+PiArCj4+ICsJaWYgKHJpbmctPmZ1bmNzLT50eXBlID09IEFNREdQVV9SSU5H
X1RZUEVfQ09NUFVURSkgewo+PiArCQlpZiAoYW1kZ3B1X2dmeF9pc19oaWdoX3ByaW9yaXR5X2Nv
bXB1dGVfcXVldWUoYWRldiwgcmluZy0+cXVldWUpKSB7Cj4+ICsJCQltcWQtPmNwX2hxZF9waXBl
X3ByaW9yaXR5ID0gQU1ER1BVX0dGWF9QSVBFX1BSSU9fSElHSDsKPj4gKwkJCXJpbmctPmhhc19o
aWdoX3ByaW8gPSB0cnVlOwo+PiArCQkJbXFkLT5jcF9ocWRfcXVldWVfcHJpb3JpdHkgPQo+PiAr
CQkJCUFNREdQVV9HRlhfUVVFVUVfUFJJT1JJVFlfTUFYSU1VTTsKPj4gKwkJfSBlbHNlIHsKPj4g
KwkJCXJpbmctPmhhc19oaWdoX3ByaW8gPSBmYWxzZTsKPj4gKwkJfQo+PiArCX0KPj4gK30KPj4g
Kwo+PiAgIHN0YXRpYyBpbnQgZ2Z4X3Y4XzBfbXFkX2luaXQoc3RydWN0IGFtZGdwdV9yaW5nICpy
aW5nKQo+PiAgIHsKPj4gICAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSByaW5nLT5hZGV2
Owo+PiBAQCAtNDU1Myw5ICs0NTY5LDYgQEAgc3RhdGljIGludCBnZnhfdjhfMF9tcWRfaW5pdChz
dHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpCj4+ICAgCS8qIGRlZmF1bHRzICovCj4+ICAgCW1xZC0+
Y3BfaHFkX2VvcF9ycHRyID0gUlJFRzMyKG1tQ1BfSFFEX0VPUF9SUFRSKTsKPj4gICAJbXFkLT5j
cF9ocWRfZW9wX3dwdHIgPSBSUkVHMzIobW1DUF9IUURfRU9QX1dQVFIpOwo+PiAtCW1xZC0+Y3Bf
aHFkX3BpcGVfcHJpb3JpdHkgPSBSUkVHMzIobW1DUF9IUURfUElQRV9QUklPUklUWSk7Cj4+IC0J
bXFkLT5jcF9ocWRfcXVldWVfcHJpb3JpdHkgPSBSUkVHMzIobW1DUF9IUURfUVVFVUVfUFJJT1JJ
VFkpOwo+PiAtCW1xZC0+Y3BfaHFkX3F1YW50dW0gPSBSUkVHMzIobW1DUF9IUURfUVVBTlRVTSk7
Cj4+ICAgCW1xZC0+Y3BfaHFkX2N0eF9zYXZlX2Jhc2VfYWRkcl9sbyA9IFJSRUczMihtbUNQX0hR
RF9DVFhfU0FWRV9CQVNFX0FERFJfTE8pOwo+PiAgIAltcWQtPmNwX2hxZF9jdHhfc2F2ZV9iYXNl
X2FkZHJfaGkgPSBSUkVHMzIobW1DUF9IUURfQ1RYX1NBVkVfQkFTRV9BRERSX0hJKTsKPj4gICAJ
bXFkLT5jcF9ocWRfY250bF9zdGFja19vZmZzZXQgPSBSUkVHMzIobW1DUF9IUURfQ05UTF9TVEFD
S19PRkZTRVQpOwo+PiBAQCAtNDU2Nyw2ICs0NTgwLDEwIEBAIHN0YXRpYyBpbnQgZ2Z4X3Y4XzBf
bXFkX2luaXQoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKQo+PiAgIAltcWQtPmNwX2hxZF9lb3Bf
d3B0cl9tZW0gPSBSUkVHMzIobW1DUF9IUURfRU9QX1dQVFJfTUVNKTsKPj4gICAJbXFkLT5jcF9o
cWRfZW9wX2RvbmVzID0gUlJFRzMyKG1tQ1BfSFFEX0VPUF9ET05FUyk7Cj4+Cj4+ICsJLyogc2V0
IHN0YXRpYyBwcmlvcml0eSBmb3IgYSBxdWV1ZS9yaW5nICovCj4+ICsJZ2Z4X3Y4XzBfbXFkX3Nl
dF9wcmlvcml0eShyaW5nLCBtcWQpOwo+PiArCW1xZC0+Y3BfaHFkX3F1YW50dW0gPSBSUkVHMzIo
bW1DUF9IUURfUVVBTlRVTSk7Cj4+ICsKPj4gICAJLyogbWFwX3F1ZXVlcyBwYWNrZXQgZG9lc24n
dCBuZWVkIGFjdGl2YXRlIHRoZSBxdWV1ZSwKPj4gICAJICogc28gb25seSBraXEgbmVlZCBzZXQg
dGhpcyBmaWVsZC4KPj4gICAJICovCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nZnhfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAu
Ywo+PiBpbmRleCAwMTU2NDc5NTlkNjkuLjcyNmQxYWM0MTYzNyAxMDA2NDQKPj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCj4+IEBAIC0zMzE0LDYgKzMzMTQsMjIgQEAgc3RhdGlj
IHZvaWQgZ2Z4X3Y5XzBfa2lxX3NldHRpbmcoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKQo+PiAg
IAlXUkVHMzJfU09DMTVfUkxDKEdDLCAwLCBtbVJMQ19DUF9TQ0hFRFVMRVJTLCB0bXApOwo+PiAg
IH0KPj4KPj4gK3N0YXRpYyB2b2lkIGdmeF92OV8wX21xZF9zZXRfcHJpb3JpdHkoc3RydWN0IGFt
ZGdwdV9yaW5nICpyaW5nLCBzdHJ1Y3QgdjlfbXFkICptcWQpCj4+ICt7Cj4+ICsJc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYgPSByaW5nLT5hZGV2Owo+PiArCj4+ICsJaWYgKHJpbmctPmZ1bmNz
LT50eXBlID09IEFNREdQVV9SSU5HX1RZUEVfQ09NUFVURSkgewo+PiArCQlpZiAoYW1kZ3B1X2dm
eF9pc19oaWdoX3ByaW9yaXR5X2NvbXB1dGVfcXVldWUoYWRldiwgcmluZy0+cXVldWUpKSB7Cj4+
ICsJCQltcWQtPmNwX2hxZF9waXBlX3ByaW9yaXR5ID0gQU1ER1BVX0dGWF9QSVBFX1BSSU9fSElH
SDsKPj4gKwkJCXJpbmctPmhhc19oaWdoX3ByaW8gPSB0cnVlOwo+PiArCQkJbXFkLT5jcF9ocWRf
cXVldWVfcHJpb3JpdHkgPQo+PiArCQkJCUFNREdQVV9HRlhfUVVFVUVfUFJJT1JJVFlfTUFYSU1V
TTsKPj4gKwkJfSBlbHNlIHsKPj4gKwkJCXJpbmctPmhhc19oaWdoX3ByaW8gPSBmYWxzZTsKPj4g
KwkJfQo+PiArCX0KPj4gK30KPj4gKwo+PiAgIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfbXFkX2luaXQo
c3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKQo+PiAgIHsKPj4gICAJc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYgPSByaW5nLT5hZGV2Owo+PiBAQCAtMzQ1MCw2ICszNDY2LDEwIEBAIHN0YXRpYyBp
bnQgZ2Z4X3Y5XzBfbXFkX2luaXQoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKQo+PiAgIAl0bXAg
PSBSRUdfU0VUX0ZJRUxEKHRtcCwgQ1BfSFFEX0lCX0NPTlRST0wsIE1JTl9JQl9BVkFJTF9TSVpF
LCAzKTsKPj4gICAJbXFkLT5jcF9ocWRfaWJfY29udHJvbCA9IHRtcDsKPj4KPj4gKwkvKiBzZXQg
c3RhdGljIHByaW9yaXR5IGZvciBhIHF1ZXVlL3JpbmcgKi8KPj4gKwlnZnhfdjlfMF9tcWRfc2V0
X3ByaW9yaXR5KHJpbmcsIG1xZCk7Cj4+ICsJbXFkLT5jcF9ocWRfcXVhbnR1bSA9IFJSRUczMiht
bUNQX0hRRF9RVUFOVFVNKTsKPj4gKwo+PiAgIAkvKiBtYXBfcXVldWVzIHBhY2tldCBkb2Vzbid0
IG5lZWQgYWN0aXZhdGUgdGhlIHF1ZXVlLAo+PiAgIAkgKiBzbyBvbmx5IGtpcSBuZWVkIHNldCB0
aGlzIGZpZWxkLgo+PiAgIAkgKi8KPj4gLS0KPj4gMi4yNS4wCj4+Cj4+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGFtZC1nZnggbWFpbGluZyBsaXN0
Cj4+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxp
bmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmxpc3RzLmZyZWVk
ZXNrdG9wLm9yZyUyRm1haWxtYW4lMkZsaXN0aW5mbyUyRmFtZC1nZngmYW1wO2RhdGE9MDIlN0Mw
MSU3Q2x1YmVuLnR1aWtvdiU0MGFtZC5jb20lN0NmYTcwZmZhMmQ5ODc0YmJlMWE1OTA4ZDdiZjcx
MDc3ZSU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2MzcxODgz
NjQ1MDI0MTk1MTUmYW1wO3NkYXRhPXZJTTJjbEZQUENmSURLMjRVeEFpSkRaNUpIJTJGODNLMkpF
U1p0WktUR1FVYyUzRCZhbXA7cmVzZXJ2ZWQ9MAo+PgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZngK
