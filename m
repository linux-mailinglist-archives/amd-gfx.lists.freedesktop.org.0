Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F265E388D3F
	for <lists+amd-gfx@lfdr.de>; Wed, 19 May 2021 13:51:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C8E36ED7E;
	Wed, 19 May 2021 11:51:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2735F6ED7E;
 Wed, 19 May 2021 11:51:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJxsv4WkkA9/ijqa5wCtlkG+/4xyKLs8NDQj8Xn+878nkgk41Dfa9xbGXb1usnJZCZFYh4xEy41ubbKX16W9zvp360kCcF3FNVeImQQ4ZUAg4ZXSCtQWEptyQuxZs9qk4P5eHmCU7cAGJ4fAJBAJDNU7M2kdymqPE3dszEJSwJb66jk+j1EEVS9JWHoIQyn5SPKVnKpW09sMzLJmm24vjvVkn3dpWCObB3YSZy4JEuCg5W2jhfM23DqnPrX9qooghy7qOuZIlkBBlzuCijDESP+zoZzWYHBDnFUZq2ot4HpNtJ6AGkXYWHgcwK5ic+qhBO4IfGQbYsI7fXMkpcs/bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0y5ZqJA4NYAnKxeNnlY5B4SWNN+WOevSzVplNTKwosY=;
 b=VrMZOrYvtfwd3mtm8/0XfBxafQzfFYiI1oo5U9EgfYXo6zSuqbuTlnfzRvPnuqbFuQcFG3Av+ZnzXQhA/vk9No69l4dUgIKyjGzWcRTaK0Q/nNy1ifUWUjhMUhY/i9Za/mnuFqmLV0Qzq1UXuG5XOLWV7qG3NnJzxgdG34bYnqMx/uJV/9LbwK8zUwD1chDbtN4ySkfffaZFDLTaakr5AmhPQFVdDwRRNd5rexWsUsJlhRU4bI74e5uN3/5Ye73XB2z87DDcv05Vw2XREBKVWWjTaPr4LC34aG1ZRxEm2dxgsYjMLSccCWEMa7oXzVOx4WuAloWeRU8CztD+m0n5fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0y5ZqJA4NYAnKxeNnlY5B4SWNN+WOevSzVplNTKwosY=;
 b=YfSERqhRkrCJvWFnCGI4hkN8Bt8sDw3Y4ktcnuz5+0Qax6C+dWv5OmtX0NukSz9QgXZOUDZ+3G6N+jovtZ69sr7FLduuwRo6x/mDc5xKGo85L3sAJbJaFyekSwg28hgerykJOM4f+vvaopbHHyBPFBSNRvgD9y8EigubFT9W4C0=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4381.namprd12.prod.outlook.com (2603:10b6:806:70::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 19 May
 2021 11:51:14 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 11:51:14 +0000
Subject: Re: [PATCH v7 13/16] drm/scheduler: Fix hang when sched_entity
 released
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
 <20210512142648.666476-14-andrey.grodzovsky@amd.com>
 <9e1270bf-ab62-5d76-b1de-e6cd49dc4841@amd.com>
 <f0c5dea7-af35-9ea5-028e-6286e57a469a@amd.com>
 <34d4e4a8-c577-dfe6-3190-28a5c63a2d23@amd.com>
 <da1f9706-d918-cff8-2807-25da0c01fcde@amd.com>
 <8228ea6b-4faf-bb7e-aaf4-8949932e869a@amd.com>
 <ec157a35-85fb-11e5-226a-c25d699102c6@amd.com>
 <53f281cc-e4c0-ea5d-9415-4413c85a6a16@amd.com>
 <0b49fc7b-ca0b-58c4-3f76-c4a5fab97bdc@amd.com>
 <31febf08-e9c9-77fa-932d-a50505866ec4@amd.com>
 <cd6bbe33-cbc5-43cb-80f7-1cb82a81e65d@amd.com>
 <77efa177-f313-5f1e-e273-6672ed46a90a@gmail.com>
 <4a9af53a-564d-62ae-25e1-06ca4129857f@amd.com>
 <1622338a-d95a-fe13-e4a4-c99cb4a31f6c@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <bc94fbc3-8e02-c860-fc58-6301219b84e5@amd.com>
Date: Wed, 19 May 2021 07:51:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <1622338a-d95a-fe13-e4a4-c99cb4a31f6c@amd.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:1069:60ba:d67c:3ab3]
X-ClientProxiedBy: YTXPR0101CA0054.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::31) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:1069:60ba:d67c:3ab3]
 (2607:fea8:3edf:49b0:1069:60ba:d67c:3ab3) by
 YTXPR0101CA0054.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.30 via Frontend
 Transport; Wed, 19 May 2021 11:51:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33f16967-134f-41f8-eac3-08d91abc6767
