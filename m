Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D56A12D797F
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Dec 2020 16:36:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED676E29D;
	Fri, 11 Dec 2020 15:36:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680073.outbound.protection.outlook.com [40.107.68.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69FD86E29D
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Dec 2020 15:36:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQ0HLwaXkouzVlNZot0VpTYhaEnCc49YsK3cN0gW3/wDecXRaHxCzR9Ap8//dThpdJtVP4EqHt9r7Fk1/It8OByQvkdLbTPPHjZWuiP+9cm1Blluo9vWt62vMHydoX4+eI2yATXcmNFMuU0vt8SBq2SbUEno6Jg4DMGJsLYYy90Ctc2XtY3TPXf4FgTAZ8VEQUPS1+7pXDDbj7FDKUEXLEC33BCRFD2gSnrL2XX+MN+l/jYbiQ/V5LZ29KCQg+SZUgmDJIai9wGQIo4zVTH76Pc9WZf1C/Y8/ZRLfv7zFqkYWaehuImBpbKrfWvnIC9uIaJ4pD7Ocl+OmJgceQQzBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1IsQYu7xVRzLRa7j3yAV3OA0jdHQCV8aihW2T3L1Ccc=;
 b=jdnHvAmV5gQcyUeJ0+WZxWyyH7Hs31sO33AcOjk+wanXwvJcPQ7O+ehjtvbqVE6hovBofS8i0AMfJVcJ00TIO9LN8lCh71ZWNtqmxhae1w9OH+80SPibW88Xl5qs6jmHU8QKaaQQuPAPW86Li8ikkpmf3+Ft+Q5wS/fmlUiD+eWbN7q25zzTwyE6J5DhYWnKDv/xqdbgAEKktqPZ7pet0GKFj/Ik/9/6/qYUFuKD0x6TtLrLq/uuwwAB1eKAiDi85/l9aLXhXdxdZVxkw5aUWyVZBNaUYBWm/qtnss9GMX5CBw1g27yEs30LJgr8CKs6Af/gVDG5fE1TTTGXS7z3aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1IsQYu7xVRzLRa7j3yAV3OA0jdHQCV8aihW2T3L1Ccc=;
 b=gfuKBvqMJHlZkervDE/0ZA0SMJCqbk4mCeX591x8qlcjfm+gm9Bqt4YVRD8nCs2vdOg0Wd29RPpGWgycpu3Co9wstvRss3Ss+MFm+rfTp05X7WEwNxPz8bTsIGQObz+uNGPxKzGnKGV072hCTqQ6teOOkRDjUIsgYI1c68vTgRM=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3126.namprd12.prod.outlook.com (2603:10b6:a03:df::28)
 by BY5PR12MB4965.namprd12.prod.outlook.com (2603:10b6:a03:1c4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Fri, 11 Dec
 2020 15:36:07 +0000
Received: from BYAPR12MB3126.namprd12.prod.outlook.com
 ([fe80::45a1:6d50:60d6:9d68]) by BYAPR12MB3126.namprd12.prod.outlook.com
 ([fe80::45a1:6d50:60d6:9d68%7]) with mapi id 15.20.3654.017; Fri, 11 Dec 2020
 15:36:07 +0000
Subject: Re: [PATCH 3/3] drm/amd/display: Skip modeset for front porch change
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, amd-gfx@lists.freedesktop.org
References: <20201210024526.1151447-1-aurabindo.pillai@amd.com>
 <20201210024526.1151447-4-aurabindo.pillai@amd.com>
 <9cc10157-d533-95fd-0f20-8bbc2db75a79@amd.com>
 <f102763220b62e64e377e84a2e8d354bb8d89173.camel@amd.com>
 <af16a352-6bd5-0836-50b0-a05194fb1764@amd.com>
 <41c0996b-4bbf-902d-2039-7c7015804dfa@amd.com>
From: Shashank Sharma <shashank.sharma@amd.com>
Message-ID: <3efa6961-544a-3f27-361e-c0d03d6355df@amd.com>
Date: Fri, 11 Dec 2020 21:05:55 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <41c0996b-4bbf-902d-2039-7c7015804dfa@amd.com>
Content-Language: en-US
X-Originating-IP: [106.51.105.40]
X-ClientProxiedBy: MA1PR01CA0131.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:35::25) To BYAPR12MB3126.namprd12.prod.outlook.com
 (2603:10b6:a03:df::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.113] (106.51.105.40) by
 MA1PR01CA0131.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:35::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 15:36:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8a3b7941-31b3-4bd5-c669-08d89dea7a5c
X-MS-TrafficTypeDiagnostic: BY5PR12MB4965:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB49652FC701E58DAF6DDA0834F2CA0@BY5PR12MB4965.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HMPfUGjRo12HlFNq40/AgWQpFLoAAcfrgW3XqLqZJelXzsXZ4BW/1YHRBb2uLG8vad+Kaj9ZUGRfQzVOslQeUgqyUmzmKd5rCiqi5/ykkTjj8Vcf1s7EBr+1zNsWlFBC1T9SenOhcLOYQjbXg0l4YF/tM2OlDAEhhOJU4CjYGes1clB39JkXRKYW88O90OvkZTpC8LDDAxrs1nQPaGSiPUZdjfdH+lln+FWv1ZZyiqNdhN9ZBqebGyDW+R2sOfrQAG0v56NNmfMu7TA7RzFs5B1mBAuCqiaC17mCJPmHwDxu0vXRANCouEwG/D4cUNvhPrBvmqBYk3mDuhqedDYby3GkgAanKLqvouXAQ6zsrze1Swa+o9dN7GZ/zICuv6ONlPSg34FKmKQfAL9e8tOA28KQRqeLUb3A9KpgUSbGwRDRx6o6v1WVxrrqN+lR0Ikd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3126.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(346002)(52116002)(4326008)(55236004)(53546011)(31686004)(8676002)(31696002)(508600001)(26005)(86362001)(186003)(956004)(2616005)(8936002)(66476007)(6666004)(1006002)(44832011)(16526019)(5660300002)(66946007)(66556008)(4001150100001)(16576012)(36756003)(34490700003)(110136005)(6486002)(2906002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VVFSTm80T0l6Wmxmdmtlc1lHdVk4U1BvNzB6TkVMUGFDbHVWSU5tWkQ3S1oy?=
 =?utf-8?B?TjJuSFBISFVhSXQ0dDA4QzRpYUJ0WllTS2RHZk10QUdZdzdWRGJTSWxFVnRp?=
 =?utf-8?B?NStDS0dmVWNpSFRmRVN4andUZkRQcS9taXFGb1MydzdrR0l3WlByN2RLOERZ?=
 =?utf-8?B?R3RMa2JTdlJlSUxueCsreFAvcU1BMmFoSXROMHA0Rjlpa2RKRWpoQ29qU0g2?=
 =?utf-8?B?U1NkNVlrSWVjNU1EY2hVVEZWNlBBWDBScGNwaUhtUXdDL0JaRnVRdDlrcUNV?=
 =?utf-8?B?WUlFWnBKZlRmeFY1RkI3WVk1QUREand6QmFVWnd3VHBhVmVoWWNrREpUOTNK?=
 =?utf-8?B?UGFlRnZDaDFtUlBsZmcwbEZ6dWxQTThwU3YvVjJIL24rYnRBalZYN25zMDFO?=
 =?utf-8?B?K3FrY3dlN0hqNEVaV25iVTR4bUZKN0NINWc4ZzM4SlNMRlZyQjNReFlmK2RT?=
 =?utf-8?B?dzR2Tm83S2kvL2tvdXRPdWlsdkd3dzRrQVQ2SGJMUE5JcHpBQzg3NFR6dnpj?=
 =?utf-8?B?bHpBOVh1TmVnWituU2Y1Rm16Njc2cVBzUUg1QkVnSno5bjk3OEtmZE1BWDBI?=
 =?utf-8?B?c0RHaXYrcS9qNEh4RUZtWEhWM1ZnL0UxVld2T1ZsVEdOb2xaUzZoMjhidWFz?=
 =?utf-8?B?QVV5NTh2YmtsRWsrWGsyVmJySnlYaEtxQnZuQWZySHAxTmVXdEJDYUFrRDVD?=
 =?utf-8?B?cUlJMDBNeWhjMVprbGsxZ1JLQm9BMFJNUzFqRDhrNGwxWXRoZmtNQnp3ZDRU?=
 =?utf-8?B?cStCeWFvdDhIa1pOUTd2cllUclNteHlUakFjcjBsbjBYelcyMHp0b2h0OEVN?=
 =?utf-8?B?YUhnVk1HSGNnVS9VQWJDRlFzMjZoQWRZMWVicTQ3N2dGbXN5M3RLZGdSOWZP?=
 =?utf-8?B?VDlJQ0RxS08zaWJ0SEdDeGFqcU4rNHhlSXJyT3lPaWhKVGRmNkcwOGJ6ZGRx?=
 =?utf-8?B?MU0vUUVhWExidFcyMHhXd1NoeUpadnNjbkx6Uzc5NVlGeFZSTjhESTJCM0kx?=
 =?utf-8?B?WmZLL2tWT0tHUkdhb2hUc3owdlErQzNjNStmdXBqcjluTFd1bGpKME5Hc2Ex?=
 =?utf-8?B?dCtNN3dNMmhIUG9ZOGtFSWNyVmhMd0JFaDQ1b2c4K1piSVFYclViMStOWkVE?=
 =?utf-8?B?dzZqaE5NNHRRc1hsV3p2OE5GeHJXeGlMUll2blhGU0hmVDN2WTVZOVRaT2xD?=
 =?utf-8?B?a1ZvK0hwRDRCNkJpSTcvNzl0Q1NtYW5NOG44Q0YwUU5zYTlzbzg5aS9SVjhq?=
 =?utf-8?B?eXQ0YUd2REpTMU9INVYyTFRWdjdaZ3BRZXEzTmY4Z29xZUNFWUhFS2tnVGU2?=
 =?utf-8?Q?IOxJoPEz4aZMsHsPpoiH0P4tuan+ScWTQ6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3126.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 15:36:07.1614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a3b7941-31b3-4bd5-c669-08d89dea7a5c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QKCr+RYKDQzTb4r1P4dges7LbeqYrnVSzhozow4UZ+9WqC02ls6UX4sTWtRzZjMxaEmOcnUvsMhIIAy9sgz10g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4965
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
Cc: alexander.deucher@amd.com, stylon.wang@amd.com, thong.thai@amd.com,
 Harry.Wentland@amd.com, wayne.lin@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Ck9uIDExLzEyLzIwIDg6MTkgcG0sIEthemxhdXNrYXMsIE5pY2hvbGFzIHdyb3RlOgo+IE9uIDIw
MjAtMTItMTEgMTI6MDggYS5tLiwgU2hhc2hhbmsgU2hhcm1hIHdyb3RlOgo+PiBPbiAxMC8xMi8y
MCAxMToyMCBwbSwgQXVyYWJpbmRvIFBpbGxhaSB3cm90ZToKPj4+IE9uIFRodSwgMjAyMC0xMi0x
MCBhdCAxODoyOSArMDUzMCwgU2hhc2hhbmsgU2hhcm1hIHdyb3RlOgo+Pj4+IE9uIDEwLzEyLzIw
IDg6MTUgYW0sIEF1cmFiaW5kbyBQaWxsYWkgd3JvdGU6Cj4+Pj4+IFtXaHkmSG93XQo+Pj4+PiBJ
bm9yZGVyIHRvIGVuYWJsZSBmcmVlc3luYyB2aWRlbyBtb2RlLCBkcml2ZXIgYWRkcyBleHRyYQo+
Pj4+PiBtb2RlcyBiYXNlZCBvbiBwcmVmZXJyZWQgbW9kZXMgZm9yIGNvbW1vbiBmcmVlc3luYyBm
cmFtZSByYXRlcy4KPj4+Pj4gV2hlbiBjb21taXRpbmcgdGhlc2UgbW9kZSBjaGFuZ2VzLCBhIGZ1
bGwgbW9kZXNldCBpcyBub3QgbmVlZGVkLgo+Pj4+PiBJZiB0aGUgY2hhbmdlIGluIG9ubHkgaW4g
dGhlIGZyb250IHBvcmNoIHRpbWluZyB2YWx1ZSwgc2tpcCBmdWxsCj4+Pj4+IG1vZGVzZXQgYW5k
IGNvbnRpbnVlIHVzaW5nIHRoZSBzYW1lIHN0cmVhbS4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1i
eTogQXVyYWJpbmRvIFBpbGxhaSA8Cj4+Pj4+IGF1cmFiaW5kby5waWxsYWlAYW1kLmNvbQo+Pj4+
PiAtLS0KPj4+Pj4gICAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
LmMgfCAxNjkKPj4+Pj4gKysrKysrKysrKysrKysrKy0tCj4+Pj4+ICAgLi4uL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5oIHwgICAxICsKPj4+Pj4gICAyIGZpbGVzIGNo
YW5nZWQsIDE1MyBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKPj4+Pj4KPj4+Pj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
LmMKPj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bS5jCj4+Pj4+IGluZGV4IGY2OTlhM2Q0MWNhZC4uYzhjNzI4ODc5MDZhIDEwMDY0NAo+Pj4+PiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4+
Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
LmMKPj4+Pj4gQEAgLTIxNyw2ICsyMTcsOSBAQCBzdGF0aWMgYm9vbCBhbWRncHVfZG1fcHNyX2Rp
c2FibGVfYWxsKHN0cnVjdAo+Pj4+PiBhbWRncHVfZGlzcGxheV9tYW5hZ2VyICpkbSk7Cj4+Pj4+
ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZm9ybWF0X2luZm8gKgo+Pj4+PiAgIGFtZF9nZXRf
Zm9ybWF0X2luZm8oY29uc3Qgc3RydWN0IGRybV9tb2RlX2ZiX2NtZDIgKmNtZCk7Cj4+Pj4+ICAg
Cj4+Pj4+ICtzdGF0aWMgYm9vbAo+Pj4+PiAraXNfdGltaW5nX3VuY2hhbmdlZF9mb3JfZnJlZXN5
bmMoc3RydWN0IGRybV9jcnRjX3N0YXRlCj4+Pj4+ICpvbGRfY3J0Y19zdGF0ZSwKPj4+Pj4gKwkJ
CQkgc3RydWN0IGRybV9jcnRjX3N0YXRlCj4+Pj4+ICpuZXdfY3J0Y19zdGF0ZSk7Cj4+Pj4+ICAg
LyoKPj4+Pj4gICAgKiBkbV92YmxhbmtfZ2V0X2NvdW50ZXIKPj4+Pj4gICAgKgo+Pj4+PiBAQCAt
NTA5Niw4ICs1MDk5LDExIEBAIGNvcHlfY3J0Y190aW1pbmdfZm9yX2RybV9kaXNwbGF5X21vZGUo
Y29uc3QKPj4+Pj4gc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKnNyY19tb2RlLAo+Pj4+PiAgIHN0
YXRpYyB2b2lkCj4+Pj4+ICAgZGVjaWRlX2NydGNfdGltaW5nX2Zvcl9kcm1fZGlzcGxheV9tb2Rl
KHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlCj4+Pj4+ICpkcm1fbW9kZSwKPj4+Pj4gICAJCQkJCWNv
bnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlCj4+Pj4+ICpuYXRpdmVfbW9kZSwKPj4+Pj4gLQkJ
CQkJYm9vbCBzY2FsZV9lbmFibGVkKQo+Pj4+PiArCQkJCQlib29sIHNjYWxlX2VuYWJsZWQsIGJv
b2wKPj4+Pj4gZnNfbW9kZSkKPj4+Pj4gICB7Cj4+Pj4+ICsJaWYgKGZzX21vZGUpCj4+Pj4+ICsJ
CXJldHVybjsKPj4+PiBzbyB3ZSBhcmUgYWRkaW5nIGFuIGlucHV0IGZsYWcganVzdCBzbyB0aGF0
IHdlIGNhbiByZXR1cm4gZnJvbSB0aGUKPj4+PiBmdW5jdGlvbiBhdCB0b3AgPyBIb3cgYWJvdXQg
YWRkaW5nIHRoaXMgY2hlY2sgYXQgdGhlIGNhbGxlciB3aXRob3V0Cj4+Pj4gY2hhbmdpbmcgdGhl
IGZ1bmN0aW9uIHBhcmFtZXRlcnMgPwo+Pj4gV2lsbCBmaXggdGhpcy4KPj4+Cj4+Pj4+ICsKPj4+
Pj4gICAJaWYgKHNjYWxlX2VuYWJsZWQpIHsKPj4+Pj4gICAJCWNvcHlfY3J0Y190aW1pbmdfZm9y
X2RybV9kaXNwbGF5X21vZGUobmF0aXZlX21vZGUsCj4+Pj4+IGRybV9tb2RlKTsKPj4+Pj4gICAJ
fSBlbHNlIGlmIChuYXRpdmVfbW9kZS0+Y2xvY2sgPT0gZHJtX21vZGUtPmNsb2NrICYmCj4+Pj4+
IEBAIC01MjQxLDYgKzUyNDcsMjQgQEAgZ2V0X2hpZ2hlc3RfZnJlZXN5bmNfbW9kZShzdHJ1Y3QK
Pj4+Pj4gYW1kZ3B1X2RtX2Nvbm5lY3RvciAqYWNvbm5lY3RvciwKPj4+Pj4gICAJcmV0dXJuIG1f
aGlnaDsKPj4+Pj4gICB9Cj4+Pj4+ICAgCj4+Pj4+ICtzdGF0aWMgYm9vbCBpc19mcmVlc3luY192
aWRlb19tb2RlKHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlLAo+Pj4+PiArCQkJCSAgIHN0
cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yCj4+Pj4+ICphY29ubmVjdG9yKQo+Pj4+PiArewo+Pj4+
PiArCXN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICpoaWdoX21vZGU7Cj4+Pj4+ICsKPj4+PiBJIHRo
b3VnaHQgd2Ugd2VyZSBhZGRpbmcgYSBzdHJpbmcgIl9GU1YiIGluIHRoZSBlbmQgZm9yIHRoZSBt
b2RlLQo+Pj4+PiBuYW1lLCB3aHkgY2FuJ3Qgd2UgY2hlY2sgdGhhdCBpbnN0ZWFkIG9mIGdvaW5n
IHRocm91Z2ggdGhlIHdob2xlCj4+Pj4gbGlzdCBvZiBtb2RlcyBhZ2FpbiA/Cj4+PiBBY3R1YWxs
eSBJIG9ubHkgYWRkZWQgX0ZTViB0byBkaXN0aW5ndWlzaCB0aGUgbmV3bHkgYWRkZWQgbW9kZXMg
ZWFzaWx5Lgo+Pj4gT24gc2Vjb25kIHRob3VnaHRzLCBJJ20gbm90IHN1cmUgaWYgdGhlcmUgYXJl
IGFueSB1c2Vyc3BhY2UKPj4+IGFwcGxpY2F0aW9ucyB0aGF0IG1pZ2h0IGRlcGVuZCBvbiBwYXJz
aW5nIHRoZSBtb2RlIG5hbWUsIGZvciBtYXliZSB0bwo+Pj4gcHJpbnQgdGhlIHJlc29sdXRpb24u
IEkgdGhpbmsgaXRzIGJldHRlciBub3QgdG8gYnJlYWsgYW55IHN1Y2gKPj4+IGFzc3VtcHRpb25z
IGlmIHRoZXkgZG8gZXhpc3QgYnkgYW55IGNoYW5jZS4gSSB0aGluayBJJ2xsIGp1c3QgcmVtb3Zl
Cj4+PiBfRlNWIGZyb20gdGhlIG1vZGUgbmFtZS4gV2UgYWxyZWFkeSBzZXQgRFJNX01PREVfVFlQ
RV9EUklWRVIgZm9yCj4+PiB1c2Vyc3BhY2UgdG8gcmVjb2duaXplIHRoZXNlIGFkZGl0aW9uYWwg
bW9kZXMsIHNvIGl0IHNob3VsZG50IGJlIGEKPj4+IHByb2JsZW0uCj4+IEFjdHVhbGx5LCBJIGFt
IHJhdGhlciBoYXBweSB3aXRoIHRoaXMsIGFzIGluIHdoZW4gd2Ugd2FudCB0byB0ZXN0IG91dCB0
aGlzIGZlYXR1cmUgd2l0aCBhIElHVCB0eXBlIHN0dWZmLCBvciBpZiBhIHVzZXJzcGFjZSB3YW50
cyB0byB1dGlsaXplIHRoaXMgb3B0aW9uIGluIGFueSB3YXksIHRoaXMgbWV0aG9kIG9mIGRpZmZl
cmVudGlhdGlvbiB3b3VsZCBiZSB1c2VmdWwuIERSTV9NT0RFX0RSSVZFUiBpcyBiZWluZyB1c2Vk
IGJ5IHNvbWUgb3RoZXIgcGxhY2VzIGFwYXJ0IGZyb20gZnJlZXN5bmMsIHNvIGl0IG1pZ2h0IG5v
dCBiZSBhIHVuaXF1ZSBpZGVudGlmaWVyLiBTbyBteSByZWNvbW1lbmRhdGlvbiB3b3VsZCBiZSB0
byBrZWVwIHRoaXMuCj4+Cj4+IE15IGNvbW1lbnQgd2FzLCBpZiB3ZSBoYXZlIGFscmVhZHkgcGFy
c2VkIHRoZSB3aG9sZSBjb25uZWN0b3IgbGlzdCBvbmNlLCBhbmQgYWRkZWQgdGhlIG1vZGUsIHRo
ZXJlIHNob3VsZCBiZSBhIGJldHRlciB3YXkgb2YgZG9pbmcgaXQgaW5zdGVhZCBvZiBjaGVja2lu
ZyBpdCBhZ2FpbiBieSBjYWxsaW5nICJnZXRfaGlnaGVzdF9mcmVlc3luY19tb2QiCj4+Cj4+IFNv
bWUgdGhpbmdzIEkgY2FuIHRoaW5rIG9uIHRvcCBvZiBteSBtaW5kIHdvdWxkIGJlOgo+Pgo+PiAt
IEFkZCBhIHJlYWQtb25seSBhbWRncHUgZHJpdmVyIHByaXZhdGUgZmxhZyAobm90IERSTSBmbGFn
KSwgd2hpbGUgYWRkaW5nIGEgbmV3IGZyZWVzeW5jIG1vZGUsIHdoaWNoIHdpbGwgdW5pcXVlbHkg
aWRlbnRpZnkgaWYgYSBtb2RlIGlzIEZTIG1vZGUuIE9uIG1vZGVzZXQsIHlvdSBoYXZlIHRvIGp1
c3QgY2hlY2sgdGhhdCBmbGFnLgo+Pgo+PiAtIEFzIHdlIGFyZSBub3QgaGFuZGxpbmcgYSBsb3Qg
b2YgbW9kZXMsIGNhY2hlIHRoZSBGUyBtb2RlcyBsb2NhbGx5IGFuZCBjaGVjayBvbmx5IGZyb20g
dGhhdCBEQiAoaW5zdGVhZCBvZiB0aGUgd2hvbGUgbW9kZWxpc3QpCj4+Cj4+IC0gQ2FjaGUgdGhl
IFZJQyBvZiB0aGUgbW9kZSAoaWYgYXZhaWxhYmxlKSBhbmQgdGhlbiBsb29rIGludG8gdGhlIFZJ
QyB0YWJsZSAobm90IHN1cmUgaWYgZGV0YWlsZWQgbW9kZXMgcHJvdmlkZSBWSUMsIGxpa2UgQ0VB
LTg2MSBtb2RlcykKPj4KPj4gb3Igc29tZXRoaW5nIGJldHRlciB0aGFuIHRoaXMuCj4+Cj4+IC0g
U2hhc2hhbmsKPiBJJ2QgcmF0aGVyIHdlIG5vdCBtYWtlIG1vZGUgbmFtZSBwYXJ0IG9mIGEgVUFQ
SSBvciB0byBpZGVudGlmeSBhIAo+ICJGcmVlU3luYyBtb2RlIi4gVGhpcyBpcyBhbHJlYWR5IGJl
aGluZCBhIG1vZHVsZSBvcHRpb24gYW5kIGZyb20gdGhlIAo+IGRyaXZlcidzIHBlcnNwZWN0aXZl
IHdlIG9ubHkgbmVlZCB0aGUgdGltaW5nIHRvIHVuZGVyc3RhbmQgd2hldGhlciBvciAKPiBub3Qg
d2UgY2FuIGRvIGFuIG9wdGltaXplZCBtb2Rlc2V0IHVzaW5nIEZyZWVTeW5jIGludG8gaXQuIERy
aXZlciAKPiBwcml2YXRlIGZsYWdzIGNhbiBvcHRpbWl6ZSB0aGUgY2hlY2sgYXdheSBidXQgaXQn
cyBvbmx5IGEgZmV3IAo+IGNvbXBhcmlzb25zIHNvIEkgZG9uJ3Qgc2VlIG11Y2ggYmVuZWZpdC4K
VGhlIG1vZHVsZSBwYXJhbWV0ZXIgaXMganVzdCB0byBjb250cm9sIHRoZSBhZGRpdGlvbiBvZiBm
cmVlc3luYyBtb2RlcyBvciBub3QsIGJ1dCB0aGF0IGRvZXNuJ3QgbGV0IHlvdSBkaWZmZXJlbnRp
YXRlIGJldHdlZW4gYSBnZW51aW5lIEVESUQgbW9kZSBvciBGcmVlc3luYyBtb2RlcyBhZGRlZCBi
eSB1cywgdG8gYWNjb21tb2RhdGUgZnJlZXN5bmMgc29sdXRpb24uIMKgCj4KPiBXZSB3aWxsIGFs
d2F5cyBuZWVkIHRvIHJlZmVyZW5jZSB0aGUgb3JpZ2luYWwgcHJlZmVycmVkIG1vZGUgcmVnYXJk
bGVzcyAKPiBvZiBob3cgdGhlIEZyZWVTeW5jIG1vZGUgaXMgaWRlbnRpZmllZCBzaW5jZSB0aGVy
ZSBjb3VsZCBiZSBhIGNhc2Ugd2hlcmUgCj4gd2UncmUgZW5hYmxpbmcgdGhlIENSVEMgZnJvbSBk
aXNhYmxlZCAtPiBlbmFibGVkLiBUaGUgZGlzcGxheSB3YXMgCj4gcHJldmlvdXNseSBibGFuayBh
bmQgd2UgbmVlZCB0byByZXByb2dyYW0gdGhlIE9URyB0aW1pbmcgdG8gdGhlIG1vZGUgCj4gdGhh
dCBkb2Vzbid0IGhhdmUgYW4gZXh0ZW5kZWQgZnJvbnQgcG9yY2guCgpJIHRoaW5rIHRoZXJlIGlz
IGEgZ2FwIGluIHVuZGVyc3RhbmRpbmcgbXkgY29tbWVudCBoZXJlLiBJZiB5b3Ugc2VlIHRoZSBj
dXJyZW50IGltcGxlbWVudCBvZiBmdW5jdGlvbiAiaXNfZnJlZXN5bmNfdmlkZW9fbW9kZSIsIHdo
YXQgaXQgZG9lcyBpcyBpdCBleHBsb3JlcyBhbGwgdGhlIG1vZGVzIGZyb20gdGhlIGNvbm5lY3Rv
cidzIHByb2JlZF9tb2RlcyBsaXN0LCBhbmQgY29tcGFyZXMgdGhlbSB3aXRoIHBvc3NpYmxlX2Zz
X21vZGVzLCBhbmQgZGVjaWRlcyBpZiB0aGlzIG1vZGUgaXMgYSBmcmVlc3luYyBtb2RlIG9yIG5v
dC4gTXkgcG9pbnQgaXMsIHdlIGhhdmUgYWxyZWFkeSBkb25lIHRoaXMgZXhlcmNpc2Ugb25jZSwg
d2hpbGUgd2Ugd2VyZSBhZGRpbmcgdGhlIGZyZWVzeW5jIG1vZGVzIGluIHRoZSBtb2RlIGxpc3Qg
YWxyZWFkeS4KCk5vdyBpZiB3ZSBjYW4gYWRkIGEgZHJpdmVyX3ByaXZhdGUgZmxhZywgb3Igc29t
ZSBpZGVudGlmaWNhdGlvbiBpbiB0aGUgbW9kZSwgd2UgZG9uJ3QgaGF2ZSB0byBkbyB0aGlzIHdo
b2xlIHRoaW5nIGFnYWluLgoKSXRzIGxpa2U6CgpXaGlsZSBhZGRpbmcgZnJlZXN5bmMgbW9kZXM6
CgotIGFkZF9mcmVlc3luY19tb2RlcyAoKQoKewoKwqDCoMKgIGdldF9wcmVmZXJyZWRfbW9kZSgp
CgrCoMKgwqAgcHJlcGFyZV9mcmVlc3luY19tb2RlX2Zyb21fcHJlZmVycmVkX21vZGVzKCkKCsKg
wqDCoCBhZGRfbmV3X2ZyZWVzeW5jX21vZGVfaW5fY29ubmVjdG9yX21vZGVsaXN0KCnCoCAvL0Fk
ZCBhIGRyaXZlciBwcml2YXRlIGZsYWcgaW4gdGhpcyBuZXcgZnJlZXN5bmMgbW9kZQoKfQoKCk5v
dywgYXMgdGhlIGRyaXZlciBpcyB0aGUgb25seSBzb3VyY2Ugb2YgdGhlIGZyZWVzeW5jIG1vZGVz
LCB3ZSBjYW4gbWFrZSB0aGUgaWRlbnRpZmllciBmdW5jdGlvbiBkdXJpbmcgdGhlIG1vZGVzZXQo
KSBjYW4gYmUgYXMgc21hbGwgYXM6CgotIGlzX2ZyZWVzeW5jX3ZpZGVvX21vZGUgKG1vZGUpCgp7
CgrCoMKgwqAgcmV0cnVuIChtb2RlLT5mbGFncyAmIGRyaXZlcl9wcml2YXRlX2ZsYWcpOwoKfQoK
ClBvaW50IGJlaW5nLCB0aGVyZSBpcyBubyBuZWVkIHRvIGRvIHRoZSBzYW1lIHRoaW5nIGFnYWlu
LCBpbiBvcmRlciB0byBpZGVudGlmeSwgaWYgYSBtb2RlIGlzIGZyZWVzeW5jIG1vZGUgb3Igbm90
LCBhcyB0aGUgZHJpdmVyIG9ubHkgaGFzIGFkZGVkIHRoZXNlIG1vZGVzLCBhbmQgaXQgc2hvdWxk
IGtub3cgd2hpY2ggYXJlIHRoZXNlIGZyZWVzeW5jIG1vZGVzLiDCoAoKLSBTaGFzaGFuawoKPiBS
ZWdhcmRzLAo+IE5pY2hvbGFzIEthemxhdXNrYXMKPgo+Pj4+PiArCWhpZ2hfbW9kZSA9IGdldF9o
aWdoZXN0X2ZyZWVzeW5jX21vZGUoYWNvbm5lY3RvciwgZmFsc2UpOwo+Pj4+PiArCWlmICghaGln
aF9tb2RlKQo+Pj4+PiArCQlyZXR1cm4gZmFsc2U7Cj4+Pj4+ICsKPj4+Pj4gKwlpZiAoaGlnaF9t
b2RlLT5jbG9jayA9PSAwIHx8Cj4+Pj4+ICsJICAgIGhpZ2hfbW9kZS0+aGRpc3BsYXkgIT0gbW9k
ZS0+aGRpc3BsYXkgfHwKPj4+Pj4gKwkgICAgaGlnaF9tb2RlLT5jbG9jayAhPSBtb2RlLT5jbG9j
ayB8fAo+Pj4+PiArCSAgICAhbW9kZSkKPj4+Pj4gKwkJcmV0dXJuIGZhbHNlOwo+Pj4+PiArCWVs
c2UKPj4+Pj4gKwkJcmV0dXJuIHRydWU7Cj4+Pj4+ICt9Cj4+Pj4+ICsKPj4+Pj4gICBzdGF0aWMg
c3RydWN0IGRjX3N0cmVhbV9zdGF0ZSAqCj4+Pj4+ICAgY3JlYXRlX3N0cmVhbV9mb3Jfc2luayhz
dHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAqYWNvbm5lY3RvciwKPj4+Pj4gICAJCSAgICAgICBj
b25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqZHJtX21vZGUsCj4+Pj4+IEBAIC01MjUzLDE3
ICs1Mjc3LDIxIEBAIGNyZWF0ZV9zdHJlYW1fZm9yX3Npbmsoc3RydWN0Cj4+Pj4+IGFtZGdwdV9k
bV9jb25uZWN0b3IgKmFjb25uZWN0b3IsCj4+Pj4+ICAgCWNvbnN0IHN0cnVjdCBkcm1fY29ubmVj
dG9yX3N0YXRlICpjb25fc3RhdGUgPQo+Pj4+PiAgIAkJZG1fc3RhdGUgPyAmZG1fc3RhdGUtPmJh
c2UgOiBOVUxMOwo+Pj4+PiAgIAlzdHJ1Y3QgZGNfc3RyZWFtX3N0YXRlICpzdHJlYW0gPSBOVUxM
Owo+Pj4+PiAtCXN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIG1vZGUgPSAqZHJtX21vZGU7Cj4+Pj4+
ICsJc3RydWN0IGRybV9kaXNwbGF5X21vZGUgc2F2ZWRfbW9kZSwgbW9kZSA9ICpkcm1fbW9kZTsK
Pj4+PiBIb3cgYWJvdXQgc2hpZnRpbmcgdGhpcyBkZWZpbml0aW9uIHRvIG5ldyBsaW5lIHRvIGZv
bGxvdyB0aGUgZXhpc3RpbmcKPj4+PiBjb252ZW50aW9uID8KPj4+IFN1cmUuCj4+Pgo+Pj4+PiAr
CXN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICpmcmVlc3luY19tb2RlID0gTlVMTDsKPj4+Pj4gICAJ
Ym9vbCBuYXRpdmVfbW9kZV9mb3VuZCA9IGZhbHNlOwo+Pj4+PiAgIAlib29sIHNjYWxlID0gZG1f
c3RhdGUgPyAoZG1fc3RhdGUtPnNjYWxpbmcgIT0gUk1YX09GRikgOiBmYWxzZTsKPj4+Pj4gICAJ
aW50IG1vZGVfcmVmcmVzaDsKPj4+Pj4gICAJaW50IHByZWZlcnJlZF9yZWZyZXNoID0gMDsKPj4+
Pj4gKwlib29sIGlzX2ZzX3ZpZF9tb2RlID0gMDsKPj4+Pj4gICAjaWYgZGVmaW5lZChDT05GSUdf
RFJNX0FNRF9EQ19EQ04pCj4+Pj4+ICAgCXN0cnVjdCBkc2NfZGVjX2RwY2RfY2FwcyBkc2NfY2Fw
czsKPj4+Pj4gICAjZW5kaWYKPj4+Pj4gICAJdWludDMyX3QgbGlua19iYW5kd2lkdGhfa2JwczsK
Pj4+Pj4gLQo+Pj4+PiAgIAlzdHJ1Y3QgZGNfc2luayAqc2luayA9IE5VTEw7Cj4+Pj4+ICsKPj4+
Pj4gKwltZW1zZXQoJnNhdmVkX21vZGUsIDAsIHNpemVvZihzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9k
ZSkpOwo+Pj4+PiArCj4+Pj4+ICAgCWlmIChhY29ubmVjdG9yID09IE5VTEwpIHsKPj4+Pj4gICAJ
CURSTV9FUlJPUigiYWNvbm5lY3RvciBpcyBOVUxMIVxuIik7Cj4+Pj4+ICAgCQlyZXR1cm4gc3Ry
ZWFtOwo+Pj4+PiBAQCAtNTMxNiwyMCArNTM0NCwzMyBAQCBjcmVhdGVfc3RyZWFtX2Zvcl9zaW5r
KHN0cnVjdAo+Pj4+PiBhbWRncHVfZG1fY29ubmVjdG9yICphY29ubmVjdG9yLAo+Pj4+PiAgIAkJ
ICovCj4+Pj4+ICAgCQlEUk1fREVCVUdfRFJJVkVSKCJObyBwcmVmZXJyZWQgbW9kZSBmb3VuZFxu
Iik7Cj4+Pj4+ICAgCX0gZWxzZSB7Cj4+Pj4+ICsJCWlzX2ZzX3ZpZF9tb2RlID0gaXNfZnJlZXN5
bmNfdmlkZW9fbW9kZSgmbW9kZSwKPj4+Pj4gYWNvbm5lY3Rvcik7Cj4+Pj4+ICsJCWlmIChpc19m
c192aWRfbW9kZSkgewo+Pj4+PiArCQkJZnJlZXN5bmNfbW9kZSA9Cj4+Pj4+IGdldF9oaWdoZXN0
X2ZyZWVzeW5jX21vZGUoYWNvbm5lY3RvciwgZmFsc2UpOwo+Pj4+PiArCQkJaWYgKGZyZWVzeW5j
X21vZGUpIHsKPj4+PiBBcyB0aGUgZnJlZXN5bmMgbW9kZXMgYXJlIGJlaW5nIGFkZGVkIGJ5IHRo
ZSBkcml2ZXIsIGFuZCB3ZSBoYXZlCj4+Pj4gcGFzc2VkIG9uZSBjaGVjayB3aGljaCBzYXlzIGlz
X2ZzX3ZpZF9tb2RlLCB3aWxsIGl0IGV2ZXIgYmUgdGhlIGNhc2UKPj4+PiB3aGVyZSBmcmVlc3lu
Y19tb2RlID09IE5VTEwgPyBJZGVhbGx5IHdlIHNob3VsZCBnZXQgYXRsZWFzdCBvbmUgbW9kZQo+
Pj4+IGVxdWFsIHRvIHRoaXMgaXNuJ3QgaXQgPyBpbiB0aGF0IGNhc2Ugd2UgY2FuIGRyb3Agb25l
IGlmICgpIGNoZWNrLgo+Pj4gWWVzLCB0aGFua3MgZm9yIGNhdGNoaW5nIHRoaXMuIFdpbGwgZml4
Lgo+Pj4KPj4+Cj4+PiAtLQo+Pj4KPj4+IFJlZ2FyZHMsCj4+PiBBdXJhYmluZG8gUGlsbGFpCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
