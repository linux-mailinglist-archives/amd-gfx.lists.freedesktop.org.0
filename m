Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D532D328E
	for <lists+amd-gfx@lfdr.de>; Tue,  8 Dec 2020 20:11:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B163C6E951;
	Tue,  8 Dec 2020 19:11:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB986E951;
 Tue,  8 Dec 2020 19:11:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YvDR9cMC/Xp+ddaJ05c2BS431LYNNONZ0s5fLEreYxeoKy+7nmamjQucCzQ+OqpgjOokDR79vPIUDijQ0+5tPgXPwl4ma9YfLIQNBlC/J2TCP/N22NyoyZ+jYq0iEOdlLvheLY7jfQLZOwHAqMOatWBts8gpdFvFUKWerVYE1IeY92hPXhEYnzSNAFxspvkDeYmoCliYhJfLOSLswLg529WUpu7C1RbZBNxjbA4zHZNKIrnIiz91I/El8lZUxEom7RC1TR2e0cDZtJJMczP1+hgf7yQo1sxoI4ztKt2tOm+Ykv8Q6PeUik9BhMiYED9XDGmizCpPz7lbXv9E9c9p6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OAJBFehqCzKDr8nhBiZ0ciGJsEBYn29Syab6YbVpZ9Y=;
 b=SkCSHr2JlB7r5UFXdU9bv4qNoacpGe3vLKiLyhmYfc6rBeHgh1I2qcOCJaigyNVncUnJdXM3hPggeOh/VzbXm1n1pxTufkAMrwtRUM0VuenFQ5WNmNG/MEQjvVgXoN6OyHBbagRRQODJk7nN5MZtOtPQSHBG4zhfWWWZUOHTUHKOkNbrZB7oINA86mjPYKJ+oBnh9mUOrv7kghHxlkW4dz6N9EfN0fb8tI5+sjW6bevKvEceCSmeThN+e91zBtu+0TvFShQLwuQryBRVrhHJ9uKLMG85ZZ2AkBVmbKSxKcT4GELp84KryJhTU0uHonck0rWsJx37bch8WK3KPztXhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OAJBFehqCzKDr8nhBiZ0ciGJsEBYn29Syab6YbVpZ9Y=;
 b=KNpbAop29c8awhV1q/ceiFtbQezi84ylw76XTZw7yst9HoHrpcLk4U/34bItbhhEeoKdWl/hfBm1IAurx7JVx07sHWcMvYRgqDPH7WMCc8054UhdMTROm7UlzhjcXmLpvXz/n0yyl+kFwxhmeFyjJ4wF6nMyY6r39o7G/Hyurzk=
Authentication-Results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB2858.namprd12.prod.outlook.com (2603:10b6:5:182::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.22; Tue, 8 Dec 2020 19:11:43 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435%9]) with mapi id 15.20.3632.023; Tue, 8 Dec 2020
 19:11:43 +0000
Subject: Re: [PATCH] drm/amdgpu: Initialise drm_gem_object_funcs for imported
 BOs
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
References: <1607447432-28982-1-git-send-email-andrey.grodzovsky@amd.com>
 <76baebc8-6fd3-6b28-8c62-bd049875a8c5@gmail.com>
 <dde83a65-07ae-2285-9999-a5c0f09dc1d3@amd.com>
 <e1cd7521-a9ac-0830-8be9-c03838c151bc@amd.com>
 <3ac4b80b-5eeb-fd80-c458-98539c075424@amd.com>
 <1ad9ddd5-560c-842e-3eea-f09663ea1b60@amd.com>
 <1b93677a-b8d0-1c28-eb2e-d1a341e2c93e@amd.com>
 <db589fbc-7242-e67c-1d22-c2e258b16e5c@amd.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <0fb30648-762e-4d05-1aac-90107be4c67e@amd.com>
Date: Tue, 8 Dec 2020 14:11:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <db589fbc-7242-e67c-1d22-c2e258b16e5c@amd.com>
Content-Language: en-US
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0010.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::23)
 To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.231.243] (165.204.55.251) by
 YT1PR01CA0010.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Tue, 8 Dec 2020 19:11:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ec81f8a6-1bf8-4a76-de8b-08d89bad19a8