X-MS-TrafficTypeDiagnostic: SA0PR12MB4381:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4381835AD9759407B4C83472EA2B9@SA0PR12MB4381.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rCZ1RDLllo2BTRQvvmedN4j89MJrlC32/bJbmzMrBCCndIUql9gjj9vqq5sCS3APxV6iLY5Dvk92dCV3p8RwbkNl+JN6UmnESpG8n9sFiXjxekgqWjfU8w3ZbsG6J+Zqo4Zfbop0ht6eaIRVCm7vwDrDy2qPE2Tj5TTtMZujO4nN0S2CUeTbrN9KaPnMqCzQO+sscQlKoLpTDZ8mBuz9hqAvUhTekC6kajDwWmI3dP9o3si4ctO98XJQ56dyKJXCDei5HovxEOoK90OBngtK+dBYaZw/YXfxzGLlPJ9eZO96yjT6xhImeDB66FKaa77vLL5pqUJfnKXoUrXOsyeJnBG9tneAAM473KrdE3kH7U/h9kgpmSiBJ3W3neIcFsogpm3F//KN5OFY7Q/QxxKxqu3Sz5yvAuWyLbBg9d++akjNE7oYj61ddMjsfSiB3+bUk5w8rThDQevLRRFxaIxJmyBpGrAqbPXU9ABAqMI4ewSKPiZmZQbM7RNeGcZaqphUTFvs3oDyUGPhO4c2UqRwPc1oUtZqmAVbp+XEo5Rts0OyzdAbogSQKiMR/JFzHJXPC9KVYxmB649vM8YknKAMLhzCZ/GDZ285iUQ343tCS/YY94VAxtgcyEqGcae3agfjJuv8yqz83IfY64Kh+oaP5SAitlZrwBD8DHWRZSsBUZBx3QFs+kVs4b4N0NYv22Sr46ixei5lQ86cXmn/guNhPT6dJEg4s/Z3I6XfDq+sA1A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(376002)(396003)(39860400002)(66556008)(66476007)(66946007)(8936002)(6486002)(4326008)(8676002)(6636002)(52116002)(86362001)(16526019)(53546011)(186003)(36756003)(38100700002)(31696002)(478600001)(44832011)(966005)(31686004)(2906002)(316002)(110136005)(66574015)(5660300002)(2616005)(83380400001)(45080400002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RytMUDF1Si84dkNzQWE0SUlRVE0zTjVRUnNOMW53QWJMOVFHYnpZTFNHeGo1?=
 =?utf-8?B?SGRyZk5pY2U0QnhqNld3UStPQUl3N3ROVXRvTFhvR2pheHk0c3RzTHlxSys2?=
 =?utf-8?B?MU9vZFNmR3V2aXkzcTVMZHhlQitEcHFOQ1B2WTM5VnAvVzVJZ25BaUd3RTRz?=
 =?utf-8?B?d0ZEUHhCaEw3M1djOUJNV3Zhd0UyTmYvRmk0cXpINjY1eDNQdlZwR3VkdjJo?=
 =?utf-8?B?cWxPb3dET0l2cmZ2YkFoTTlrOHVCbS9salVGaE1Rb1NhWVc3NkJMcnNvaWxK?=
 =?utf-8?B?VWNTRnFFa1RCdEQ2UkdVYTZPdHpyQ3ZJTEJKSW1Ec1ljVVhTY2dzeHZXS0hp?=
 =?utf-8?B?MHdwZytFUml4aElJcVozOXpIcHNzM05JTUplWVNidlJQczVsemJ4S05YYnZO?=
 =?utf-8?B?QWRnZGdaSGY1UU96Q1A0VjVoeVEwNzdMbzNGbUl4cE05TitiaGNBYW1IODlR?=
 =?utf-8?B?K0I1VjB3YndMSlRJUEdHdTQ0QktuRm16d3JPVDJxVzk2ZTgyMHVRUU4zbVdG?=
 =?utf-8?B?REtlR1BSVkVGM2VLVUI1b1BJeHR4VW40cldCY0xIOHRTQTluajQ2VTNWeldl?=
 =?utf-8?B?MVM3REpJUHQwbDdIak9BRkJ3MDRQdzhDV3lJeStOZ25FM2o3TE1VdVRaLzNy?=
 =?utf-8?B?aGI2cTliZGszOUx4N0ZQeUJidVZSelhvSWtLY0R3U2dVcjF0YmpLRHVPdUZM?=
 =?utf-8?B?ekNaaEl4Z0RSSUZnVm13L2Ftb1FBcUl2SXI1a0JoU1paWEp2UXZqYkpVS3I3?=
 =?utf-8?B?eFJYSElDMDB4NlF1ck1zVi9zOWFURnhHMUdyYmRLOHpaZVBYa2E5VXhKdGVO?=
 =?utf-8?B?ZUFnTXRTS25lcThCMG5oZ3VWbWQyUnluamZxb2xpbnkyMnJRd0VrcFppbTJV?=
 =?utf-8?B?c3pHWjZOOGRjRVhXMG0wQm5YMEhHTnF0c2wyK0ZoSDQ4NGJza2hnS2ZFYWRX?=
 =?utf-8?B?TnhZejY3N3Y0RmlWRnF2L0FMZldwblRQZUs1Yk0rTjBLcW9KVFk0eHB0Wjh3?=
 =?utf-8?B?bXpPM252VlJZQ0h6dGx5T29iM1dtamcyaEVoOUtFd1pRZTc3OXpKbWM4K1V4?=
 =?utf-8?B?dmJjR3g5VUhxN2xFZ3dycS8vam5UM29xT0c1dmwwQnBQZVZuNU9aenlCMVVR?=
 =?utf-8?B?TFBoWkhjYWNJOHUzTE82Z2c5RXdmbGE2ODhiNFl6Vkl6Z2YzVDhvVXdKd3Aw?=
 =?utf-8?B?ZDlqN203S3YzWlJMaWxIL2FhMGRHVjE2MmlJcDFtTmxOVkFKT29KRGdkTEFu?=
 =?utf-8?B?V3N2ZFN3bFFyNFJQbHViV0g2aWdVekIvdDJnMUVjMlFqaXlXU3dWd3FlQjEw?=
 =?utf-8?B?aDlFUytTenR6R0NiRGtrcDJBOGhvNU9PTk9uYkFWQy9rMWx0MDlVLzFHMjNU?=
 =?utf-8?B?Yk1kVnZuRE9McllhdWhMZDlkN3pPSUZNVzVXejRwdTVQZUVRZlphL2t5dWc0?=
 =?utf-8?B?TGFpd3VSU0pqeGZTLytnRDJVNzJlVW1qRnAydjF2cDNkQnUxd25jazlBcU1z?=
 =?utf-8?B?SjdlZWZ2bmlwNU1BcW4ybTlQalBsYzQ1M2cyOWdVNytlb2pWN0JRZFJYUmVD?=
 =?utf-8?B?ckRBN2RRUVVKV0dYMVV2MjBXMUFUcFQ5Tk9mS05zbzBrS1JadldHb0tBNGNm?=
 =?utf-8?B?QzVCLzd6ZnBpN1RWZ2lFOGNwOE5RUG1LZVcxaFljaUxPaWwyZnJ5UDVhcENx?=
 =?utf-8?B?TzBPekl2dGhtS0tvTzY3V3E0TGppZSszbFYzUDhsK2s4RTJJS1hCOWh3WGls?=
 =?utf-8?B?YUJPRVgwSmtBTWcvei9LRWhhQ0NLNElTSytPamQyTnZvbHJ5U0xNZUV0eUlm?=
 =?utf-8?B?WTJ0RUE4RlNnRnh4WklKVitmbmppeUpybWZJZHQvOEpvOWVYOWIxOC9FU0xR?=
 =?utf-8?B?TTRJL1FCUFBiZGF1ZGIwWHJkWWsvZlM2Ky95cU1VMy9FaHc9PQ==?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33f16967-134f-41f8-eac3-08d91abc6767
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 11:51:14.3741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5mkRqIK7BFxPg+sYaDsLZ1eC8WJWTZowXQlYgaj3kft+5tOKsheA7QhfK2c3BuSi4SGmWftrIRXBaeFWYe46Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4381
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, ppaalanen@gmail.com,
 helgaas@kernel.org, Felix.Kuehling@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

