Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5D938AD90
	for <lists+amd-gfx@lfdr.de>; Thu, 20 May 2021 14:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 227736F43D;
	Thu, 20 May 2021 12:05:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2082.outbound.protection.outlook.com [40.107.96.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 224806F43D;
 Thu, 20 May 2021 12:05:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgHNW6OS11mqr13Azx9He9D7F4bwcsp0VOJRNIrSI+W/K6QGpjXk9vfZkAAmi/tHVxqRdVo0N0+ZL0uBlcUvzcf2rUpmPOWbI7LRlPojNrF6Ey1kdG2z0kDNM0WLLdIJNO/NITYdhTptlamq4VZgv+NCzvrzvs/MapqEifIPWCYI37+ayf1S0z9i9BFnKadmn2EaFJSlnl+ZxCQ08rQwlmcr+S8EVm17Rgs+CAk9ZvjQ0EoCz+2kLvVL0wRXHHmwva87tlWNCklItob76IcC1cJ6WJ1JpB0itlRCPU2I2pqUxJxwap5GeU7Slss675622Ksu7NuQ+bmr5TaUrAU6lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3wVp/R2XonmvCaDNXNHM46VljccrqXEN4yR1X43KDo=;
 b=jkP8XeVs/8Oko8lSm+KH9EbGhlF3jmLcwEm8iWeXrwN45YyTx1aQDlmw7a/RkqscAoHRgZZbWmr790CtOLuDiJTI2pCLaxCWuMwvy64rLNMilkRufti6/Vz9zUesk2mSujKyqAwq7dTR3r2JKOU4jG421DXFNU+/cgoY/CkeJ2I9Bc4yVXODoyavmNqGXgx6V66H95qYXAmiVPojOxTwukKFJc2ZOVhe3DoW0jDul/JBRET1/2bKT4S4EvJ0Y7bZJDPNbI3PKNQY3+K7A1tzlyKCebotB4fQVza5B7ePg3XBa1KHDMxXm9sD4Og73snSS50l/ehPgjIu8MvZ4cbOOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3wVp/R2XonmvCaDNXNHM46VljccrqXEN4yR1X43KDo=;
 b=5I5mlgebduupsiVuzOU25nONg9RJTjirPKFuxd/y9lSktl9dfRgmZ215dojcXvo2Z4I10FBXNYr91hOeju8uYxgx9hI2esNgWjLF5cUbmnGL2jgIY/ISK8SOuLbTwQOErh6npC+xm10wYRSFqZG9VmDs4jTuWIkJDOB8LjKYQmo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4392.namprd12.prod.outlook.com (2603:10b6:208:264::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Thu, 20 May
 2021 12:05:52 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4150.023; Thu, 20 May 2021
 12:05:52 +0000
Subject: Re: [PATCH 20/38] drm/radeon/radeon_vm: Fix function naming
 disparities
To: Lee Jones <lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
 <20210520120248.3464013-21-lee.jones@linaro.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c2b7cf7c-0b37-3581-4a9c-368ca0b89a36@amd.com>
Date: Thu, 20 May 2021 14:05:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210520120248.3464013-21-lee.jones@linaro.org>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:4635:589e:67a4:e02a]
X-ClientProxiedBy: AM0PR10CA0023.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::33) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:4635:589e:67a4:e02a]
 (2a02:908:1252:fb60:4635:589e:67a4:e02a) by
 AM0PR10CA0023.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.33 via Frontend
 Transport; Thu, 20 May 2021 12:05:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37e8ccbe-7440-4fca-cb2e-08d91b879d47