X-MS-TrafficTypeDiagnostic: DM6PR12MB2858:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB2858C9FF9A4C26BFC88DC714EACD0@DM6PR12MB2858.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yDf/lzW+mjvBjpsDi2KUwPCgKL7VLiH3Z7/+bG1Jwdl5krbNngdPNqvbbdSlGg+5Ph0sYuyA8RMH9r0XwuhzzVTCGiu5Gm6MlJ7RJVmYzqVCyInhvWcr8GSbk/C+miRPy+ykJsiuXs0lySIM4yuaFtXZX5PX841UUXvXAza0Dhacvr4EZQYjZGYv0LGZ4vIfoL3KmWVuKNsSUKH87GUS6Ig7QQKhpF28TkKMuaV469JF7cBA5mV+YhK5+j2ifu1XRcfF0EEx8l1gsvPdcIfdkyGmK2lNj4KGlYipaZth43VPOvRpzNNmucFTsELcjThMl4JF8ObvTZVS9Eg5OZlxjP2Qh3I98Svpzf2gOLPq+rzbXPgC49ke1KslCGSspwDsVho+oHyZBdnJDvhS8vxThhgXyPNiyaOqqCMppB8C0nQ1V93zDo5PEFdCyqdYmpkr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(136003)(31686004)(4326008)(66946007)(8936002)(66476007)(66556008)(5660300002)(508600001)(83380400001)(34490700003)(53546011)(6486002)(956004)(86362001)(16576012)(26005)(2616005)(36756003)(8676002)(186003)(52116002)(2906002)(31696002)(16526019)(66574015)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YnpQSFZ1N1BCVU1aM2kyQ0wzYTF6amVGbmdQUUgzVENyYUN6TXh6Y2s2Wlhk?=
 =?utf-8?B?RHJjZFhUcFgzbU5MZ1Nja1ptc1Q5TEJ2YUo3d2ZxVFMwZURjVGlvV01sZ3hn?=
 =?utf-8?B?cHFTUjByVWFHVVI0YTd5OHN1aVV4b3FtUk8xbW1JZGZNRGdlS0NldXpDZm4x?=
 =?utf-8?B?Sm1ISWRXekpnVmU0Z3pWTTZ0SjJsR2Rxa29UUEJyZWJRNENlQjEwOW40ZkM1?=
 =?utf-8?B?bEgyWDBWUnlFU25WUGo0MGpDVlBlMXNDRGF1R25qeDlCK25zQS9Ca2NrZWpv?=
 =?utf-8?B?TFR4TmY4UWlUTTgrd09OTmNRUHZRNGM5czFYYVg0eXVNeE04Tnp0LzJocnV1?=
 =?utf-8?B?cmtYLzloc0dYeWl0Vk9qUEFlTGlqWnZXOFdpbG9FRHNCVXEwMkdkWjlhM2lq?=
 =?utf-8?B?SC9PSkJpTmErNzF5SDQvL3dSYTVjdlhyMTA2bi9nY0tuT0hINW16TG55ZUdK?=
 =?utf-8?B?cWtybVFOSSszMC9hNWxBVGRoaVVwMU9IRUdPQ1RWa2g2N2YxZm5SQnVEZkJH?=
 =?utf-8?B?VCtaSDdTTnd1M3BJZ3ZQZFlhdW43d2FtcERnaUpncGZnVjViR2JEa2VwdVgz?=
 =?utf-8?B?ekt2NjJXTExtRjRnQTNvbDBRWExXTHFqVndwR0wxK29vY3AwVXpiWVRoMFFB?=
 =?utf-8?B?aXM4UjVMU0lOY1A2Q01qaXd1SXVqNEtNZXZaWHNwZ2cyeEVNUE93c3Uvd2p4?=
 =?utf-8?B?VVZReThITG5CQlB2ZXV5UG5YMFVHdkI4NDhrSExrWlNNOC92L2JDUmdsK0lw?=
 =?utf-8?B?R25oSHZqOVhuVjR6Zm1zeURadkdOa0pGQVdtUVRhVmwwZGhIa0tBNjd0TEdT?=
 =?utf-8?B?Q2VxczViTlBnUzlkc2RVdFVQTXM3SEZIakVyYWYzNDFjWkJwSUFJd1FJTmY2?=
 =?utf-8?B?M2lFZm4yQlJFRytaVisvaUNxWXk0Uy9rQU1jeUs4aThCeFVHeGsvL0lLcXRE?=
 =?utf-8?B?cExvcFlQSWgyZnRGM0NUeEtGQWM1d3VYaktPTGtoRVZIbzl1VzZuWmFlVW83?=
 =?utf-8?B?L3VxLzVaZUg5QTc2NzRCQXI0UmRlamRubWNVTXppeTBuUEk3R1RjZHNLN21o?=
 =?utf-8?B?dTVTeElwVGFEek5nUzF5anhWbk5wczVMUkJtUFMvcTV6MkI0bTRlSVJmeGtB?=
 =?utf-8?B?NnFUdzY2aG0rUXJtd0kxL3FkL3RkbTMwM3lXV2M1RkoxK1FldFNYbDdWZnNN?=
 =?utf-8?B?VFhwVmVUb1ZDSE5pSG1nSjRXRnl5RWNHVHEvVkpZM0E1Z3JqMzBwVzArZnJv?=
 =?utf-8?B?YUVVbWZ1MG5MTmlTUEVtbDROdFR1eUpUUCs2ZnlVcUZJM29KdTdwOWpCZDlE?=
 =?utf-8?Q?7itu6R0SSxNUuLHw8gvuXTNBRkHbFF9G8a?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4340.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 19:11:43.4014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: ec81f8a6-1bf8-4a76-de8b-08d89bad19a8
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wT/8pGqU4WXJ6gQoX6NV0eJ/nH27flz4SxuTuPHfntJhrqbWlBD19irlkLPfwpln/856308rzAGv/pkI1Lh0tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2858
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
Cc: Alexander.Deucher@amd.com, tzimmermann@suse.de,
 amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Ck9uIDEyLzgvMjAgMjowMSBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBbSAwOC4xMi4y
