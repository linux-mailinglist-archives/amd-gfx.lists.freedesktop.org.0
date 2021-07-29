Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A45213DA7C8
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Jul 2021 17:47:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F656EDD2;
	Thu, 29 Jul 2021 15:47:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2067.outbound.protection.outlook.com [40.107.236.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE6046EDD3
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Jul 2021 15:47:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aILIA0qM/LpeKQsHSWV/1sENJO4FBxT/Cb971hOxdG4NikCEjGIYdJYjjxSDXutZJSCa9VpS3sHfaKcmkYOpXonH+tQWPqvVYmGuPqjO73+hcRcehhmmlZgi1cqofSTeoJk0L77usswTWIU5vhucbfPqWgm+yLZrzJfWAEakMTvcLO0Ll+CSd2/h3h8Pk0yNTSdefUMAae/2CZZ2BP/k0Z76QeEodUiDQfyDiaVsWcwtjAYhdHuZVejiHWF1gtfFJE/PVwZyFI5gf/W4FOOTtLjAh//QCeruGxDK6WkP95rVQCwRhc/0rnJ07YGzySux5e6vFz9vR43EQXvPC688jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHooLj6Zoga8xSxW+SoRjUacOmUHodMZlz5i/iToL3Y=;
 b=nXLLGML0Gy80pKBnybSHFSbPe+khaslu4jQ8B0UyQ5sVWYRfrgfkcbhP9YZJXzZzS0JBTyhCVNbqk/BDDiRdHSGZVkN0VeaLI5W3Ao+bomlC4oSz443lP7XmfADcL/keL4cj8GJg+qOl5W4/PJ2lOx78LmLAJOOvH5I98iSUIJmaTE2tNgfd9IJBCiOLGdW+m49YTfOAXBJPfqfD5Y7ObhuHyEB8NFyOWnK57x1tn1hLVtD0kUcEAtFXK3fZ2L2fd2FTdTocO4VaeZwo5x6DpxR/4aKVGCm7jlyphnvlPWzrgcmAr50blfbKTkoHlb/lquSCwrddRSNcOGR6TmZ4PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHooLj6Zoga8xSxW+SoRjUacOmUHodMZlz5i/iToL3Y=;
 b=xbQrEUBpcqQin1vThm7oaCxGuY8WVR5Tu0yvdjoBzZg8+j6zTrUzDgORMgcw46JH7Bo0r970wz+YeADEcHYF9KGkSiQtSdOIaY9EL6Jc6gL0bGhYTtbwFlN9pWP1TgD8Pmb9FAibJYMUcUkQ8ZxgCzDWDKZ8fLw+JzD4PXyeCzo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5147.namprd12.prod.outlook.com (2603:10b6:408:118::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Thu, 29 Jul
 2021 15:47:12 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb%3]) with mapi id 15.20.4352.033; Thu, 29 Jul 2021
 15:47:12 +0000
Subject: Re: [PATCH] drm/amdkfd: avoid conflicting address mappings
To: Alex Sierra <alex.sierra@amd.com>, amd-gfx@lists.freedesktop.org
References: <20210719211857.29954-1-alex.sierra@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <bab05e8a-cd9e-8717-5de8-914573a12c8a@amd.com>
Date: Thu, 29 Jul 2021 11:47:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210719211857.29954-1-alex.sierra@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::37) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.182.144.73) by
 YTXPR0101CA0024.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18 via Frontend Transport; Thu, 29 Jul 2021 15:47:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb12a0e4-2a92-46ea-460f-08d952a8217b