X-MS-TrafficTypeDiagnostic: MN2PR12MB4392:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB439219002E7B788167DC7AE7832A9@MN2PR12MB4392.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eRYukHiiSkCQSxQInRNXDDs+4W55JfgYX4oCPvkbq/tI7zryrsV4LpGvKsbF9IZ1fTqA1rx84WfnVncwt6yQvUpqA9ruYIfnnaQanOqhxI6fNc4JO65AerEUCOs2j31X4hiHPld8gf8hvYef/2F7Knehu3i1dq32NQQ05mlDPiRmouuq/5/QxnkZDwBWVC0oyhU4CTvN3qxCqk9AXuZUTCuot/fzbr331m+AsehvWTEtdiAifMkRy4XWBBywdPQY0kzDb0VMuqHzu3IAuUvafs5kvgZZt9/0Du71ApLX2kNutDiBXFn3I+ne2uGTHT2H8JTi85jf9gGQhoqj7/MhaE/Z5ctvLW7YDkvhutWblF43kKQPFFooZQHcy6xeg3lPpOFEJMfvKQXXsiPE2ZpLmHOJn1uJ9EkThpdE3ecOlQaA1EtJhLTZmIhlGAXIEcLXRw2OFWmttbf5+vC6Dt4eKl8fYRtCm/ukZpBR6GTmX+triPSeTkko1GhYY/ONZhTA73RnBpqeUta8AETP8OQyUalo+VrnpijfQ/1+rpAAkxm5HT4KovnKIhaxpuTMUT+8sVF+FQ1M6pEGmUVhQ11DdJqC1MerZVv9foWQ7KhmQOfMGgkqXG/vfUiidEYgHUpU+M5abWD/JGtAyloYgOgun3xejgE2W51BVc9t4s895mx1ZQFjIa45oPpHBQ7neIHl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(2616005)(38100700002)(478600001)(5660300002)(83380400001)(8936002)(186003)(2906002)(4326008)(31696002)(16526019)(54906003)(66946007)(66556008)(66476007)(6916009)(36756003)(52116002)(31686004)(86362001)(6486002)(316002)(8676002)(66574015)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZWoyYlNROGJhbjJEZ3Z3NE9rangxbnhoZmtEcmRiUWViODZsanE4Tk5HMXN0?=
 =?utf-8?B?ems3ZXVtN0IvY1lFTEw1VkU1OE1RNklxbllxbGFsVTg4UkxRdy9lQjB4VFJN?=
 =?utf-8?B?Nllzd0xOT0Z1VWlSb0Q1L1ZBZWhNQVZrNUlGNWZ1UGlaZFE0UW1saHhGQTFC?=
 =?utf-8?B?eC8yUWh2dlBjcVJnNFZrdnZNK1lyMCttTzg3RDlkeHl3Y3FDVkc1cjR0Q3dH?=
 =?utf-8?B?Y29kdURNdE9kM2RCZ2J4enNtSGNhQnk3aXpPelBUZjNnN0JPRDJKRVZwdFJN?=
 =?utf-8?B?WWJaMkhDN25lU0pYK3UzUWRpeVh1WkI5ZkxyVVJXN2paam9FaWhYUWRNZERw?=
 =?utf-8?B?R21SdWxib2s4aFM5b2wzV2dqRTNjVlJlRlZUTDl4V1lrSnJQeXJ1akt5cFRK?=
 =?utf-8?B?L1BTbHhrTUw5enJDZEs4SnFZRW9tckFoekZWRFBvVWZzeUJ5aWxsNnlHc2ls?=
 =?utf-8?B?TVp0aHB6Y2lWVGgrMTZQelNNb2p5V0NKUlZJa3AydjgyQmp3TFBUTVN6emFW?=
 =?utf-8?B?V2N4Q1BLSGJqQ3BnK3JIMStKcktNYmdaeUhxcGcveG9Mc0Z4TVlIU1N3bkJB?=
 =?utf-8?B?TGI3ZjVZZSt1M3VDK1VoL2FNNmJYYjNOdUtRYy81QjF0MmtCTjNFREhjVUt5?=
 =?utf-8?B?eVlGc1liR1Vjbm5Pa0x1dmZ1a2Y3UDc1ajdGa1Qyb2JwK3JXOE5DdTZyWkFp?=
 =?utf-8?B?ZG1RSW13cnpwekwyN3RzeUcyQnJGNmNKOFprOEJvRjlaNEJQck9kbVR2blR0?=
 =?utf-8?B?UVZlelJFNFNyUkJtelA3T0gxRlkxWFdIaGI3aEVnRm5OLytiWWJNcllLY1hJ?=
 =?utf-8?B?ZlpMUGNSRGJ6K3hEU3V0RmZ3UVVnKzVGejB6aVY4SVRLQkdxU3RxK2dPbFNF?=
 =?utf-8?B?NDNUcjlVRXZhRDg0YXZTU3dTMTdQeER3OGpsUTBPQnhVYkRSWk93d1g4ekxn?=
 =?utf-8?B?dFRMcUtrRGZmbzJvbjh2SXBHNlFjTFRHcWhKZk4wM0ZOejViOHVCeXhBOHlL?=
 =?utf-8?B?UHU3a0hPV3k0MVNma2l1Y241MmFDYnBaWTNHWUxLK0QyTFA5QWdGNjltRmFU?=
 =?utf-8?B?VlRqaExJUWVWZTJiR2hvUkgyMEZCeFpZaFp2bURnTEh2a0pNYWZib0JMVk13?=
 =?utf-8?B?N0NkYklxM1A5eTViRHBucUw4RWpiNDBIK09SQTF4akJ6dExYSEFRK0ZjZWRS?=
 =?utf-8?B?TWlRVjk0RHFHdDNTWDZDNFlBbE9WUHkwbDN4NWxEUnliUXJtNHRBMk8yN285?=
 =?utf-8?B?MGFrTXRIbHkrT0lkZzFBbmVGUCtXZUhzUUFxNnNFeEU5c1h3Z1g4akRuSkd3?=
 =?utf-8?B?Vmp1QWhyYSt3UHJvNVRoVVRSbnNzdDlpcFBUUytUckdvL0RCcG5hdGI1Ry9y?=
 =?utf-8?B?b1lsM1NrNjZrdWRtMDl1ZEhZWE9hbHc2eGNaSHpVWWM3UGpuOVVhRlV5d2Vr?=
 =?utf-8?B?R2FVTnJISzE4c2kycUdTZVRlYVVnQTlrUzhBMHpCZE1pL2JHWG9McVdCdnZK?=
 =?utf-8?B?c3RQTkszblBycGdVU2MvMHJHZzRCY3pSNU9aLzl5azQvWEc1UFl0WFRzUG5U?=
 =?utf-8?B?V2FXZ2RzeStSR3NraHlZTnRhdlhNNTdSeTMzeVJ2a2poQ3dSQ0Q3ajdMM09Z?=
 =?utf-8?B?bXdJMXIxUWJZbWluZ09seHNPais2TWdEdDUyZHJveWFWVW1VZHZyb000TlRK?=
 =?utf-8?B?UjVyME5mZzMvYW9ITjVHZUhWMHVIQm5rZnRjYWJHMHdQcWhDT21WNk9ZbnRQ?=
 =?utf-8?B?Mml1OEJkR1JLYVJDd1JjZzZnd1plNS9yc1pzRVBWSDMzdm1CUWFSK3REL3h1?=
 =?utf-8?B?UkQxUEZQZnlCNTJSUGRDV3hxRDR3b0t4REtPRWozbEU0Y0tpS0tZU0M0TlBy?=
 =?utf-8?Q?cWwjwQLagGbrq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37e8ccbe-7440-4fca-cb2e-08d91b879d47
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 12:05:52.5547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t6gIgAcAjUfdue6HMv3dRJIMomilw/lgR1T9kgArCUpt7i2snkI3Av8IMkXwKU7K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4392
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjAuMDUuMjEgdW0gMTQ6MDIgc2NocmllYiBMZWUgSm9uZXM6Cj4gRml4ZXMgdGhlIGZvbGxv
d2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4KPiAgIGRyaXZlcnMvZ3B1L2RybS9y
YWRlb24vcmFkZW9uX3ZtLmM6NjE6IHdhcm5pbmc6IGV4cGVjdGluZyBwcm90b3R5cGUgZm9yIHJh
ZGVvbl92bV9udW1fcGRlKCkuIFByb3RvdHlwZSB3YXMgZm9yIHJhZGVvbl92bV9udW1fcGRlcygp
IGluc3RlYWQKPiAgIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3ZtLmM6NjQyOiB3YXJu
aW5nOiBleHBlY3RpbmcgcHJvdG90eXBlIGZvciByYWRlb25fdm1fdXBkYXRlX3BkZXMoKS4gUHJv
dG90eXBlIHdhcyBmb3IgcmFkZW9uX3ZtX3VwZGF0ZV9wYWdlX2RpcmVjdG9yeSgpIGluc3RlYWQK
Pgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJD
aHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZpZCBB
aXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpv
bmVzQGxpbmFyby5vcmc+CgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9u
X3ZtLmMgfCA0ICsrLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25f
dm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3ZtLmMKPiBpbmRleCAyZGM5Yzlm
OTgwNDliLi4zNmEzOGFkYWFlYTk2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcmFkZW9uX3ZtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl92bS5j
Cj4gQEAgLTUxLDcgKzUxLDcgQEAKPiAgICAqLwo+ICAgCj4gICAvKioKPiAtICogcmFkZW9uX3Zt
X251bV9wZGUgLSByZXR1cm4gdGhlIG51bWJlciBvZiBwYWdlIGRpcmVjdG9yeSBlbnRyaWVzCj4g
KyAqIHJhZGVvbl92bV9udW1fcGRlcyAtIHJldHVybiB0aGUgbnVtYmVyIG9mIHBhZ2UgZGlyZWN0
b3J5IGVudHJpZXMKPiAgICAqCj4gICAgKiBAcmRldjogcmFkZW9uX2RldmljZSBwb2ludGVyCj4g
ICAgKgo+IEBAIC02MjYsNyArNjI2LDcgQEAgc3RhdGljIHVpbnQzMl90IHJhZGVvbl92bV9wYWdl
X2ZsYWdzKHVpbnQzMl90IGZsYWdzKQo+ICAgfQo+ICAgCj4gICAvKioKPiAtICogcmFkZW9uX3Zt
X3VwZGF0ZV9wZGVzIC0gbWFrZSBzdXJlIHRoYXQgcGFnZSBkaXJlY3RvcnkgaXMgdmFsaWQKPiAr
ICogcmFkZW9uX3ZtX3VwZGF0ZV9wYWdlX2RpcmVjdG9yeSAtIG1ha2Ugc3VyZSB0aGF0IHBhZ2Ug
ZGlyZWN0b3J5IGlzIHZhbGlkCj4gICAgKgo+ICAgICogQHJkZXY6IHJhZGVvbl9kZXZpY2UgcG9p
bnRlcgo+ICAgICogQHZtOiByZXF1ZXN0ZWQgdm0KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeAo=