MCB1bSAxOTo1MiBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pgo+PiBPbiAxMi84LzIwIDE6
NDcgUE0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+PiBBbSAwOC4xMi4yMCB1bSAxOTo0NCBz
Y2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pj4+Cj4+Pj4gT24gMTIvOC8yMCAxOjI5IFBNLCBD
aHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+PiBBbSAwOC4xMi4yMCB1bSAxOToyNiBzY2hyaWVi
IEFuZHJleSBHcm9kem92c2t5Ogo+Pj4+Pj4KPj4+Pj4+IE9uIDEyLzgvMjAgMTI6MzYgUE0sIENo
cmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+Pj4+Pj4gQW0gMDguMTIuMjAgdW0gMTg6MTAgc2Nocmll
YiBBbmRyZXkgR3JvZHpvdnNreToKPj4+Pj4+Pj4gRm9yIEJPcyBpbXBvcnRlZCBmcm9tIG91dHNp
ZGUgb2YgYW1kZ3B1LCBzZXR0aW5nIG9mIAo+Pj4+Pj4+PiBhbWRncHVfZ2VtX29iamVjdF9mdW5j
cwo+Pj4+Pj4+PiB3YXMgbWlzc2luZyBpbiBhbWRncHVfZG1hX2J1Zl9jcmVhdGVfb2JqLiBGaXgg
YnkgcmVmYWN0b3JpbmcgQk8gY3JlYXRpb24KPj4+Pj4+Pj4gYW5kIGFtZGdwdV9nZW1fb2JqZWN0
X2Z1bmNzIHNldHRpbmcgaW50byBzaW5nbGUgZnVuY3Rpb24gY2FsbGVkCj4+Pj4+Pj4+IGZyb20g
Ym90aCBjb2RlIHBhdGhzLgo+Pj4+Pj4+Cj4+Pj4+Pj4gQ2FuIHlvdSBvdXRsaW5lIHdoeSB3ZSBj
YW4ndCB1c2UgYW1kZ3B1X2dlbV9vYmplY3RfY3JlYXRlKCkgZGlyZWN0bHk/Cj4+Pj4+Pj4KPj4+
Pj4+PiBJIG1lYW4gd2UgaGF2ZSBhIGJpdCBvZiBleHRyYSBlcnJvciBoYW5kbGluZyBpbiB0aGVy
ZSBhbmQgd2UgbmVlZCB0byAKPj4+Pj4+PiBncmFiIHRoZSByZXN2IGxvY2sgYW5kIHNldCB0aGUg
ZG9tYWlucyBhZnRlciBjcmVhdGlvbiwgYnV0IHRoYXQgCj4+Pj4+Pj4gc2hvdWxkbid0IG1hdHRl
ciBhbmQgSSBkb24ndCBzZWUgd2h5IHRoYXQgc2hvdWxkIG5vdCB3b3JrLgo+Pj4+Pj4KPj4+Pj4+
Cj4+Pj4+PiBPbiB0b3Agb2Ygd2hhdCB5b3UgbWVudGlvbmVkIHlvdSBhbHNvIGhhdmUgYnAuZG9t
YWluL2JwLnByZWZlcnJlZF9kb21haW4gCj4+Pj4+PiBiZWluZyBzZXQgZGlmZmVyZW50bHkgc28g
eW91IG5lZWQgdG8gYWRkIGFub3RoZXIKPj4+Pj4+IGFyZ3VtZW50IHRvIGFtZGdwdV9nZW1fb2Jq
ZWN0X2NyZWF0ZSB0byByZWZsZWN0IHRoaXMgZGlmZmVyZW5jZSB3aGljaCAKPj4+Pj4+IGNsdXR0
ZXJzIGV2ZW4gbW9yZSB0aGUgYWxyZWFkeSBjbHV0dGVyZWQgYXJndW1lbnQgbGlzdC4KPj4+Pj4K
Pj4+Pj4gVGhhdCBzaG91bGQgYmUgb3V0c2lkZSBvZiB0aGUgY2FsbCB0byBhbWRncHVfZ2VtX29i
amVjdF9jcmVhdGUoKSwgc2ltaWxhciAKPj4+Pj4gdG8gaG93IGl0IGlzIG91dHNpZGUgb2YgdGhl
IGFtZGdwdV9ib19jcmVhdGUgY3VycmVudGx5Lgo+Pj4+Cj4+Pj4KPj4+PiBTbyB5b3UgYWdyZWUg
d2UgaGF2ZSB0byBhZGQgYW5vdGhlciBhcmd1bWVudCB0byBhbWRncHVfZ2VtX29iamVjdF9jcmVh
dGUgCj4+Pj4gKGUuZy4gdTMyIHByZWZlcnJlZF9kb21haW4pIHdoaWNoIHdpbGwgYmUgMCBmb3Ig
YW1kZ3B1X2RtYV9idWZfY3JlYXRlX29iago+Pj4+IGFuZCBlcXVhbCB0byBpbml0aWFsX2RvbWFp
biBmb3IgYWxsIHRoZSBjb2RlIHBhdGggY3VycmVudGx5IGNhbGxpbmcgCj4+Pj4gYW1kZ3B1X2dl
bV9vYmplY3RfY3JlYXRlID8KPj4+Cj4+PiBObywgSSBqdXN0IGRvbid0IHNlZSB0aGUgbmVlZCBm
b3IgdGhhdC4gV2UgbmVlZCB0byBvdmVyd3JpdGUgdGhlIHByZWZlcnJlZCAKPj4+IGRvbWFpbiBh
ZnRlciB0aGUgZnVuY3Rpb24gY2FsbCBhbnl3YXkuCj4+Pgo+Pj4gRE1BLWJ1ZiBpbXBvcnRzIGFy
ZSBjcmVhdGVkIHdpdGggdGhlIGluaXRpYWwgZG9tYWluIENQVSBhbmQgdGhlbiBnZXQgdGhhdCAK
Pj4+IG92ZXJ3cml0dGVuIHRvIEdUVCBhZnRlciBjcmVhdGlvbi4KPj4+Cj4+Pj4KPj4+Pgo+Pj4+
Pgo+Pj4+Pj4gUmVnYXJkaW5nIHRoZSBleHRyYSBlcnJvciBoYW5kbGluZyAtIHlvdSBoYXZlIHRo
ZSAncmV0cnknIGRhbmNlIGluIAo+Pj4+Pj4gYW1kZ3B1X2dlbV9vYmplY3RfY3JlYXRlIHdoaWNo
IGp1bXBzIGJhY2sgdG8gdGhlIG1pZGRsZSBvZiBhbWRncHVfYm9fcGFyYW0KPj4+Pj4+IGluaXRp
YWxpemF0aW9uIGJ1dCB5b3UgZG9uJ3QgaGF2ZSBpdCBpbiBhbWRncHVfZG1hX2J1Zl9jcmVhdGVf
b2JqIHdoaWNoIAo+Pj4+Pj4gYWxzbyBjb21wbGljYXRlcyB0aGUgcmV1c2Ugb2YgYW1kZ3B1X2dl
bV9vYmplY3RfY3JlYXRlIGFzIGlzLgo+Pj4+Pgo+Pj4+PiBSZWdhcmRpbmcgdGhlIGV4dHJhIGVy
cm9yIGhhbmRsaW5nLCB0aGF0IGtpY2tzIGluIG9ubHkgd2hlbiAKPj4+Pj4gQU1ER1BVX0dFTV9D
UkVBVEVfQ1BVX0FDQ0VTU19SRVFVSVJFRCBpcyBzcGVjaWZpZWQgYXMgZmxhZ3Mgb3IgCj4+Pj4+
IEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0gYXMgaW5pdGlhbCBkb21haW4uIE5laXRoZXIgaXMgdGhl
IGNhc2UgaGVyZS4KPj4+Pgo+Pj4+Cj4+Pj4gWWVzLCBzdGlsbCwgaXQgbWFrZXMgbWUgYSBiaXQg
dW5jb21mb3J0YWJsZSByZWx5aW5nIG9uIGludGVybmFsIAo+Pj4+IGltcGxlbWVudGF0aW9uIGRl
dGFpbHMgb2YgYW4gQVBJIGZ1bmN0aW9uIEkgY2FsbCB0byBkbyB0aGUgdGhpbmcgSSBleHBlY3Qu
Cj4+Pgo+Pj4gWWVhaCwgb2sgdGhhdCBpcyBhIHJhdGhlciBnb29kIGFyZ3VtZW50Lgo+Pj4KPj4+
IENocmlzdGlhbi4KPj4KPj4KPj4gU28gc2hvdWxkIEkganVzdCBrZWVwIGl0IGFzIGlzIG9yIHlv
dSB0aGluayBpdCdzIHN0aWxsIHdvdWxkIGJlIG1vcmUgCj4+IGJlbmVmaWNpYWwgdG8gdW5pZnkg
dGhlbSB0aGUgd2F5IHlvdSBwcm9wb3NlID8KPgo+IE1heWJlIHdlIHNob3VsZCBtb3ZlIHRoZSBl
cnJvciBoYW5kbGluZyBpbnRvIGFtZGdwdV9nZW1fY3JlYXRlX2lvY3RsKCkgYW55d2F5Lgo+Cj4g
V2UgZG9uJ3QgcmVhbGx5IHdhbnQgdGhhdCBoYW5kbGluZyBpbiB0aGUgdXNlcnB0ciBzdHVmZiBh
bmQgZm9yIHRoZSBjYWxsIGZyb20gCj4gYW1kZ3B1ZmJfY3JlYXRlX3Bpbm5lZF9vYmplY3QoKSB0
aGF0IGlzIGFjdHVhbGx5IGEgYnVnIQo+Cj4gRS5nLiBmb3IgdGhlIGZiIGVtdWxhdGlvbiB3ZSBj
YW4ndCBmYWxsIGJhY2sgZnJvbSBWUkFNIHRvIEdUVCBsaWtlIGluIHRoZSAKPiBjcmVhdGUgaW9j
dGwuCgoKV2hhdCBhYm91dCBhbWRncHVfbW9kZV9kdW1iX2NyZWF0ZSwgc2VlbXMgbGlrZSB0aGVy
ZSBHVFQgZG9tYWluIGlzIGFsc28gcmVsZXZhbnQgCmFuZCBzbyB0aGUgZXJyb3IgaGFuZGxpbmcg
d291bGQgYmUgbmVlZGVkIHRoZXJlIHRvby4KCkFuZHJleQoKCj4KPiBDaHJpc3RpYW4uCj4KPj4K
Pj4gQW5kcmV5Cj4+Cj4+Cj4+Pgo+Pj4+Cj4+Pj4gQW5kcmV5Cj4+Pj4KPj4+Pgo+Pj4+Pgo+Pj4+
PiBDaHJpc3RpYW4uCj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gQW5kcmV5Cj4+Pj4+Pgo+Pj4+Pj4KPj4+
Pj4+Pgo+Pj4+Pj4+IFRoYW5rcywKPj4+Pj4+PiBDaHJpc3RpYW4uCj4+Pj4+Pj4KPj4+Pj4+Pj4K
Pj4+Pj4+Pj4gVGhpcyBmaXhlcyBudWxsIHB0ciByZWdyZXNzaW9uIGNhc3VlZCBieSBjb21taXQK
Pj4+Pj4+Pj4gZDY5M2RlZiBkcm06IFJlbW92ZSBvYnNvbGV0ZSBHRU0gYW5kIFBSSU1FIGNhbGxi
YWNrcyBmcm9tIHN0cnVjdCAKPj4+Pj4+Pj4gZHJtX2RyaXZlcgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBT
aWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNv
bT4KPj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kbWFfYnVmLmMgfCAxMyArKysrKystLS0tLS0tCj4+Pj4+Pj4+IMKgIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uY8KgwqDCoMKgIHwgMjIgKysrKysrKysrKysrKysr
KystLS0tLQo+Pj4+Pj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Vt
LmjCoMKgwqDCoCB8wqAgNSArKysrKwo+Pj4+Pj4+PiDCoCAzIGZpbGVzIGNoYW5nZWQsIDI4IGlu
c2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYuYyAKPj4+Pj4+Pj4g
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5jCj4+Pj4+Pj4+IGlu
ZGV4IGU1OTE5ZWYuLmRhNGQwYWIgMTAwNjQ0Cj4+Pj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kbWFfYnVmLmMKPj4+Pj4+Pj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYuYwo+Pj4+Pj4+PiBAQCAtNDA1LDYgKzQwNSw3
IEBAIHN0cnVjdCBkbWFfYnVmICphbWRncHVfZ2VtX3ByaW1lX2V4cG9ydChzdHJ1Y3QgCj4+Pj4+
Pj4+IGRybV9nZW1fb2JqZWN0ICpnb2JqLAo+Pj4+Pj4+PiDCoMKgwqDCoMKgIHJldHVybiBidWY7
Cj4+Pj4+Pj4+IMKgIH0KPj4+Pj4+Pj4gwqAgKwo+Pj4+Pj4+PiDCoCAvKioKPj4+Pj4+Pj4gwqDC
oCAqIGFtZGdwdV9kbWFfYnVmX2NyZWF0ZV9vYmogLSBjcmVhdGUgQk8gZm9yIERNQS1idWYgaW1w
b3J0Cj4+Pj4+Pj4+IMKgwqAgKgo+Pj4+Pj4+PiBAQCAtNDI0LDcgKzQyNSw3IEBAIGFtZGdwdV9k
bWFfYnVmX2NyZWF0ZV9vYmooc3RydWN0IGRybV9kZXZpY2UgKmRldiwgCj4+Pj4+Pj4+IHN0cnVj
dCBkbWFfYnVmICpkbWFfYnVmKQo+Pj4+Pj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2ID0gZHJtX3RvX2FkZXYoZGV2KTsKPj4+Pj4+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3Qg
YW1kZ3B1X2JvICpibzsKPj4+Pj4+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgYW1kZ3B1X2JvX3BhcmFt
IGJwOwo+Pj4+Pj4+PiAtwqDCoMKgIGludCByZXQ7Cj4+Pj4+Pj4+ICvCoMKgwqAgc3RydWN0IGRy
bV9nZW1fb2JqZWN0ICpvYmo7Cj4+Pj4+Pj4+IMKgIMKgwqDCoMKgwqAgbWVtc2V0KCZicCwgMCwg
c2l6ZW9mKGJwKSk7Cj4+Pj4+Pj4+IMKgwqDCoMKgwqAgYnAuc2l6ZSA9IGRtYV9idWYtPnNpemU7
Cj4+Pj4+Pj4+IEBAIC00MzQsMjEgKzQzNSwxOSBAQCBhbWRncHVfZG1hX2J1Zl9jcmVhdGVfb2Jq
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIAo+Pj4+Pj4+PiBzdHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1
ZikKPj4+Pj4+Pj4gwqDCoMKgwqDCoCBicC50eXBlID0gdHRtX2JvX3R5cGVfc2c7Cj4+Pj4+Pj4+
IMKgwqDCoMKgwqAgYnAucmVzdiA9IHJlc3Y7Cj4+Pj4+Pj4+IMKgwqDCoMKgwqAgZG1hX3Jlc3Zf
bG9jayhyZXN2LCBOVUxMKTsKPj4+Pj4+Pj4gLcKgwqDCoCByZXQgPSBhbWRncHVfYm9fY3JlYXRl
KGFkZXYsICZicCwgJmJvKTsKPj4+Pj4+Pj4gLcKgwqDCoCBpZiAocmV0KQo+Pj4+Pj4+PiArwqDC
oMKgIG9iaiA9IGFtZGdwdV9nZW1fb2JqZWN0X2NyZWF0ZV9yYXcoYWRldiwgJmJwKTsKPj4+Pj4+
Pj4gK8KgwqDCoCBpZiAoSVNfRVJSKG9iaikpCj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBn
b3RvIGVycm9yOwo+Pj4+Pj4+PiDCoCArwqDCoMKgIGJvID0gZ2VtX3RvX2FtZGdwdV9ibyhvYmop
Owo+Pj4+Pj4+PiDCoMKgwqDCoMKgIGJvLT5hbGxvd2VkX2RvbWFpbnMgPSBBTURHUFVfR0VNX0RP
TUFJTl9HVFQ7Cj4+Pj4+Pj4+IMKgwqDCoMKgwqAgYm8tPnByZWZlcnJlZF9kb21haW5zID0gQU1E
R1BVX0dFTV9ET01BSU5fR1RUOwo+Pj4+Pj4+PiDCoMKgwqDCoMKgIGlmIChkbWFfYnVmLT5vcHMg
IT0gJmFtZGdwdV9kbWFidWZfb3BzKQo+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYm8tPnBy
aW1lX3NoYXJlZF9jb3VudCA9IDE7Cj4+Pj4+Pj4+IMKgIC3CoMKgwqAgZG1hX3Jlc3ZfdW5sb2Nr
KHJlc3YpOwo+Pj4+Pj4+PiAtwqDCoMKgIHJldHVybiAmYm8tPnRiby5iYXNlOwo+Pj4+Pj4+PiAt
Cj4+Pj4+Pj4+IMKgIGVycm9yOgo+Pj4+Pj4+PiDCoMKgwqDCoMKgIGRtYV9yZXN2X3VubG9jayhy
ZXN2KTsKPj4+Pj4+Pj4gLcKgwqDCoCByZXR1cm4gRVJSX1BUUihyZXQpOwo+Pj4+Pj4+PiArwqDC
oMKgIHJldHVybiBvYmo7Cj4+Pj4+Pj4+IMKgIH0KPj4+Pj4+Pj4gwqAgwqAgLyoqCj4+Pj4+Pj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMgCj4+
Pj4+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jCj4+Pj4+Pj4+
IGluZGV4IGM5Zjk0ZmIuLjVmMjJjZTYgMTAwNjQ0Cj4+Pj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYwo+Pj4+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMKPj4+Pj4+Pj4gQEAgLTUyLDEzICs1MiwyNiBAQCBz
dGF0aWMgdm9pZCBhbWRncHVfZ2VtX29iamVjdF9mcmVlKHN0cnVjdCAKPj4+Pj4+Pj4gZHJtX2dl
bV9vYmplY3QgKmdvYmopCj4+Pj4+Pj4+IMKgwqDCoMKgwqAgfQo+Pj4+Pj4+PiDCoCB9Cj4+Pj4+
Pj4+IMKgICtzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmFtZGdwdV9nZW1fb2JqZWN0X2NyZWF0ZV9y
YXcoc3RydWN0IAo+Pj4+Pj4+PiBhbWRncHVfZGV2aWNlICphZGV2LAo+Pj4+Pj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBh
bWRncHVfYm9fcGFyYW0gKmJwKQo+Pj4+Pj4+PiArewo+Pj4+Pj4+PiArwqDCoMKgIHN0cnVjdCBh
bWRncHVfYm8gKmJvOwo+Pj4+Pj4+PiArwqDCoMKgIGludCByOwo+Pj4+Pj4+PiArCj4+Pj4+Pj4+
ICvCoMKgwqAgciA9IGFtZGdwdV9ib19jcmVhdGUoYWRldiwgYnAsICZibyk7Cj4+Pj4+Pj4+ICvC
oMKgwqAgaWYgKHIpCj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gRVJSX1BUUihyKTsK
Pj4+Pj4+Pj4gKwo+Pj4+Pj4+PiArwqDCoMKgIGJvLT50Ym8uYmFzZS5mdW5jcyA9ICZhbWRncHVf
Z2VtX29iamVjdF9mdW5jczsKPj4+Pj4+Pj4gK8KgwqDCoCByZXR1cm4gJmJvLT50Ym8uYmFzZTsK
Pj4+Pj4+Pj4gK30KPj4+Pj4+Pj4gKwo+Pj4+Pj4+PiDCoCBpbnQgYW1kZ3B1X2dlbV9vYmplY3Rf
Y3JlYXRlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1bnNpZ25lZCAKPj4+Pj4+Pj4gbG9u
ZyBzaXplLAo+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50
IGFsaWdubWVudCwgdTMyIGluaXRpYWxfZG9tYWluLAo+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgdTY0IGZsYWdzLCBlbnVtIHR0bV9ib190eXBlIHR5cGUsCj4+
Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZG1hX3Jl
c3YgKnJlc3YsCj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBz
dHJ1Y3QgZHJtX2dlbV9vYmplY3QgKipvYmopCj4+Pj4+Pj4+IMKgIHsKPj4+Pj4+Pj4gLcKgwqDC
oCBzdHJ1Y3QgYW1kZ3B1X2JvICpibzsKPj4+Pj4+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgYW1kZ3B1
X2JvX3BhcmFtIGJwOwo+Pj4+Pj4+PiDCoMKgwqDCoMKgIGludCByOwo+Pj4+Pj4+PiDCoCBAQCAt
NzMsOCArODYsOSBAQCBpbnQgYW1kZ3B1X2dlbV9vYmplY3RfY3JlYXRlKHN0cnVjdCBhbWRncHVf
ZGV2aWNlIAo+Pj4+Pj4+PiAqYWRldiwgdW5zaWduZWQgbG9uZyBzaXplLAo+Pj4+Pj4+PiDCoCBy
ZXRyeToKPj4+Pj4+Pj4gwqDCoMKgwqDCoCBicC5mbGFncyA9IGZsYWdzOwo+Pj4+Pj4+PiDCoMKg
wqDCoMKgIGJwLmRvbWFpbiA9IGluaXRpYWxfZG9tYWluOwo+Pj4+Pj4+PiAtwqDCoMKgIHIgPSBh
bWRncHVfYm9fY3JlYXRlKGFkZXYsICZicCwgJmJvKTsKPj4+Pj4+Pj4gLcKgwqDCoCBpZiAocikg
ewo+Pj4+Pj4+PiArwqDCoMKgICpvYmogPSBhbWRncHVfZ2VtX29iamVjdF9jcmVhdGVfcmF3KGFk
ZXYsICZicCk7Cj4+Pj4+Pj4+ICvCoMKgwqAgaWYgKElTX0VSUigqb2JqKSkgewo+Pj4+Pj4+PiAr
wqDCoMKgwqDCoMKgwqAgciA9IFBUUl9FUlIoKm9iaik7Cj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCBpZiAociAhPSAtRVJFU1RBUlRTWVMpIHsKPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaWYgKGZsYWdzICYgQU1ER1BVX0dFTV9DUkVBVEVfQ1BVX0FDQ0VTU19SRVFVSVJF
RCkgewo+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZsYWdzICY9
IH5BTURHUFVfR0VNX0NSRUFURV9DUFVfQUNDRVNTX1JFUVVJUkVEOwo+Pj4+Pj4+PiBAQCAtOTAs
OCArMTA0LDYgQEAgaW50IGFtZGdwdV9nZW1fb2JqZWN0X2NyZWF0ZShzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAKPj4+Pj4+Pj4gKmFkZXYsIHVuc2lnbmVkIGxvbmcgc2l6ZSwKPj4+Pj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgIH0KPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByOwo+Pj4+
Pj4+PiDCoMKgwqDCoMKgIH0KPj4+Pj4+Pj4gLcKgwqDCoCAqb2JqID0gJmJvLT50Ym8uYmFzZTsK
Pj4+Pj4+Pj4gLcKgwqDCoCAoKm9iaiktPmZ1bmNzID0gJmFtZGdwdV9nZW1fb2JqZWN0X2Z1bmNz
Owo+Pj4+Pj4+PiDCoCDCoMKgwqDCoMKgIHJldHVybiAwOwo+Pj4+Pj4+PiDCoCB9Cj4+Pj4+Pj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmggCj4+
Pj4+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5oCj4+Pj4+Pj4+
IGluZGV4IDYzN2JmNTEuLmE2YjkwZDMgMTAwNjQ0Cj4+Pj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uaAo+Pj4+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmgKPj4+Pj4+Pj4gQEAgLTM4LDEyICszOCwxNyBAQCB1
bnNpZ25lZCBsb25nIGFtZGdwdV9nZW1fdGltZW91dCh1aW50NjRfdCB0aW1lb3V0X25zKTsKPj4+
Pj4+Pj4gwqAgLyoKPj4+Pj4+Pj4gwqDCoCAqIEdFTSBvYmplY3RzLgo+Pj4+Pj4+PiDCoMKgICov
Cj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4gK3N0cnVjdCBhbWRncHVfYm9fcGFyYW07Cj4+Pj4+Pj4+ICsK
Pj4+Pj4+Pj4gwqAgdm9pZCBhbWRncHVfZ2VtX2ZvcmNlX3JlbGVhc2Uoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpOwo+Pj4+Pj4+PiDCoCBpbnQgYW1kZ3B1X2dlbV9vYmplY3RfY3JlYXRlKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1bnNpZ25lZCAKPj4+Pj4+Pj4gbG9uZyBzaXplLAo+
Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50IGFsaWdubWVu
dCwgdTMyIGluaXRpYWxfZG9tYWluLAo+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgdTY0IGZsYWdzLCBlbnVtIHR0bV9ib190eXBlIHR5cGUsCj4+Pj4+Pj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZG1hX3Jlc3YgKnJlc3Ys
Cj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJt
X2dlbV9vYmplY3QgKipvYmopOwo+Pj4+Pj4+PiArc3RydWN0IGRybV9nZW1fb2JqZWN0ICphbWRn
cHVfZ2VtX29iamVjdF9jcmVhdGVfcmF3KHN0cnVjdCAKPj4+Pj4+Pj4gYW1kZ3B1X2RldmljZSAq
YWRldiwKPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzdHJ1Y3QgYW1kZ3B1X2JvX3BhcmFtICpicCk7Cj4+Pj4+Pj4+IMKgIMKg
IGludCBhbWRncHVfbW9kZV9kdW1iX2NyZWF0ZShzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdiwK
Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LAo+Pj4+Pj4+Cj4+Pj4+Cj4+Pgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeAo=