X-MS-TrafficTypeDiagnostic: BN9PR12MB5147:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB51476EB4E134F2BA34856FD692EB9@BN9PR12MB5147.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: asspyp3Pko7PADghQ8VgZ7/OMJx8LKlqCPP6jIpYxisUExOyC2FWKOjHSvJPgYuiD7Zrq/T1V0kW7XMbmd3nOyHCxV6TEY1UnioCQTNn+oMNho49HDaLt0ZwUV4UiDXYfgfYvj/biedKsf/9Jzr/q/A3WE4cF+hkVKQnRc9JTPvzTBF3VQKOR9UsALyu+GY+dJjlzsC4nJJWF8nUDq9Dv3NLnb/zQfDGxMNsSxAfPwXMiUZFQPp2e9tzZeghev5RKC6AIIChd1bhcIspPHMgFAKVLEOKfEWCj6f4+EeQWd3kpUMSkXZ5guj1aozSeZ3BvueKs8jRMsz6j6N52qKTVxES6pzqcxQv4uuWfseWZYUX3wzDK1MU7CYBhRFA0nvfC99BJ5LsjCEJ/B4rCPi0nOsf2LbjW022K1slguSvfIYERVR9POzzMD2lhcno6iRG9B/4EjbpInttQYdxGVbTIE01meiCnit+dDDiN3vUeLSc8zZPGeq7VA9Tz2g7omElYbtxixair16DSDuWQ/iBqVAJ6p4DAZ5emhHJADHeF1Kw2B/I0GqgnNY+N75Qzg0p9lGyGXuohZtpaFciZb2IgY0B8OWP4yrLTSdJYMocNuGx4IgZLS6x9qxsBRrQ/c3Co0bu5qR4ezPa+/GUwuijBEiQ8n5fvcU1QOIUeJW6E/sHeqwr2zAdFJPFe2Qx/5msuqBA1JzrKULa41jbYc3003zWADW3MAjOWYIdcLoVHisw0wAObvUu7fzM+OGJ8XQu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(66556008)(66476007)(36756003)(44832011)(66946007)(2616005)(31696002)(956004)(86362001)(6486002)(16576012)(316002)(478600001)(2906002)(5660300002)(38100700002)(83380400001)(31686004)(186003)(8936002)(8676002)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGV3bm5RMUFRMVdXcDlZRmZxWFZieEQrZzVTUjVkR0pRZHg5UU9pM1Exd2lY?=
 =?utf-8?B?Q2JZSFpDYU92Ukd1ZmRJdmhld3EyUVFJbU4vZnlkK215S3dWaFVyTUh5aUNv?=
 =?utf-8?B?dGQya2lkcC9EWEdkZklZeWppYzQ1RnlySlBBZStiMnFOT0M5UVh4Yk9XL215?=
 =?utf-8?B?YzRvV2ViVEN6UExjbmhjcE9aQldxQ0Q0VmRDcFpGMmRxTTZjYmUxK0c1TVJx?=
 =?utf-8?B?eHZCcFBZWkpaZDdHMk05U1NwbHFlZklRam5qbTVQQ3drS3hEeE5mOVRQZ0RF?=
 =?utf-8?B?OEpvQTk0N2dsUXBBRTA2ZzhkeS9sVldOZHErRWZWdVBLaXBjNzBRVHZpeE1M?=
 =?utf-8?B?ckRlMmRjYXJiSE1FSXdVQmY1dTdUcG1oampuNVgrazYzcHZEaktOZjFVQ0dS?=
 =?utf-8?B?SVkyREZHaVNEWlVybW42ZDdvVERqWUtpTlhISWVhb1psb2I2blg2UDhoR2du?=
 =?utf-8?B?WkNJT25lclBIQmtCUGV0Vm1uTmxSbEp3Vm84Sm5SZ1Z4UVRFU0JpSWN3aFFo?=
 =?utf-8?B?TnZYaXVpKzluOWFKTGpML2I4RlRkOXR4UjhEN0pkYkk2Rkxlcmx0dmhZclJN?=
 =?utf-8?B?RzFpMklIRVJDczNGZHlWWlNBaXU2OVBxYVBMUEIwaW04YU5mTjAyaDNoQjE4?=
 =?utf-8?B?Vk5iWVFCczN0RTlwUU1TY1JJYVZ6MDVVZ2FXcUVsZzhVQ1lNZnduUmhCR210?=
 =?utf-8?B?V2xwa3BGZC83d3UybEJXNVhoTFdyWS8rZGdDcUMvOW01amVONTJVMW1HcHo5?=
 =?utf-8?B?eU5YOHZVSUhoR1VtVkRVcW53bTV5WUF3cU5WQXlFTkVWcUlaUG4wRVdMai8r?=
 =?utf-8?B?d1pQMXVmSGpheDI3T1crSG41aDRDbWdvUUpUbEt5NGJrUXJrQzRLdENBQmQw?=
 =?utf-8?B?RFdITlVjUkhuS0IrelZvYXBneGlEd1JhWkhFQktvcU90MEhkYjZ6enNkK0NM?=
 =?utf-8?B?dG50aXJ3YVVxYjhDNmNydFpkdEFJVG5YVWw0bFNEU2FhaHl6VnNjaFNtKytw?=
 =?utf-8?B?ak1JbzdLQ2U1aVE4bW8xejJ2ZGVSN0ZTMWhNSVFJRjZCMWRhNXRLeDZ5TkQ4?=
 =?utf-8?B?UG1td05DQmlZRmlkVlZkS1lzZm9lOWtxSTVwQXhJUWhUMGdTREhDcUFrZElL?=
 =?utf-8?B?YlBTS1g5UlhSQVJsQnl5RVM4MXJuRGgwMnpqYUt6WTZBL0U3QlNsZTlDdGJ2?=
 =?utf-8?B?WnNCTUJYYkU2a1dZWVBocEpBcTJFNXpKUTJPNmpJTXNaRjJUVlNIRUpmblBy?=
 =?utf-8?B?Q001RDBQbkYwcWNselBzdlVqc2xZZk5QSkJnQ083bXJKak1idHdtRnZSZzM1?=
 =?utf-8?B?VHltdHpoNjNqNlhKZTN6cVY0Z3BjZVFZTkxNM3VOL0kzekhOMU83MkdwQkIz?=
 =?utf-8?B?SDdWYjZDM0R5YWhxV0lrSk1VcnM1MkRGQUgvY2dscy9qYzRGbnc1VTlIOWZ0?=
 =?utf-8?B?YzVwQmRscVJCK2JVQThFYmNqT1lwSTJmSzhSNFV0eS9nYW8vUkUrU3J2OVJQ?=
 =?utf-8?B?VEhSTE1rRVlOZ3UvK0tVV2Q2aC9EK0dOVTNKeEs3MEFZVDhwYkMzbVlDaUFN?=
 =?utf-8?B?VW83UEtiWWJUNVI4YjhXQnJ0Wnh4aE1tbDhlQTFiRTFzTlZSV2p0dllYTkNx?=
 =?utf-8?B?SXk1Z2RSOUZlRzgyU0hnZnVzYlhlcDF5SENWUWxWWVlEL2FKZUM3dGRyRGVK?=
 =?utf-8?B?bHRRY2w0TUJ4V3RHN2JQd2FNb1JpVU9tTExkUmxDejM3aFY5UWl4c21TMW5P?=
 =?utf-8?Q?lD46OGIEzvyfcKW8wxS7aUV73NGo3zsxiYQTYME?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb12a0e4-2a92-46ea-460f-08d952a8217b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2021 15:47:12.1337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y7osEvjOajscOHHAiJJMLTs2c7c6vESRMCQPYyr2Q8lqWYfvaNtF7tlrH0F0sMXb2VHlVGK4KDgqaFOGo8W28g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5147
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjAyMS0wNy0xOSB1bSA1OjE4IHAubS4gc2NocmllYiBBbGV4IFNpZXJyYToKPiBbV2h5XQo+
IEF2b2lkIGNvbmZsaWN0IHdpdGggYWRkcmVzcyByYW5nZXMgbWFwcGVkIGJ5IFNWTQo+IG1lY2hh
bmlzbSB0aGF0IHRyeSB0byBiZSBhbGxvY2F0ZWQgYWdhaW4gdGhyb3VnaAo+IGlvY3RsX2FsbG9j
IGluIHRoZSBzYW1lIHByb2Nlc3MuIEFuZCB2aWNldmVyc2EuCj4KPiBbSG93XQo+IEZvciBpb2N0
bF9hbGxvY19tZW1vcnlfb2ZfZ3B1IGFsbG9jYXRpb25zCj4gQ2hlY2sgaWYgdGhlIGFkZHJlc3Mg
cmFuZ2UgcGFzc2VkIGludG8gaW9jdGwgbWVtb3J5Cj4gYWxsb2MgZG9lcyBub3QgZXhpc3QgYWxy
ZWFkeSBpbiB0aGUga2ZkX3Byb2Nlc3MKPiBzdm1zLT5vYmplY3RzIGludGVydmFsIHRyZWUuCj4K
PiBGb3IgU1ZNIGFsbG9jYXRpb25zCj4gTG9vayBmb3IgdGhlIGFkZHJlc3MgcmFuZ2UgaW50byB0
aGUgaW50ZXJ2YWwgdHJlZSBWQSBmcm9tCj4gdGhlIFZNIGluc2lkZSBvZiBlYWNoIHBkZHMgdXNl
ZCBpbiBhIGtmZF9wcm9jZXNzLgo+Cj4gU2lnbmVkLW9mZi1ieTogQWxleCBTaWVycmEgPGFsZXgu
c2llcnJhQGFtZC5jb20+CgpUd28gbml0cGlja3MgaW5saW5lLiBXaXRoIHRoYXQgZml4ZWQsIHRo
ZSBwYXRjaCBpcwoKUmV2aWV3ZWQtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0Bh
bWQuY29tPgoKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2
LmMgfCAxMyArKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9zdm0uYyAgICAg
fCA3OSArKysrKysrKysrKysrKysrKysrLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA3NSBpbnNl
cnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQv
a2ZkX2NoYXJkZXYuYwo+IGluZGV4IDY3NTQxYzMwMzI3YS4uZjM5YmFhYTIyYTYyIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jCj4gQEAgLTEyNTEsNiArMTI1
MSw3IEBAIHN0YXRpYyBpbnQga2ZkX2lvY3RsX2FsbG9jX21lbW9yeV9vZl9ncHUoc3RydWN0IGZp
bGUgKmZpbGVwLAo+ICAJc3RydWN0IGtmZF9wcm9jZXNzX2RldmljZSAqcGRkOwo+ICAJdm9pZCAq
bWVtOwo+ICAJc3RydWN0IGtmZF9kZXYgKmRldjsKPiArCXN0cnVjdCBzdm1fcmFuZ2VfbGlzdCAq
c3ZtcyA9ICZwLT5zdm1zOwo+ICAJaW50IGlkcl9oYW5kbGU7Cj4gIAlsb25nIGVycjsKPiAgCXVp
bnQ2NF90IG9mZnNldCA9IGFyZ3MtPm1tYXBfb2Zmc2V0Owo+IEBAIC0xMjU5LDYgKzEyNjAsMTgg
QEAgc3RhdGljIGludCBrZmRfaW9jdGxfYWxsb2NfbWVtb3J5X29mX2dwdShzdHJ1Y3QgZmlsZSAq
ZmlsZXAsCj4gIAlpZiAoYXJncy0+c2l6ZSA9PSAwKQo+ICAJCXJldHVybiAtRUlOVkFMOwo+ICAK
PiArI2lmIElTX0VOQUJMRUQoQ09ORklHX0hTQV9BTURfU1ZNKQo+ICsJbXV0ZXhfbG9jaygmc3Zt
cy0+bG9jayk7Cj4gKwlpZiAoaW50ZXJ2YWxfdHJlZV9pdGVyX2ZpcnN0KCZzdm1zLT5vYmplY3Rz
LAo+ICsJCQkJICAgICBhcmdzLT52YV9hZGRyID4+IFBBR0VfU0hJRlQsCj4gKwkJCQkgICAgIChh
cmdzLT52YV9hZGRyICsgYXJncy0+c2l6ZSAtIDEpID4+IFBBR0VfU0hJRlQpKSB7Cj4gKwkJcHJf
ZXJyKCJBZGRyZXNzOiAweCVsbHggYWxyZWFkeSBhbGxvY2F0ZWQgYnkgU1ZNXG4iLAo+ICsJCQlh
cmdzLT52YV9hZGRyKTsKPiArCQltdXRleF91bmxvY2soJnN2bXMtPmxvY2spOwo+ICsJCXJldHVy
biAtRUFERFJJTlVTRTsKPiArCX0KPiArCW11dGV4X3VubG9jaygmc3Ztcy0+bG9jayk7Cj4gKyNl
bmRpZgo+ICAJZGV2ID0ga2ZkX2RldmljZV9ieV9pZChhcmdzLT5ncHVfaWQpOwo+ICAJaWYgKCFk
ZXYpCj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1ka2ZkL2tmZF9zdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9zdm0u
Ywo+IGluZGV4IDMxZjNmMjRjZWY2YS4uMDQzZWUwNDY3OTE2IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9zdm0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1ka2ZkL2tmZF9zdm0uYwo+IEBAIC0yNTgxLDkgKzI1ODEsNTQgQEAgaW50IHN2bV9yYW5n
ZV9saXN0X2luaXQoc3RydWN0IGtmZF9wcm9jZXNzICpwKQo+ICAJcmV0dXJuIDA7Cj4gIH0KPiAg
Cj4gKy8qKgo+ICsgKiBzdm1fcmFuZ2VfaXNfdm1fYm9fbWFwcGVkIC0gY2hlY2sgaWYgdmlydHVh
bCBhZGRyZXNzIHJhbmdlIG1hcHBlZCBhbHJlYWR5CgpJIGZpbmQgdGhlIGZ1bmN0aW9uIG5hbWUg
YSBiaXQgY29uZnVzaW5nLiBUaGUgbmFtZSBzdWdnZXN0cyBzb21ldGhpbmcKYWJvdXQgYSBCTywg
YnV0IHRoZSBkZXNjcmlwdGlvbiBvbmx5IHRhbGtzIGFib3V0IGFkZHJlc3MgcmFuZ2VzLiBBbHNv
LAp0aGVyZSBpcyBubyBCTyBwYXJhbWV0ZXIuCgpNYXliZSBhIGJldHRlciBuYW1lIHdvdWxkIGJl
IHN2bV9yYW5nZV9jaGVja192bS4KCgo+ICsgKiBAcDogY3VycmVudCBrZmRfcHJvY2Vzcwo+ICsg
KiBAc3RhcnQ6IHJhbmdlIHN0YXJ0IGFkZHJlc3MsIGluIHBhZ2VzCj4gKyAqIEBsYXN0OiByYW5n
ZSBsYXN0IGFkZHJlc3MsIGluIHBhZ2VzCj4gKyAqCj4gKyAqIFRoZSBwdXJwb3NlIGlzIHRvIGF2
b2lkIHZpcnR1YWwgYWRkcmVzcyByYW5nZXMgYWxyZWFkeSBhbGxvY2F0ZWQgYnkKPiArICoga2Zk
X2lvY3RsX2FsbG9jX21lbW9yeV9vZl9ncHUgaW9jdGwuCj4gKyAqIEl0IGxvb2tzIGZvciBlYWNo
IHBkZCBpbiB0aGUga2ZkX3Byb2Nlc3MuCj4gKyAqCj4gKyAqIENvbnRleHQ6IFByb2Nlc3MgY29u
dGV4dAo+ICsgKgo+ICsgKiBSZXR1cm4gMCAtIE9LLCBpZiB0aGUgcmFuZ2UgaXMgbm90IG1hcHBl
ZC4KPiArICogT3RoZXJ3aXNlIGVycm9yIGNvZGU6Cj4gKyAqIC1FQUREUklOVVNFIC0gaWYgYWRk
cmVzcyBpcyBtYXBwZWQgYWxyZWFkeSBieSBrZmRfaW9jdGxfYWxsb2NfbWVtb3J5X29mX2dwdQo+
ICsgKiAtRVJFU1RBUlRTWVMgLSBBIHdhaXQgZm9yIHRoZSBidWZmZXIgdG8gYmVjb21lIHVucmVz
ZXJ2ZWQgd2FzIGludGVycnVwdGVkIGJ5Cj4gKyAqIGEgc2lnbmFsLiBSZWxlYXNlIGFsbCBidWZm
ZXIgcmVzZXJ2YXRpb25zIGFuZCByZXR1cm4gdG8gdXNlci1zcGFjZS4KPiArICovCj4gK3N0YXRp
YyBpbnQKPiArc3ZtX3JhbmdlX2lzX3ZtX2JvX21hcHBlZChzdHJ1Y3Qga2ZkX3Byb2Nlc3MgKnAs
IHVpbnQ2NF90IHN0YXJ0LCB1aW50NjRfdCBsYXN0KQo+ICt7Cj4gKwl1aW50MzJfdCBpOwo+ICsJ
aW50IHI7Cj4gKwo+ICsJZm9yIChpID0gMDsgaSA8IHAtPm5fcGRkczsgaSsrKSB7Cj4gKwkJc3Ry
dWN0IGFtZGdwdV92bSAqdm07Cj4gKwo+ICsJCWlmICghcC0+cGRkc1tpXS0+ZHJtX3ByaXYpCj4g
KwkJCWNvbnRpbnVlOwo+ICsKPiArCQl2bSA9IGRybV9wcml2X3RvX3ZtKHAtPnBkZHNbaV0tPmRy
bV9wcml2KTsKPiArCQlyID0gYW1kZ3B1X2JvX3Jlc2VydmUodm0tPnJvb3QuYm8sIGZhbHNlKTsK
PiArCQlpZiAocikKPiArCQkJcmV0dXJuIHI7Cj4gKwkJaWYgKGludGVydmFsX3RyZWVfaXRlcl9m
aXJzdCgmdm0tPnZhLCBzdGFydCwgbGFzdCkpIHsKPiArCQkJcHJfZGVidWcoIlJhbmdlIFsweCVs
bHggMHglbGx4XSBhbHJlYWR5IG1hcHBlZFxuIiwgc3RhcnQsIGxhc3QpOwo+ICsJCQlhbWRncHVf
Ym9fdW5yZXNlcnZlKHZtLT5yb290LmJvKTsKPiArCQkJcmV0dXJuIC1FQUREUklOVVNFOwo+ICsJ
CX0KPiArCQlhbWRncHVfYm9fdW5yZXNlcnZlKHZtLT5yb290LmJvKTsKPiArCX0KPiArCj4gKwly
ZXR1cm4gMDsKPiArfQo+ICsKPiAgLyoqCj4gICAqIHN2bV9yYW5nZV9pc192YWxpZCAtIGNoZWNr
IGlmIHZpcnR1YWwgYWRkcmVzcyByYW5nZSBpcyB2YWxpZAo+IC0gKiBAbW06IGN1cnJlbnQgcHJv
Y2VzcyBtbV9zdHJ1Y3QKPiArICogQG1tOiBjdXJyZW50IGtmZF9wcm9jZXNzCgpQbGVhc2UgZml4
IHRoZSB2YXJpYWJsZSBuYW1lIGhlcmU6IG1tIC0+IHAuCgpSZWdhcmRzLArCoCBGZWxpeAoKCj4g
ICAqIEBzdGFydDogcmFuZ2Ugc3RhcnQgYWRkcmVzcywgaW4gcGFnZXMKPiAgICogQHNpemU6IHJh
bmdlIHNpemUsIGluIHBhZ2VzCj4gICAqCj4gQEAgLTI1OTIsMjggKzI2MzcsMjcgQEAgaW50IHN2
bV9yYW5nZV9saXN0X2luaXQoc3RydWN0IGtmZF9wcm9jZXNzICpwKQo+ICAgKiBDb250ZXh0OiBQ
cm9jZXNzIGNvbnRleHQKPiAgICoKPiAgICogUmV0dXJuOgo+IC0gKiAgdHJ1ZSAtIHZhbGlkIHN2
bSByYW5nZQo+IC0gKiAgZmFsc2UgLSBpbnZhbGlkIHN2bSByYW5nZQo+ICsgKiAgMCAtIE9LLCBv
dGhlcndpc2UgZXJyb3IgY29kZQo+ICAgKi8KPiAtc3RhdGljIGJvb2wKPiAtc3ZtX3JhbmdlX2lz
X3ZhbGlkKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1aW50NjRfdCBzdGFydCwgdWludDY0X3Qgc2l6
ZSkKPiArc3RhdGljIGludAo+ICtzdm1fcmFuZ2VfaXNfdmFsaWQoc3RydWN0IGtmZF9wcm9jZXNz
ICpwLCB1aW50NjRfdCBzdGFydCwgdWludDY0X3Qgc2l6ZSkKPiAgewo+ICAJY29uc3QgdW5zaWdu
ZWQgbG9uZyBkZXZpY2Vfdm1hID0gVk1fSU8gfCBWTV9QRk5NQVAgfCBWTV9NSVhFRE1BUDsKPiAg
CXN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hOwo+ICAJdW5zaWduZWQgbG9uZyBlbmQ7Cj4gKwl1
bnNpZ25lZCBsb25nIHN0YXJ0X3VuY2hnID0gc3RhcnQ7Cj4gIAo+ICAJc3RhcnQgPDw9IFBBR0Vf
U0hJRlQ7Cj4gIAllbmQgPSBzdGFydCArIChzaXplIDw8IFBBR0VfU0hJRlQpOwo+IC0KPiAgCWRv
IHsKPiAtCQl2bWEgPSBmaW5kX3ZtYShtbSwgc3RhcnQpOwo+ICsJCXZtYSA9IGZpbmRfdm1hKHAt
Pm1tLCBzdGFydCk7Cj4gIAkJaWYgKCF2bWEgfHwgc3RhcnQgPCB2bWEtPnZtX3N0YXJ0IHx8Cj4g
IAkJICAgICh2bWEtPnZtX2ZsYWdzICYgZGV2aWNlX3ZtYSkpCj4gLQkJCXJldHVybiBmYWxzZTsK
PiArCQkJcmV0dXJuIC1FRkFVTFQ7Cj4gIAkJc3RhcnQgPSBtaW4oZW5kLCB2bWEtPnZtX2VuZCk7
Cj4gIAl9IHdoaWxlIChzdGFydCA8IGVuZCk7Cj4gIAo+IC0JcmV0dXJuIHRydWU7Cj4gKwlyZXR1
cm4gc3ZtX3JhbmdlX2lzX3ZtX2JvX21hcHBlZChwLCBzdGFydF91bmNoZywgKGVuZCAtIDEpID4+
IFBBR0VfU0hJRlQpOwo+ICB9Cj4gIAo+ICAvKioKPiBAQCAtMjkxMyw5ICsyOTU3LDkgQEAgc3Zt
X3JhbmdlX3NldF9hdHRyKHN0cnVjdCBrZmRfcHJvY2VzcyAqcCwgdWludDY0X3Qgc3RhcnQsIHVp
bnQ2NF90IHNpemUsCj4gIAo+ICAJc3ZtX3JhbmdlX2xpc3RfbG9ja19hbmRfZmx1c2hfd29yayhz
dm1zLCBtbSk7Cj4gIAo+IC0JaWYgKCFzdm1fcmFuZ2VfaXNfdmFsaWQobW0sIHN0YXJ0LCBzaXpl
KSkgewo+IC0JCXByX2RlYnVnKCJpbnZhbGlkIHJhbmdlXG4iKTsKPiAtCQlyID0gLUVGQVVMVDsK
PiArCXIgPSBzdm1fcmFuZ2VfaXNfdmFsaWQocCwgc3RhcnQsIHNpemUpOwo+ICsJaWYgKHIpIHsK
PiArCQlwcl9kZWJ1ZygiaW52YWxpZCByYW5nZSByPSVkXG4iLCByKTsKPiAgCQltbWFwX3dyaXRl
X3VubG9jayhtbSk7Cj4gIAkJZ290byBvdXQ7Cj4gIAl9Cj4gQEAgLTMwMTYsMTcgKzMwNjAsMTgg
QEAgc3ZtX3JhbmdlX2dldF9hdHRyKHN0cnVjdCBrZmRfcHJvY2VzcyAqcCwgdWludDY0X3Qgc3Rh
cnQsIHVpbnQ2NF90IHNpemUsCj4gIAl1aW50MzJfdCBmbGFncyA9IDB4ZmZmZmZmZmY7Cj4gIAlp
bnQgZ3B1aWR4Owo+ICAJdWludDMyX3QgaTsKPiArCWludCByID0gMDsKPiAgCj4gIAlwcl9kZWJ1
Zygic3ZtcyAweCVwIFsweCVsbHggMHglbGx4XSBuYXR0ciAweCV4XG4iLCAmcC0+c3Ztcywgc3Rh
cnQsCj4gIAkJIHN0YXJ0ICsgc2l6ZSAtIDEsIG5hdHRyKTsKPiAgCj4gIAltbWFwX3JlYWRfbG9j
ayhtbSk7Cj4gLQlpZiAoIXN2bV9yYW5nZV9pc192YWxpZChtbSwgc3RhcnQsIHNpemUpKSB7Cj4g
LQkJcHJfZGVidWcoImludmFsaWQgcmFuZ2VcbiIpOwo+IC0JCW1tYXBfcmVhZF91bmxvY2sobW0p
Owo+IC0JCXJldHVybiAtRUlOVkFMOwo+IC0JfQo+ICsJciA9IHN2bV9yYW5nZV9pc192YWxpZChw
LCBzdGFydCwgc2l6ZSk7Cj4gIAltbWFwX3JlYWRfdW5sb2NrKG1tKTsKPiArCWlmIChyKSB7Cj4g
KwkJcHJfZGVidWcoImludmFsaWQgcmFuZ2Ugcj0lZFxuIiwgcik7Cj4gKwkJcmV0dXJuIHI7Cj4g
Kwl9Cj4gIAo+ICAJZm9yIChpID0gMDsgaSA8IG5hdHRyOyBpKyspIHsKPiAgCQlzd2l0Y2ggKGF0
dHJzW2ldLnR5cGUpIHsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