CgpPbiAyMDIxLTA1LTE5IDc6NDYgYS5tLiwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBbSAx
OS4wNS4yMSB1bSAxMzowMyBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pgo+Pgo+PiBPbiAy
MDIxLTA1LTE5IDY6NTcgYS5tLiwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+IEFtIDE4LjA1
LjIxIHVtIDIwOjQ4IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4gW1NOSVBdCj4+Pj4+
Pgo+Pj4+Pj4gV291bGQgdGhpcyBiZSB0aGUgcmlnaHQgd2F5IHRvIGRvIGl0ID8KPj4+Pj4KPj4+
Pj4gWWVzLCBpdCBpcyBhdCBsZWFzdCBhIHN0YXJ0LiBRdWVzdGlvbiBpcyBpZiB3ZSBjYW4gd2Fp
dCBibG9ja2luZyAKPj4+Pj4gaGVyZSBvciBub3QuCj4+Pj4+Cj4+Pj4+IFdlIGluc3RhbGwgYSBj
YWxsYmFjayBhIGJpdCBsb3dlciB0byBhdm9pZCBibG9ja2luZywgc28gSSdtIHByZXR0eSAKPj4+
Pj4gc3VyZSB0aGF0IHdvbid0IHdvcmsgYXMgZXhwZWN0ZWQuCj4+Pj4+Cj4+Pj4+IENocmlzdGlh
bi4KPj4+Pgo+Pj4+IEkgY2FuJ3Qgc2VlIHdoeSB0aGlzIHdvdWxkIGNyZWF0ZSBwcm9ibGVtcywg
YXMgbG9uZyBhcyB0aGUgZGVwZW5kZW5jaWVzCj4+Pj4gY29tcGxldGUgb3IgZm9yY2UgY29tcGV0
ZWQgaWYgdGhleSBhcmUgZnJvbSBzYW1lIGRldmljZSAoZXh0cmFjdGVkKSBidXQKPj4+PiBvbiBh
IGRpZmZlcmVudCByaW5nIHRoZW4gbG9va3MgdG8gbWUgaXQgc2hvdWxkIHdvcmsuIEkgd2lsbCBn
aXZlIGl0Cj4+Pj4gYSB0cnkuCj4+Pgo+Pj4gT2ssIGJ1dCBwbGVhc2UgYWxzbyB0ZXN0IHRoZSBj
YXNlIGZvciBhIGtpbGxlZCBwcm9jZXNzLgo+Pj4KPj4+IENocmlzdGlhbi4KPj4KPj4gWW91IG1l
YW4gc29tZXRoaW5nIGxpa2UgcnVuIGdseGdlYXJzIGFuZCB0aGVuIHNpbXBseQo+PiB0ZXJtaW5h
dGUgaXQgPyBCZWNhdXNlIEkgZG9uZSB0aGF0LiBPciBzb21ldGhpbmcgbW9yZSA/Cj4gCj4gV2Vs
bCBnbHhnZWFycyBpcyBhIGJpdCB0byBsaWdodHdlaWdodCBmb3IgdGhhdC4KPiAKPiBZb3UgbmVl
ZCBhdCBsZWFzdCBzb21lIHRlc3Qgd2hpY2ggaXMgbGltaXRlZCBieSB0aGUgcmVuZGVyaW5nIHBp
cGVsaW5lLgo+IAo+IENocmlzdGlhbi4KCllvdSBtZWFuIHNvbWV0aGluZyB0aGF0IGZpbGwgdGhl
IGVudGl0eSBxdWV1ZSBmYXN0ZXIgdGhlbiBzY2hlZCB0aHJlYWQKZW1wdGllcyBpdCBzbyB3aGVu
IHdlIGtpbGwgdGhlIHByb2Nlc3Mgd2UgYWN0dWFsbHkgbmVlZCB0byBleHBsaWNpdGx5IGdvCnRo
cm91Z2ggcmVtYWluaW5nIGpvYnMgdGVybWluYXRpb24gPyBJIGRvbmUgdGhhdCB0b28gYnkgaW5z
ZXJ0aW5nCmFydGlmaWNpYWwgZGVsYXkgaW4gZHJtX3NjaGVkX21haW4uCgpBbmRyZXkKCj4gCj4+
Cj4+IEFuZHJleQo+Pgo+Pgo+Pj4KPj4+Pgo+Pj4+IEFuZHJleQo+Pj4KPj4+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+PiBhbWQtZ2Z4IG1haWxpbmcg
bGlzdAo+Pj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4+IGh0dHBzOi8vbmFtMTEu
c2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmxpc3Rz
LmZyZWVkZXNrdG9wLm9yZyUyRm1haWxtYW4lMkZsaXN0aW5mbyUyRmFtZC1nZngmYW1wO2RhdGE9
MDQlN0MwMSU3Q2FuZHJleS5ncm9kem92c2t5JTQwYW1kLmNvbSU3Q2NlMTI1MmU1NWZhZTQzMzg3
MTBkMDhkOTFhYjRkZTAxJTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdD
MCU3QzYzNzU3MDE4NjM5MzEwNzA3MSU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1D
NHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0Ql
N0MxMDAwJmFtcDtzZGF0YT12R3F4WTVzeHBFSWlRR0ZCTm4yUFdrS3FWanZpTTI5cjM0WWp2MHd1
amY0JTNEJmFtcDtyZXNlcnZlZD0wIAo+Pj4KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4Cg==
