Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EEF14F2A3
	for <lists+amd-gfx@lfdr.de>; Fri, 31 Jan 2020 20:22:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E786E9ED;
	Fri, 31 Jan 2020 19:22:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690068.outbound.protection.outlook.com [40.107.69.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DABB6E9ED
 for <amd-gfx@lists.freedesktop.org>; Fri, 31 Jan 2020 19:22:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bg9WURjzD+A6EIscfmWzyMMYDV2Hyv/9cUd+e0ZqDEEvfAXZXLVzIoNmIfYYHSlSTPAc16lj568QFMpgxOsQUkBds3i0H7N3hrYcWskj3mHFCwbiyp4h9bIu5rhd4De60cQnWuX+WL8sCaMWIrSJ0fBB7NUSdvwgVrbZNf9nKcujLx2in6nBBBNPpTpKRRoYdFMVXmCVCtSs285wGIzN1YOJ4/kUVs6CTSGG/LJrTFdcuV7yod9RtAutzjOyBQPawnasXRlGp2DhYvwwBlaHuJlqUmZ+EDb9daIpgeP2IfpsP8BxZFvRKz7JfcvSesFyyPVPN504P9SCJkuTJH63VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yk67Po/0KHcY8bT/trJhItcbip600ohoB5rDuStoNvI=;
 b=QTeOtKdIY2ahJiGqOg1ZTQj+NjtE4lVKkr27uHD+ZZu7yUcXQLYPwpgXLWwGCd4THgd9IQNNSxgOwu9WIiDLmc23tUiFvReTWgDXMR+JrQc1AyJRSjdxK+RM5CG9EAE9KD4H+IWtnHj3WXQZ8tIkXsOjI8l6jqEVGBz8zZ2HIsBzc4oXbToxeqwJD0pSaOY8vLhiNg0lsvxGtseg2vGyGjkx0A5T+86PHfG0cOvL/FofUTmNpwouX//DmWQ3d4LjFExVxjDik/EEU4+XJUYFhm3ssWuW4m8WRmlHaYCKZRxzX1tF0TlEUX3zeI1VMPh35mAUwhDCXPWFDc2ueXrCVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yk67Po/0KHcY8bT/trJhItcbip600ohoB5rDuStoNvI=;
 b=SZgeigpkVUynPf0T+eydf5HtqmdS8L7mOGWM4nj5YIfodidk7akV0a59iHPhAnOB8YRmqBbhsxQ70iUBSq4gFCUi1jGsd+QZbCtvpE7O6C/u6sMq0n4Y8L3aXhy/s3W3Z4ZLMyjhdaRrTX5NuftrgpWvmZy0sCBcGiYKbebkMIg=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
Received: from DM5PR1201MB0090.namprd12.prod.outlook.com (10.174.105.140) by
 DM5PR1201MB2507.namprd12.prod.outlook.com (10.172.90.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.22; Fri, 31 Jan 2020 19:22:23 +0000
Received: from DM5PR1201MB0090.namprd12.prod.outlook.com
 ([fe80::6c24:8172:ed3c:5a8a]) by DM5PR1201MB0090.namprd12.prod.outlook.com
 ([fe80::6c24:8172:ed3c:5a8a%6]) with mapi id 15.20.2686.028; Fri, 31 Jan 2020
 19:22:23 +0000
Subject: Re: [PATCH v2] drm/amdkfd: Add queue information to sysfs
To: "Lin, Amber" <Amber.Lin@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <1580478344-14836-1-git-send-email-Amber.Lin@amd.com>
 <49f351cc-4b6f-683c-d225-98006ef687e5@amd.com>
 <DM6PR12MB305035669ABE4A95CC907443E1070@DM6PR12MB3050.namprd12.prod.outlook.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
Message-ID: <96f54d25-528a-02a6-184c-d2cef28d3354@amd.com>
Date: Fri, 31 Jan 2020 14:22:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <DM6PR12MB305035669ABE4A95CC907443E1070@DM6PR12MB3050.namprd12.prod.outlook.com>
Content-Language: en-US
X-ClientProxiedBy: YTBPR01CA0005.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::18) To DM5PR1201MB0090.namprd12.prod.outlook.com
 (2603:10b6:4:53::12)
MIME-Version: 1.0
Received: from [172.27.226.80] (165.204.55.251) by
 YTBPR01CA0005.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.28 via Frontend Transport; Fri, 31 Jan 2020 19:22:22 +0000
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 12834812-a859-45e4-1e2a-08d7a682e5dd
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2507:|DM5PR1201MB2507:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB25077767264A1410DDBF82E392070@DM5PR1201MB2507.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-Forefront-PRVS: 029976C540
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(346002)(39860400002)(396003)(376002)(189003)(199004)(5660300002)(26005)(53546011)(66556008)(66476007)(316002)(52116002)(16576012)(110136005)(31696002)(16526019)(6486002)(186003)(66946007)(8936002)(2906002)(86362001)(36756003)(478600001)(81166006)(81156014)(36916002)(956004)(31686004)(8676002)(44832011)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB2507;
 H:DM5PR1201MB0090.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XbgWuyO548CHP919yP4ZqLgyd+4Z/79RAGo55R5Muatwo4jfUlSsAS2ld4EVV8dz3yrNxUzyNVrowjdTXBqgt970udXggNBCMatc5akj3WFV+xYmu6IgM+O1gb3/FzWaGQxf1wiXGhTZVf8E8qTPfrq1EHeY7CLqcFxlslAEXV8rFWcjnI+TJ16MqjXsfFlNRfGceeyo1t/IfBnZjNYvFh5l0e16vTylI9BVbBgpdM5uuD+gVQdeOQIZLHu9XMzFoD9HaxAXCtj2aaJMDjSjzlZ3Ze1PvIVfsp16g4fmy/AhRtHVMVx12BFrH3z8VLxooHrSpKhEINcbyrhIzjrCSHRpQBwPeCyBC1f+m1MvUJAeHcQ8/oa4AJGeA88Pe30GmjoZqLk2PqvAdcIbYKSsWR03+RgcZV4KffCnRmLQeCsVslhKK14vsYtNsyQQuPKR
X-MS-Exchange-AntiSpam-MessageData: t8aLE2ncxwHvcARzLktB6lMDuyq6PZeKmlwOiQZcz09T7IDHxjLgWGoK1zmdvJUhe4gPs6F1IfSw2xDbpnATDfHV+rjFGzKYiZX7HJb6fMBx6QzgM/6VmIMHZGIGQDzFRpf57vnaylYUIZtrUrygmA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12834812-a859-45e4-1e2a-08d7a682e5dd
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2020 19:22:23.0956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B0LLmtO8yNh276DEhsejDUAdNunLFzb3dSO9P/zwLvoGEmWMkCXKh2s3KwRbZehuKC4VEQrpiF8hiCagVAssdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2507
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Ck9uIDIwMjAtMDEtMzEgMTo0NyBwLm0uLCBMaW4sIEFtYmVyIHdyb3RlOgo+IFtBTUQgT2ZmaWNp
YWwgVXNlIE9ubHkgLSBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0KPgo+IEl0IGRvZXNuJ3Qg
YXBwbHkgdG8gdGhpcyBvbmUgYmVjYXVzZQo+IDEuIEl0IG9ubHkgaGFzIG9uZSBzZXQgb2YgYXR0
cmlidXRlIChkbWEzMiBvciBoaWdobWVtKSB1c2luZyB0aGUga29ial90eXBlLCBzbyBpdCBjYW4g
c2V0IHRoZSBkZWZhdWx0X2F0dHJzLiBJbiBteSBjYXNlLCBJIGhhdmUgbXVsdGlwbGUgcXVldWVz
L1FJRHMgdGhhdCBzaGFyZSB0aGUgc2FtZSBrb2JqX3R5cGUgd2hpbGUgZWFjaCBvZiB0aGVtIGhh
cyB0aGVpciBvd24gYXR0cnMgbG9jYXRlZCBpbiAic3RydWN0IHF1ZXVlIi4gSSBjYW4ndCBhc3Np
Z24gZGVmYXVsdF9hdHRycyB0byBhIHNwZWNpZmljIG9uZSBsaWtlIHR0bV9tZW1vcnkuYyBkb2Vz
IGluIHRoZSBnbG9iYWwgc2VjdGlvbi4KClRoYXQncyBiZWNhdXNlIHlvdSB1c2UgY29udGFpbmVy
X29mIHRvIGZpbmQgdGhlIHF1ZXVlIHRoYXQgdGhlIAphdHRyaWJ1dGVzIGJlbG9uZyB0by4gSW5z
dGVhZCB5b3UgY291bGQgdXNlIGNvbnRhaW5lcl9vZiB0byBmaW5kIHRoZSAKcXVldWUgdGhhdCB0
aGUga29iaiBiZWxvbmdzIHRvLiBTbyBpbnN0ZWFkIG9mIGR5bmFtaWNhbGx5IGFsbG9jYXRpbmcg
dGhlIAprb2JqLCBpdCB3b3VsZCBiZSBhIG1lbWJlciBvZiBxdWV1ZS4gVGhlbiB5b3UgY291bGQg
dXNlIHRoZSBkZWZhdWx0X2F0dHJzLgoKUmVnYXJkcywKIMKgIEZlbGl4CgoKPiAyLiBJIGFsc28g
bG9va2VkIGludG8ga29ial9hdHRyaWJ1dGUgc2VlIGlmIEkgY2FuIHNpbXBseSB1c2Ugc3lzZnNf
Y3JlYXRlX2dyb3VwIChpbnN0ZWFkIG9mIHN5c2ZzX2NyZWF0ZV9maWxlIHRocmVlIHRpbWVzKSBs
aWtlIGhvdyBLRkQgaW1wbGVtZW50cyBERiBhbmQgdG9wb2xvZ3kgcGVyZi4gVGhlIGNoYWxsZW5n
ZSBpcyBpdCBuZWVkcyBhIHByZS1kZWNsYXJlZCBhdHRycyBzZXQgYnV0IGluIG15IGNhc2UsIHF1
ZXVlcyBhcmUgY3JlYXRlZCBkeW5hbWljYWxseSBzbyBJIGNhbid0IHByZS1kZWNsYXJlIHRoZW0g
dW5sZXNzIEkgY2FuIHByZWRpY3QgdGhlIG51bWJlciBvZiBxdWV1ZXMuIEF0dHIgc2V0cyBmb3Ig
REYgYW5kIHBlcmYgYXJlIGJvdGggYSBmaXhlZCBudW1iZXIuIFRoZXkgYm90aCBkZWNsYXJlIHRo
ZSBhdHRyIHNldHMgaW4gZ2xvYmFsIGRhdGEgYmVmb3JlIHRoZSBmdW5jdGlvbiBjYWxscyBzeXNm
c19jcmVhdGVfZ3JvdXAgd2hpbGUgSSBjYW4ndCBkbyB0aGF0IGluIHRoaXMgY2FzZSBkdWUgdG8g
cXVldWVzIGFyZSBkeW5hbWljYWxseSBnZW5lcmF0ZWQuCj4KPiBUaGFua3MgZm9yIHRoZSB0d28g
aW5saW5lIGNvbW1lbnRzLiBJJ2xsIGZpeCB0aGVtIGFuZCBzdWJtaXQgYWdhaW4uCj4KPiBSZWdh
cmRzLAo+IEFtYmVyCj4KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEt1ZWhs
aW5nLCBGZWxpeCA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KPiBTZW50OiBGcmlkYXksIEphbnVh
cnkgMzEsIDIwMjAgMTI6MDYgUE0KPiBUbzogTGluLCBBbWJlciA8QW1iZXIuTGluQGFtZC5jb20+
OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJd
IGRybS9hbWRrZmQ6IEFkZCBxdWV1ZSBpbmZvcm1hdGlvbiB0byBzeXNmcwo+Cj4gWW91IGNvdWxk
IHNhdmUgeW91cnNlbGYgdGhlIHRyb3VibGUgb2YgbWFudWFsbHkgYWRkaW5nIGFuZCByZW1vdmVk
IGluZGl2aWR1YWwgc3lzZnMgZmlsZXMgYnkgc2V0dGluZyB0aGUgZGVmYXVsdF9hdHRycyBpbiB0
aGUga29ial90eXBlLgo+IFNlZSB0dG1fbWVtb3J5LmMgZm9yIGFuIGV4YW1wbGUgaG93IHRoaXMg
aXMgZG9uZS4KPgo+IE1vcmUgY29tbWVudHMgaW5saW5lLgo+Cj4gT24gMjAyMC0wMS0zMSA4OjQ1
IGEubS4sIEFtYmVyIExpbiB3cm90ZToKPj4gUHJvdmlkZSBjb21wdXRlIHF1ZXVlcyBpbmZvcm1h
dGlvbiBpbiBzeXNmcyB1bmRlciAvc3lzL2NsYXNzL2tmZC9rZmQvcHJvYy4KPj4gVGhlIGZvcm1h
dCBpcyAvc3lzL2NsYXNzL2tmZC9rZmQvcHJvYy88cGlkPi9xdWV1ZXMvPHF1ZXVlIGlkPi9YWCB3
aGVyZQo+PiBYWCBhcmUgc2l6ZSwgdHlwZSwgYW5kIGdwdWlkIHRocmVlIGZpbGVzIHRvIHJlcHJl
c2VudCBxdWV1ZSBzaXplLAo+PiBxdWV1ZSB0eXBlLCBhbmQgdGhlIEdQVSB0aGlzIHF1ZXVlIHVz
ZXMuIDxxdWV1ZSBpZD4gZm9sZGVyIGFuZCBmaWxlcwo+PiB1bmRlcm5lYXRoIGFyZSBnZW5lcmF0
ZWQgd2hlbiBhIHF1ZXVlIGlzIGNyZWF0ZWQuIFRoZXkgYXJlIHJlbW92ZWQKPj4gd2hlbiB0aGUg
cXVldWUgaXMgZGVzdHJveWVkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbWJlciBMaW4gPEFtYmVy
LkxpbkBhbWQuY29tPgo+PiAtLS0KPj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X3ByaXYuaCAgICAgICAgICAgICAgfCAgOSArKwo+PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfcHJvY2Vzcy5jICAgICAgICAgICB8IDk2ICsrKysrKysrKysrKysrKysrKysrKysK
Pj4gICAgLi4uL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyLmMg
fCAgMiArCj4+ICAgIDMgZmlsZXMgY2hhbmdlZCwgMTA3IGluc2VydGlvbnMoKykKPj4KPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmgKPj4gYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oCj4+IGluZGV4IGMwYjBkZWYuLmNiMmQy
ZDcgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmgK
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaAo+PiBAQCAtNTAz
LDYgKzUwMywxMiBAQCBzdHJ1Y3QgcXVldWUgewo+PiAgICAJc3RydWN0IGtmZF9wcm9jZXNzCSpw
cm9jZXNzOwo+PiAgICAJc3RydWN0IGtmZF9kZXYJCSpkZXZpY2U7Cj4+ICAgIAl2b2lkICpnd3M7
Cj4+ICsKPj4gKwkvKiBwcm9jZnMgKi8KPj4gKwlzdHJ1Y3Qga29iamVjdCAqa29ial9xaWQ7Cj4+
ICsJc3RydWN0IGF0dHJpYnV0ZSBhdHRyX3NpemU7Cj4+ICsJc3RydWN0IGF0dHJpYnV0ZSBhdHRy
X3R5cGU7Cj4+ICsJc3RydWN0IGF0dHJpYnV0ZSBhdHRyX2dwdWlkOwo+PiAgICB9Owo+PiAgICAK
Pj4gICAgLyoKPj4gQEAgLTczMCw2ICs3MzYsNyBAQCBzdHJ1Y3Qga2ZkX3Byb2Nlc3Mgewo+PiAg
ICAKPj4gICAgCS8qIEtvYmogZm9yIG91ciBwcm9jZnMgKi8KPj4gICAgCXN0cnVjdCBrb2JqZWN0
ICprb2JqOwo+PiArCXN0cnVjdCBrb2JqZWN0ICprb2JqX3F1ZXVlczsKPj4gICAgCXN0cnVjdCBh
dHRyaWJ1dGUgYXR0cl9wYXNpZDsKPj4gICAgfTsKPj4gICAgCj4+IEBAIC04MzYsNiArODQzLDgg
QEAgZXh0ZXJuIHN0cnVjdCBkZXZpY2UgKmtmZF9kZXZpY2U7Cj4+ICAgIC8qIEtGRCdzIHByb2Nm
cyAqLwo+PiAgICB2b2lkIGtmZF9wcm9jZnNfaW5pdCh2b2lkKTsKPj4gICAgdm9pZCBrZmRfcHJv
Y2ZzX3NodXRkb3duKHZvaWQpOwo+PiAraW50IGtmZF9wcm9jZnNfYWRkX3F1ZXVlKHN0cnVjdCBx
dWV1ZSAqcSk7IHZvaWQKPj4gK2tmZF9wcm9jZnNfZGVsX3F1ZXVlKHN0cnVjdCBxdWV1ZSAqcSk7
Cj4+ICAgIAo+PiAgICAvKiBUb3BvbG9neSAqLwo+PiAgICBpbnQga2ZkX3RvcG9sb2d5X2luaXQo
dm9pZCk7Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJv
Y2Vzcy5jCj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3MuYwo+PiBp
bmRleCAyNWI5MGY3Li43OGNhMDM3IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfcHJvY2Vzcy5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2Zk
L2tmZF9wcm9jZXNzLmMKPj4gQEAgLTEzMiw2ICsxMzIsOTQgQEAgdm9pZCBrZmRfcHJvY2ZzX3No
dXRkb3duKHZvaWQpCj4+ICAgIAl9Cj4+ICAgIH0KPj4gICAgCj4+ICtzdGF0aWMgaW50IGtmZF9w
cm9jZnNfYWRkX2ZpbGUoY29uc3QgY2hhciAqbmFtZSwgc3RydWN0IGtvYmplY3QgKmtvYmosCj4+
ICsJCQkgICAgICAgc3RydWN0IGF0dHJpYnV0ZSAqYXR0cikKPj4gK3sKPj4gKwlpbnQgcmV0Owo+
PiArCj4+ICsJYXR0ci0+bmFtZSA9IG5hbWU7Cj4+ICsJYXR0ci0+bW9kZSA9IEtGRF9TWVNGU19G
SUxFX01PREU7Cj4+ICsJc3lzZnNfYXR0cl9pbml0KGF0dHIpOwo+PiArCXJldCA9IHN5c2ZzX2Ny
ZWF0ZV9maWxlKGtvYmosIGF0dHIpOwo+PiArCWlmIChyZXQpCj4+ICsJCXByX3dhcm4oIkNyZWF0
aW5nICVzIGZpbGUgZmFpbGVkIiwgbmFtZSk7Cj4+ICsJcmV0dXJuIHJldDsKPj4gK30KPj4gKwo+
PiArc3RhdGljIHNzaXplX3Qga2ZkX3Byb2Nmc19xdWV1ZV9zaG93KHN0cnVjdCBrb2JqZWN0ICpr
b2JqLAo+PiArCQkJCSAgICAgc3RydWN0IGF0dHJpYnV0ZSAqYXR0ciwgY2hhciAqYnVmZmVyKSB7
Cj4+ICsJaWYgKCFzdHJjbXAoYXR0ci0+bmFtZSwgInNpemUiKSkgewo+PiArCQlzdHJ1Y3QgcXVl
dWUgKnEgPSBjb250YWluZXJfb2YoYXR0ciwgc3RydWN0IHF1ZXVlLCBhdHRyX3NpemUpOwo+PiAr
CQlyZXR1cm4gc25wcmludGYoYnVmZmVyLCBQQUdFX1NJWkUsICIlbGx1IiwKPj4gKwkJCQlxLT5w
cm9wZXJ0aWVzLnF1ZXVlX3NpemUpOwo+PiArCX0gZWxzZSBpZiAoIXN0cmNtcChhdHRyLT5uYW1l
LCAidHlwZSIpKSB7Cj4+ICsJCXN0cnVjdCBxdWV1ZSAqcSA9IGNvbnRhaW5lcl9vZihhdHRyLCBz
dHJ1Y3QgcXVldWUsIGF0dHJfdHlwZSk7Cj4+ICsJCXJldHVybiBzbnByaW50ZihidWZmZXIsIFBB
R0VfU0laRSwgIiVkIiwgcS0+cHJvcGVydGllcy50eXBlKTsKPj4gKwl9IGVsc2UgaWYgKCFzdHJj
bXAoYXR0ci0+bmFtZSwgImdwdWlkIikpIHsKPj4gKwkJc3RydWN0IHF1ZXVlICpxID0gY29udGFp
bmVyX29mKGF0dHIsIHN0cnVjdCBxdWV1ZSwgYXR0cl9ncHVpZCk7Cj4+ICsJCXJldHVybiBzbnBy
aW50ZihidWZmZXIsIFBBR0VfU0laRSwgIiV1IiwgcS0+ZGV2aWNlLT5pZCk7Cj4+ICsJfSBlbHNl
Cj4+ICsJCXByX2VycigiSW52YWxpZCBhdHRyaWJ1dGUiKTsKPj4gKwo+PiArCXJldHVybiAwOwo+
PiArfQo+PiArCj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHN5c2ZzX29wcyBwcm9jZnNfcXVldWVf
b3BzID0gewo+PiArCS5zaG93ID0ga2ZkX3Byb2Nmc19xdWV1ZV9zaG93LAo+PiArfTsKPj4gKwo+
PiArc3RhdGljIHN0cnVjdCBrb2JqX3R5cGUgcHJvY2ZzX3F1ZXVlX3R5cGUgPSB7Cj4+ICsJLnJl
bGVhc2UgPSBrZmRfcHJvY2ZzX2tvYmpfcmVsZWFzZSwKPj4gKwkuc3lzZnNfb3BzID0gJnByb2Nm
c19xdWV1ZV9vcHMsCj4+ICt9Owo+PiArCj4+ICtpbnQga2ZkX3Byb2Nmc19hZGRfcXVldWUoc3Ry
dWN0IHF1ZXVlICpxKSB7Cj4+ICsJc3RydWN0IGtmZF9wcm9jZXNzICpwcm9jOwo+PiArCWludCBy
ZXQ7Cj4+ICsKPj4gKwlpZiAoIXEgfHwgIXEtPnByb2Nlc3MpCj4+ICsJCXJldHVybiAtRUlOVkFM
Owo+PiArCXByb2MgPSBxLT5wcm9jZXNzOwo+PiArCj4+ICsJLyogQ3JlYXRlIHByb2MvPHBpZD4v
cXVldWVzLzxxdWV1ZSBpZD4gZm9sZGVyKi8KPj4gKwlpZiAoIXByb2MtPmtvYmpfcXVldWVzKQo+
PiArCQlyZXR1cm4gLUVGQVVMVDsKPj4gKwlpZiAocS0+a29ial9xaWQpCj4+ICsJCXJldHVybiAt
RUVYSVNUOwo+PiArCXEtPmtvYmpfcWlkID0ga2ZkX2FsbG9jX3N0cnVjdChxLT5rb2JqX3FpZCk7
Cj4+ICsJaWYgKCFxLT5rb2JqX3FpZCkKPj4gKwkJcmV0dXJuIC1FTk9NRU07Cj4+ICsJcmV0ID0g
a29iamVjdF9pbml0X2FuZF9hZGQocS0+a29ial9xaWQsICZwcm9jZnNfcXVldWVfdHlwZSwKPj4g
KwkJCXByb2MtPmtvYmpfcXVldWVzLCAiJXUiLCBxLT5wcm9wZXJ0aWVzLnF1ZXVlX2lkKTsKPj4g
KwlpZiAocmV0IDwgMCkgewo+PiArCQlwcl93YXJuKCJDcmVhdGluZyBwcm9jLzxwaWQ+L3F1ZXVl
cy8ldSBmYWlsZWQiLAo+PiArCQkJcS0+cHJvcGVydGllcy5xdWV1ZV9pZCk7Cj4gQWZ0ZXIga29i
amVjdF9pbml0X2FuZF9hZGQgZmFpbHMsIHlvdSBtdXN0IGNhbGwga29iamVjdF9wdXQgdG8gYXZv
aWQgbWVtb3J5IGxlYWtzLgo+Cj4KPj4gKwkJcmV0dXJuIHJldDsKPj4gKwl9Cj4+ICsKPj4gKwkv
KiBDcmVhdGUgcHJvYy88cGlkPi9xdWV1ZXMvPHF1ZXVlIGlkPi9YWCBmaWxlcyAqLwo+PiArCWtm
ZF9wcm9jZnNfYWRkX2ZpbGUoInNpemUiLCBxLT5rb2JqX3FpZCwgJnEtPmF0dHJfc2l6ZSk7Cj4+
ICsJa2ZkX3Byb2Nmc19hZGRfZmlsZSgidHlwZSIsIHEtPmtvYmpfcWlkLCAmcS0+YXR0cl90eXBl
KTsKPj4gKwlrZmRfcHJvY2ZzX2FkZF9maWxlKCJncHVpZCIsIHEtPmtvYmpfcWlkLCAmcS0+YXR0
cl9ncHVpZCk7Cj4+ICsKPj4gKwlyZXR1cm4gMDsKPj4gK30KPj4gKwo+PiArdm9pZCBrZmRfcHJv
Y2ZzX2RlbF9xdWV1ZShzdHJ1Y3QgcXVldWUgKnEpCj4+ICt7Cj4+ICsJaWYgKCFxIHx8ICFxLT5w
cm9jZXNzKQo+PiArCQlyZXR1cm47Cj4gWW91IG5lZWQgdG8gY2hlY2sgcS0+b2JqX3FpZCB0b28s
IGluIGNhc2Uga2ZkX3Byb2Nmc19hZGRfcXVldWUgZmFpbGVkLgo+Cj4gUmVnYXJkcywKPiAgIMKg
IEZlbGl4Cj4KPj4gKwo+PiArCXN5c2ZzX3JlbW92ZV9maWxlKHEtPmtvYmpfcWlkLCAmcS0+YXR0
cl9zaXplKTsKPj4gKwlzeXNmc19yZW1vdmVfZmlsZShxLT5rb2JqX3FpZCwgJnEtPmF0dHJfdHlw
ZSk7Cj4+ICsJc3lzZnNfcmVtb3ZlX2ZpbGUocS0+a29ial9xaWQsICZxLT5hdHRyX2dwdWlkKTsK
Pj4gKwlrb2JqZWN0X2RlbChxLT5rb2JqX3FpZCk7Cj4+ICsJa29iamVjdF9wdXQocS0+a29ial9x
aWQpOwo+PiArCXEtPmtvYmpfcWlkID0gTlVMTDsKPj4gK30KPj4gKwo+PiAgICBpbnQga2ZkX3By
b2Nlc3NfY3JlYXRlX3dxKHZvaWQpCj4+ICAgIHsKPj4gICAgCWlmICgha2ZkX3Byb2Nlc3Nfd3Ep
Cj4+IEBAIC0zMjMsNiArNDExLDExIEBAIHN0cnVjdCBrZmRfcHJvY2VzcyAqa2ZkX2NyZWF0ZV9w
cm9jZXNzKHN0cnVjdCBmaWxlICpmaWxlcCkKPj4gICAgCQlpZiAocmV0KQo+PiAgICAJCQlwcl93
YXJuKCJDcmVhdGluZyBwYXNpZCBmb3IgcGlkICVkIGZhaWxlZCIsCj4+ICAgIAkJCQkJKGludClw
cm9jZXNzLT5sZWFkX3RocmVhZC0+cGlkKTsKPj4gKwo+PiArCQlwcm9jZXNzLT5rb2JqX3F1ZXVl
cyA9IGtvYmplY3RfY3JlYXRlX2FuZF9hZGQoInF1ZXVlcyIsCj4+ICsJCQkJCQkJcHJvY2Vzcy0+
a29iaik7Cj4+ICsJCWlmICghcHJvY2Vzcy0+a29ial9xdWV1ZXMpCj4+ICsJCQlwcl93YXJuKCJD
cmVhdGluZyBLRkQgcHJvYy9xdWV1ZXMgZm9sZGVyIGZhaWxlZCIpOwo+PiAgICAJfQo+PiAgICBv
dXQ6Cj4+ICAgIAlpZiAoIUlTX0VSUihwcm9jZXNzKSkKPj4gQEAgLTQ1Nyw2ICs1NTAsOSBAQCBz
dGF0aWMgdm9pZCBrZmRfcHJvY2Vzc193cV9yZWxlYXNlKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29y
aykKPj4gICAgCS8qIFJlbW92ZSB0aGUgcHJvY2ZzIGZpbGVzICovCj4+ICAgIAlpZiAocC0+a29i
aikgewo+PiAgICAJCXN5c2ZzX3JlbW92ZV9maWxlKHAtPmtvYmosICZwLT5hdHRyX3Bhc2lkKTsK
Pj4gKwkJa29iamVjdF9kZWwocC0+a29ial9xdWV1ZXMpOwo+PiArCQlrb2JqZWN0X3B1dChwLT5r
b2JqX3F1ZXVlcyk7Cj4+ICsJCXAtPmtvYmpfcXVldWVzID0gTlVMTDsKPj4gICAgCQlrb2JqZWN0
X2RlbChwLT5rb2JqKTsKPj4gICAgCQlrb2JqZWN0X3B1dChwLT5rb2JqKTsKPj4gICAgCQlwLT5r
b2JqID0gTlVMTDsKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9wcm9jZXNzX3F1ZXVlX21hbmFnZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9wcm9jZXNzX3F1ZXVlX21hbmFnZXIuYwo+PiBpbmRleCA4ZmE4NTZlLi5jYjFjYTExIDEwMDY0
NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzc19xdWV1ZV9t
YW5hZ2VyLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3Nf
cXVldWVfbWFuYWdlci5jCj4+IEBAIC0zMjIsNiArMzIyLDcgQEAgaW50IHBxbV9jcmVhdGVfcXVl
dWUoc3RydWN0IHByb2Nlc3NfcXVldWVfbWFuYWdlciAqcHFtLAo+PiAgICAKPj4gICAgCWlmIChx
KSB7Cj4+ICAgIAkJcHJfZGVidWcoIlBRTSBkb25lIGNyZWF0aW5nIHF1ZXVlXG4iKTsKPj4gKwkJ
a2ZkX3Byb2Nmc19hZGRfcXVldWUocSk7Cj4+ICAgIAkJcHJpbnRfcXVldWVfcHJvcGVydGllcygm
cS0+cHJvcGVydGllcyk7Cj4+ICAgIAl9Cj4+ICAgIAo+PiBAQCAtMzc4LDYgKzM3OSw3IEBAIGlu
dCBwcW1fZGVzdHJveV9xdWV1ZShzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyICpwcW0sIHVu
c2lnbmVkIGludCBxaWQpCj4+ICAgIAl9Cj4+ICAgIAo+PiAgICAJaWYgKHBxbi0+cSkgewo+PiAr
CQlrZmRfcHJvY2ZzX2RlbF9xdWV1ZShwcW4tPnEpOwo+PiAgICAJCWRxbSA9IHBxbi0+cS0+ZGV2
aWNlLT5kcW07Cj4+ICAgIAkJcmV0dmFsID0gZHFtLT5vcHMuZGVzdHJveV9xdWV1ZShkcW0sICZw
ZGQtPnFwZCwgcHFuLT5xKTsKPj4gICAgCQlpZiAocmV0dmFsKSB7Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
