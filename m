Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B888326A43
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Feb 2021 23:52:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A3856E452;
	Fri, 26 Feb 2021 22:52:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2072.outbound.protection.outlook.com [40.107.244.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29AE46E452;
 Fri, 26 Feb 2021 22:52:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=INSLrAFL1QEAxm8dPta6lYqOdZSLHCbncKxpfNdKkLDof8Y25LpIZdJsdQrZLQEORMcSK1Ol9JGuPFhIAB2vAy8RG543RW0xxb1Fu/kWC4q3PBCZD+LJSn8IaDWs1cioOsKX01qHvs+GJnueUfVvEfnWxvlaprukGGFfDMDo5ftgTXyNcJkVzrQavlmhWOt+cukDqO+XdMcFkbf/ZusxVkP6zJXsdmPRmyo3RirlAvNb3slEjTM3NRjJVc1xERFum9hzOTg8T2gkKrDS2QpLJCU+6jTtcISy/pAZlC4FGphkOOjHBBcxVYofh0jL35mEy/SxhkPikKi1ZfTKgpXnnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7rEtTuEMN+pnkQdBy+Jj//MSnnOEkzZteA1T/EVbs4=;
 b=ob6vxwaxz65aQuH84ZgGm13DRElO/3pzJxTdPqH8Xmgwyax6PW65sQBBQuP6JNAVQ8m8M8/N0BQCW6k2wIOoi/7TFYC7Cjaqw4wwyubS6+4STPFwX1QRGSVa30HQPyCzLRfiZCtRo5YZ/fhbqddH1aJVf1DTt/wdkzW7bCMfFow6CZwPW2Gkhuv1A979v4ED86lCYkbN8QggCBhpic2w1PsgDha9iw0o8wsrsdEhB2iWd68eABLCgK4QrBkQw1bNKzrbFBrdXql6KuQ7Ze+kl9gwFpeqL42fNihqvKOzyo0QFB0Wc9FV6mVZxHOxe/IMfPuduSPF1CCDn1GhfgnlCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7rEtTuEMN+pnkQdBy+Jj//MSnnOEkzZteA1T/EVbs4=;
 b=BsvWj9e1oZDGoreonRrElSVGk5A5aCq548Br2gzi0dFTGr9qesWXO0sH0/GDvBCByKlB7UgH33XGaG/G/DPVS7/YTvmz0s1J3cxsB5jSNE3jZxVcxdxrE5YpYRCERJFvin0+ZzmYRSmMdVfDayKjtmlvy54OPCDSwRMN2tbFhQM=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4486.namprd12.prod.outlook.com (2603:10b6:208:263::23)
 by MN2PR12MB4583.namprd12.prod.outlook.com (2603:10b6:208:26e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.32; Fri, 26 Feb
 2021 22:52:29 +0000
Received: from MN2PR12MB4486.namprd12.prod.outlook.com
 ([fe80::6c90:6445:a4d5:6ff6]) by MN2PR12MB4486.namprd12.prod.outlook.com
 ([fe80::6c90:6445:a4d5:6ff6%4]) with mapi id 15.20.3890.020; Fri, 26 Feb 2021
 22:52:29 +0000
Subject: Re: [PATCH 2/2] drm/amdgpu/display: buffer INTERRUPT_LOW_IRQ_CONTEXT
 interrupt work
To: "Chen, Xiaogang" <Xiaogang.Chen@amd.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Wentland, Harry" <Harry.Wentland@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
References: <1609740098-32603-1-git-send-email-xiaogang.chen@amd.com>
 <1609740098-32603-2-git-send-email-xiaogang.chen@amd.com>
 <51a8727c-1ad0-8e7f-8c07-ed0b4bbed7a5@amd.com>
 <6ba05f63-12f2-73c5-33c5-4b29c6166d8b@amd.com>
 <9ff0ccbb-c567-2128-ec84-6803f0fa2df5@amd.com>
 <f8d55f35-c97e-621c-a299-2f1342f3f230@amd.com>
 <0c78acd2-536d-4abd-4758-8e84a197171e@amd.com>
 <338914dc-61e7-37e1-e588-bb6c4c8b8f9e@amd.com>
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
Message-ID: <e95ea7ee-c183-2719-8f41-9e2133729da3@amd.com>
Date: Fri, 26 Feb 2021 17:52:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <338914dc-61e7-37e1-e588-bb6c4c8b8f9e@amd.com>
Content-Language: en-US
X-Originating-IP: [165.204.84.11]
X-ClientProxiedBy: BN9PR03CA0355.namprd03.prod.outlook.com
 (2603:10b6:408:f6::30) To MN2PR12MB4486.namprd12.prod.outlook.com
 (2603:10b6:208:263::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.4.12] (165.204.84.11) by
 BN9PR03CA0355.namprd03.prod.outlook.com (2603:10b6:408:f6::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Fri, 26 Feb 2021 22:52:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ebbc0f6a-005a-4fb7-eea5-08d8daa93178
X-MS-TrafficTypeDiagnostic: MN2PR12MB4583:
X-MS-Exchange-MinimumUrlDomainAge: lists.freedesktop.org#0
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4583433290171ABA9705747C8B9D9@MN2PR12MB4583.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fcBNYIdN6HzsnHomEv8Ju/cY6wOwlF3MNPfv44CE4v7x3groZeuAYWu2RjrWmzfLlAszQ0fqoh/8k5WXyvYU7Yli7CVGgW3rjKtetx3yhcpFA0Lx2L9wY6xkJqGrxi+811PtNN96hTsMtTdYb19BNIh7NeSf9GIT7FkMu/PUZyi+AvyL+rmF82m6iBhWA05k8JMKBURtpmcux0iZk3xH/aphlN2lT/5FnuG9itWtLXaL6K3fayegXukTsiaBDWnY94OxmApKdTVBGdhQnhvIedZ5puQDlvo3JNMu4/3+DvLjtIq4rRcnF0yMRMyNX5/xH7ie17hldOKlmgzRGhugo9RNA92AUcrVjTUgMUNNMXLur2yzjSCQqDEezsDr8PflFyMrXH0ofs6fR/3DpYiydDfMtZpc2jddFHKinw/UMaVBrQpz0VBePk+f/GnEaLR5KZ8bsq7rBtvLWBsKJnO720eKbnRVPTVLVibrwpusFWBRbGOLRiKF9KO3/4/nKtIP7JhKKKywYYcvv/fn75ZvNw9aVSqhjGiaVLrkgLbc2PgM/l9/+PFq2Ros/+IIyA6/31eOlBagZ4+EekZwjysBQdMzmWMg7FftHzAvXlIoZG7jvriR/4TWGgjwN1JIgdIU7ap+CV1iVRVIw54LS8rHFrlEHKBvndtDXTEsAsc930O+erwUUJYdTs9lrBFUiXnTnxlLIz6Jts91e+unGiYMBw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(6486002)(921005)(16526019)(53546011)(36756003)(8676002)(66476007)(186003)(5660300002)(31696002)(66946007)(26005)(956004)(30864003)(16576012)(2906002)(2616005)(110136005)(966005)(44832011)(316002)(31686004)(66556008)(86362001)(83380400001)(478600001)(6636002)(8936002)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NkRXMFFKUHpCdlRWL0FzRno0dlh4ZUFRaXA1WTIyU0dHcFd5TDJIME1EVHZz?=
 =?utf-8?B?WVJCQkJjNitudk92VXg2Z1lUTzI5L3F2VnRPd0dseFF3cUhiMXVWOTRqeXRu?=
 =?utf-8?B?aFA0OGpDeExnc0wzMUsvOHlBc01vZFYwRmhOTnFWbkpucEJycjBEWnFSaUd3?=
 =?utf-8?B?VFZsR3hGaXlNNzEvUG9wVG5KTFZSc210eTZCUEZlZEJuMHd6aXg2RXVHMXdU?=
 =?utf-8?B?VitNZi9MK2x6ZEU1VnlJcGlnL2pLWm40cE8xdk90T2NmdExYbUMzRTdZanha?=
 =?utf-8?B?aVdPN3ZueXFhaUJaVWpVWHlUNGJhUVdtbUl1RnRtL21GUTRTRTF6a1Q4UTVB?=
 =?utf-8?B?cGJLMGJ4aTBXNXlIcDFkdGxCUXlGbWl3Y25saU1XZzNBVG5hTENSZkNva2NK?=
 =?utf-8?B?emlERzlLOVpLVmkxZ2hBY2h5NG9xOGRCcCsvcGJ5NFloQlMrK0NOcWNtb2gv?=
 =?utf-8?B?WmR2RjhKMEVaeWxPZTJ4cWQ1ZWw3bVpnOWxMZ0pyUVNFS05mUEtFRGs3YTdr?=
 =?utf-8?B?OW9JM3pXMlJrUVp2UEpCdC9Od1dqc1pwZkl5SmR0N1hZbXloa2JWdDVVNDJV?=
 =?utf-8?B?NSt3Nzc5c3l3L0NMeHh0MzRucFJXUHZYZHZRbFNSQ0oxOGxIUEFZUk5IVFhu?=
 =?utf-8?B?NGpmdWNsYTF2NnRpM2hQUHJoUFdGT05KSWVBemFIcld2T1FqbEtyMFJhbDls?=
 =?utf-8?B?MFFuL3doZWJNNHBWNWhxeHJnOTZIQWU3Mnh3bEhJODEveitpMFpCRXVPdDkr?=
 =?utf-8?B?N0VqTmFHbzlvNEJwWlBiNkhXaGVlNFI1WCt5dEtmTE9WT1FFT3JUOFlKL05o?=
 =?utf-8?B?Zk10NlNpekFTMHBtU3EwTFFGTGlHNlBEQVVBOTRTYVpVMHRjN1Q4L0x1bGsy?=
 =?utf-8?B?bTZFODk5SzhsQUFib2wrL1FhUWNNN3BOZjRsQlMraml2Z0Y4WFRNbFpmT2Fv?=
 =?utf-8?B?a2k5ekY3K2FJMExXWjFzam1uWmFRRURnT3V2QWI2ekZMc1ZSY08zeHZHc2Nk?=
 =?utf-8?B?bXZaZnZqR1hlazZnS1NtK2dqbXIrMWdQQjNadk5XdGJoY3N2eTRYWWxqN2RH?=
 =?utf-8?B?YlUxYlVKQ2wxWEZmRDRMMDdzOHhMUmFMVlp4aFpMQkVWMU5XbWh5dHdyZFJm?=
 =?utf-8?B?SjZuOG1WaUtJWUJsbUJnUEFTZ1podkVuSXR2amE2Tkt5U1dVcVlhTmdyRGt5?=
 =?utf-8?B?TlBxVFBVNndPbVZqcjhKTzdhNWVZU2pzbG5NS2c5TnNxNzZrK1NLWUN0ZXVU?=
 =?utf-8?B?L0tPRjBTRnZyTno4YjVVZy9reXQzZkhiRlQvU2lFQ3MzRkVJSXlqQ091dmJL?=
 =?utf-8?B?T0x5aDBLUXRSdEZobGVLVlRLODNQL2FPSmtnajRCNjlMK0R1ZUxsbE5RcUdC?=
 =?utf-8?B?WVJYQzdmOWRVak9pdlFQVGQzQ1I5ZjdDak00d0s3cDJ2RVFoZGMyTW5TQk84?=
 =?utf-8?B?Uk5ISG1sY1VVTEMzNUtpT3hteUJTcnhFZjMvREQ3T1pVdnZDZWNBWGhLaTlk?=
 =?utf-8?B?eEIydnNvNmtrdFBzMXNVTnk5dWpWR3l2N3Z2amFkczdGWVBUczdEdnVxdnlJ?=
 =?utf-8?B?ZS9tZHNJVlNWaXVmUnVFamxWdlJyK0ZhcEpvVG5udFF2ZmUzb2daYXRQRUNq?=
 =?utf-8?B?MUZyekRqOE9aeSs2UWFWczVQNzU3UzIxeXhrNDBVZVllWnpNWkVycy9Yalgx?=
 =?utf-8?B?WTVxZEtBekdrVzhWOE01NEsvUGpKRlg4NUw1bmFTUGphQ2xSM0xUdTZuNlB5?=
 =?utf-8?Q?xw933E6E+oZjdTBsBg9Oo3y+b111fE+NE3wv/0Y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebbc0f6a-005a-4fb7-eea5-08d8daa93178
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2021 22:52:29.0308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AI1H/zbm1iwyyhfYkIEBc4ht4Nsc+Ssms93No9+71H+qMnVLltLgS7zDPIyefSI1s8hnHwf9fri2Il0GAPYnhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4583
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

CgpPbiAyMDIxLTAxLTIyIDM6NTUgcC5tLiwgQ2hlbiwgWGlhb2dhbmcgd3JvdGU6Cj4gT24gMS8x
OS8yMDIxIDQ6MjkgUE0sIEdyb2R6b3Zza3ksIEFuZHJleSB3cm90ZToKPj4KPj4gT24gMS8xNS8y
MSAyOjIxIEFNLCBDaGVuLCBYaWFvZ2FuZyB3cm90ZToKPj4+IE9uIDEvMTQvMjAyMSAxOjI0IEFN
LCBHcm9kem92c2t5LCBBbmRyZXkgd3JvdGU6Cj4+Pj4KPj4+PiBPbiAxLzE0LzIxIDEyOjExIEFN
LCBDaGVuLCBYaWFvZ2FuZyB3cm90ZToKPj4+Pj4gT24gMS8xMi8yMDIxIDEwOjU0IFBNLCBHcm9k
em92c2t5LCBBbmRyZXkgd3JvdGU6Cj4+Pj4+PiBPbiAxLzQvMjEgMTowMSBBTSwgWGlhb2dhbmcu
Q2hlbiB3cm90ZToKPj4+Pj4+PiBGcm9tOiBYaWFvZ2FuZyBDaGVuIDx4aWFvZ2FuZy5jaGVuQGFt
ZC5jb20+Cj4+Pj4+Pj4KPj4+Pj4+PiBhbWRncHUgRE0gaGFuZGxlcyBJTlRFUlJVUFRfTE9XX0lS
UV9DT05URVhUIGludGVycnVwdChocGQsIAo+Pj4+Pj4+IGhwZF9yeCkgYnkKPj4+Pj4+PiB1c2lu
ZyB3b3JrIHF1ZXVlIGFuZCB1c2VzIHNpbmdsZSB3b3JrX3N0cnVjdC4gSWYgcHJldmlvdXMgaW50
ZXJydXB0Cj4+Pj4+Pj4gaGFzIG5vdCBiZWVuIGhhbmRsZWQgbmV3IGludGVycnVwdHMoc2FtZSB0
eXBlKSB3aWxsIGJlIGRpc2NhcmRlZCBhbmQKPj4+Pj4+PiBkcml2ZXIganVzdCBzZW5kcyAiYW1k
Z3B1X2RtX2lycV9zY2hlZHVsZV93b3JrIEZBSUxFRCIgbWVzc2FnZSBvdXQuCj4+Pj4+Pj4gSWYg
c29tZSBpbXBvcnRhbnQgaHBkLCBocGRfcnggcmVsYXRlZCBpbnRlcnJ1cHRzIGFyZSBtaXNzZWQg
YnkgCj4+Pj4+Pj4gZHJpdmVyCj4+Pj4+Pj4gdGhlIGhvdCAodW4pcGx1ZyBkZXZpY2VzIG1heSBj
YXVzZSBzeXN0ZW0gaGFuZyBvciB1bnN0YWJsZSwgc3VjaCBhcwo+Pj4+Pj4+IHN5c3RlbSByZXN1
bWVzIGZyb20gUzMgc2xlZXAgd2l0aCBtc3QgZGV2aWNlIGNvbm5lY3RlZC4KPj4+Pj4+Pgo+Pj4+
Pj4+IFRoaXMgcGF0Y2ggZHluYW1pY2FsbHkgYWxsb2NhdGVzIG5ldyBhbWRncHVfZG1faXJxX2hh
bmRsZXJfZGF0YSBmb3IKPj4+Pj4+PiBuZXcgaW50ZXJydXB0cyBpZiBwcmV2aW91cyBJTlRFUlJV
UFRfTE9XX0lSUV9DT05URVhUIGludGVycnVwdCB3b3JrCj4+Pj4+Pj4gaGFzIG5vdCBiZWVuIGhh
bmRsZWQuIFNvIHRoZSBuZXcgaW50ZXJydXB0IHdvcmtzIGNhbiBiZSBxdWV1ZWQgdG8gCj4+Pj4+
Pj4gdGhlCj4+Pj4+Pj4gc2FtZSB3b3JrcXVldWVfc3RydWN0LCBpbnN0ZWFkIGRpc2NhcmQgdGhl
IG5ldyBpbnRlcnJ1cHRzLgo+Pj4+Pj4+IEFsbCBhbGxvY2F0ZWQgYW1kZ3B1X2RtX2lycV9oYW5k
bGVyX2RhdGEgYXJlIHB1dCBpbnRvIGEgc2luZ2xlIAo+Pj4+Pj4+IGxpbmtlZAo+Pj4+Pj4+IGxp
c3QgYW5kIHdpbGwgYmUgcmV1c2VkIGFmdGVyLgo+Pj4+Pj4KPj4+Pj4+IEkgYmVsaWV2ZSB0aGlz
IGNyZWF0ZXMgYSBwb3NzaWJsZSBjb25jdXJyZW5jeSBiZXR3ZWVuIGFscmVhZHkKPj4+Pj4+IGV4
ZWN1dGluZyB3b3JrIGl0ZW0KPj4+Pj4+IGFuZCB0aGUgbmV3IGluY29taW5nIG9uZSBmb3Igd2hp
Y2ggeW91IGFsbG9jYXRlIGEgbmV3IHdvcmsgaXRlbSBvbgo+Pj4+Pj4gdGhlIGZseS4gV2hpbGUK
Pj4+Pj4+IGhhbmRsZV9ocGRfaXJxIGlzIHNlcmlhbGl6ZWQgd2l0aCBhY29ubmVjdG9yLT5ocGRf
bG9jayBJIGFtIHNlZWluZwo+Pj4+Pj4gdGhhdCBmb3IgaGFuZGxlX2hwZF9yeF9pcnEKPj4+Pj4+
IGl0J3Mgbm90IGxvY2tlZCBmb3IgTVNUIHVzZSBjYXNlICh3aGljaCBpcyB0aGUgbW9zdCBmcmVx
dWVudGx5IHVzZWQKPj4+Pj4+IHdpdGggdGhpcyBpbnRlcnJ1cHQpLsKgIERpZCB5b3UKPj4+Pj4+
IHZlcmlmaWVkIHRoYXQgaGFuZGxlX2hwZF9yeF9pcnEgaXMgcmVlbnRyYW50ID8KPj4+Pj4+Cj4+
Pj4+IGhhbmRsZV9ocGRfcnhfaXJxIGlzIHB1dCBhdCBhIHdvcmsgcXVldWUuIEl0cyBleGVjdXRp
b24gaXMgc2VyaWFsaXplZAo+Pj4+PiBieSB0aGUgd29yayBxdWV1ZS4gU28gdGhlcmUgaXMgbm8g
cmVlbnRyYW50Lgo+Pj4+Pgo+Pj4+IFlvdSBhcmUgdXNpbmcgc3lzdGVtX2hpZ2hwcmlfd3Egd2hp
Y2ggaGFzIHRoZSBwcm9wZXJ0eSB0aGF0IGl0IGhhcwo+Pj4+IG11bHRpcGxlIHdvcmtlcnMgdGhy
ZWFkIHBvb2wgc3ByZWFkIGFjcm9zcyBhbGwgdGhlCj4+Pj4gYWN0aXZlIENQVXMsIHNlZSBhbGwg
d29yayBxdWV1ZSBkZWZpbml0aW9ucyBoZXJlCj4+Pj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5j
b20vbGludXgvdjUuMTEtcmMzL3NvdXJjZS9pbmNsdWRlL2xpbnV4L3dvcmtxdWV1ZS5oI0wzNTgg
Cj4+Pj4KPj4+PiBJIGJlbGVpZXZlIHRoYXQgd2hhdCB5b3Ugc2F5aW5nIGFib3V0IG5vIGNoYW5j
ZSBvZiByZWVudHJuYWN5IHdvdWxkIGJlCj4+Pj4gY29ycmVjdCBpZiBpdCB3b3VsZCBiZSBzYW1l
IHdvcmsgaXRlbSBkZXF1ZXVlZCBmb3IgZXhlY3V0aW9uCj4+Pj4gd2hpbGUgcHJldmlvdXMgaW5z
dGFuY2UgaXMgc3RpbGwgcnVubmluZywgc2VlIHRoZSBleHBsYW5hdGlvbiBoZXJlIC0KPj4+PiBo
dHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS4xMS1yYzMvc291cmNlL2tlcm5lbC93
b3JrcXVldWUuYyNMMTQzNS4gCj4+Pj4KPj4+PiBOb24gcmVlbnRyYW5jeSBpcyBndWFyYW50ZWVk
IG9ubHkgZm9yIHRoZSBzYW1lIHdvcmsgaXRlbS4gSWYgeW91IHdhbnQKPj4+PiBub24gcmVlbnRy
YW5jeSAoZnVsbCBzZXJpYWxpenRpb24pIGZvciBkaWZmZXJlbnQgd29yayBpdGVtcyB5b3Ugc2hv
dWxkCj4+Pj4gY3JlYXRlCj4+Pj4geW91IG93biBzaW5nbGUgdGhyZWFkZWQgd29yay1xdWV1ZSB1
c2luZyBjcmVhdGVfc2luZ2xldGhyZWFkX3dvcmtxdWV1ZQo+Pj4+Cj4+Pj4KPj4+IFRoYW5rIHlv
dS4gSSB0aGluayB0aGUgZWFzaWVzdCB3YXkgaXMgdXNpbmcgYWNvbm5lY3Rvci0+aHBkX2xvY2sg
YXQKPj4+IGhhbmRsZV9ocGRfcnhfaXJxIHRvIGxvY2sgZm9yIGRjX2xpbmstPnR5cGUgPT0gZGNf
Y29ubmVjdGlvbl9tc3RfYnJhbmNoCj4+PiBjYXNlLCByaWdodD8gSSB3aWxsIGRvIHRoYXQgYXQg
bmV4dCB2ZXJzaW9uIGlmIHlvdSB0aGluayBpdCBpcyBvay4KPj4KPj4KPj4gSSBhbSBub3Qgc3Vy
ZSB3aGF0IGFyZSB0aGUgY29uc2VxdWVuY2VzIG9mIG9mIHVzaW5nIGhwZCBsb2NrIHRoZXJlIHdp
dGgKPj4gcmVnYXJkIHRvIG90aGVyIGxvY2tzIGFjcXVpcmVkIGluIERSTSBNU1QgY29kZSBkdXJp
bmcgTVNUIHJlbGF0ZWQgSFBEIAo+PiB0cmFuc2FjdGlvbnMgc2luY2UKPj4gaSBoYXZlbid0IGRl
YWx0IHdpdGggdGhpcyBmb3IgYSB2ZXJ5IGxvbmcgdGltZS4gTWF5YmUgSGFycnkgb3IgTmljayAK
Pj4gY2FuIGFkdmlzZSBvbiB0aGlzID8KPj4KPj4gQW5kcmV5Cj4+Cj4gSGkgSGFycnksIE5pY2s6
IHdvdWxkIHlvdSBvciBzb21lb25lIGdpdmUgcmV2aWV3IG9uIHRoaXMgcGF0Y2g/Cj4gCj4gVGhh
bmtzCj4gCj4gWGlhb2dhbmcKPiAKPj4+Cj4+Pj4+IGFtZGdwdV9kbV9pcnFfc2NoZWR1bGVfd29y
ayBkb2VzIHF1ZXVpbmcgb2Ygd29yayhwdXQKPj4+Pj4gaGFuZGxlX2hwZF9yeF9pcnEgaW50byB3
b3JrIHF1ZXVlKS4gVGhlIGZpcnN0IGNhbGwgaXMKPj4+Pj4gZG1faXJxX3dvcmtfZnVuYywgdGhl
biBjYWxsIGhhbmRsZV9ocGRfcnhfaXJxLgo+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFhpYW9nYW5n
IENoZW4gPHhpYW9nYW5nLmNoZW5AYW1kLmNvbT4KPj4+Pj4+PiAtLS0KPj4+Pj4+PiDCoMKgIGRy
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmjCoCB8wqAgMTQg
Ky0tCj4+Pj4+Pj4gwqDCoCAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtX2lycS5jwqAgfCAxMTQKPj4+Pj4+PiArKysrKysrKysrKysrKy0tLS0tLS0KPj4+Pj4+PiDC
oMKgIDIgZmlsZXMgY2hhbmdlZCwgODAgaW5zZXJ0aW9ucygrKSwgNDggZGVsZXRpb25zKC0pCj4+
Pj4+Pj4KPj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG0uaAo+Pj4+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG0uaAo+Pj4+Pj4+IGluZGV4IGM5ZDgyYjkuLjczMGU1NDAgMTAw
NjQ0Cj4+Pj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG0uaAo+Pj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtLmgKPj4+Pj4+PiBAQCAtNjksMTggKzY5LDYgQEAgc3RydWN0IGNvbW1v
bl9pcnFfcGFyYW1zIHsKPj4+Pj4+PiDCoMKgIH07Cj4+Pj4+Pj4gwqDCoCDCoCAvKioKPj4+Pj4+
PiAtICogc3RydWN0IGlycV9saXN0X2hlYWQgLSBMaW5rZWQtbGlzdCBmb3IgbG93IGNvbnRleHQg
SVJRIGhhbmRsZXJzLgo+Pj4+Pj4+IC0gKgo+Pj4+Pj4+IC0gKiBAaGVhZDogVGhlIGxpc3RfaGVh
ZCB3aXRoaW4gJnN0cnVjdCBoYW5kbGVyX2RhdGEKPj4+Pj4+PiAtICogQHdvcms6IEEgd29ya19z
dHJ1Y3QgY29udGFpbmluZyB0aGUgZGVmZXJyZWQgaGFuZGxlciB3b3JrCj4+Pj4+Pj4gLSAqLwo+
Pj4+Pj4+IC1zdHJ1Y3QgaXJxX2xpc3RfaGVhZCB7Cj4+Pj4+Pj4gLcKgwqDCoCBzdHJ1Y3QgbGlz
dF9oZWFkIGhlYWQ7Cj4+Pj4+Pj4gLcKgwqDCoCAvKiBJbiBjYXNlIHRoaXMgaW50ZXJydXB0IG5l
ZWRzIHBvc3QtcHJvY2Vzc2luZywgJ3dvcmsnIHdpbGwKPj4+Pj4+PiBiZSBxdWV1ZWQqLwo+Pj4+
Pj4+IC3CoMKgwqAgc3RydWN0IHdvcmtfc3RydWN0IHdvcms7Cj4+Pj4+Pj4gLX07Cj4+Pj4+Pj4g
LQo+Pj4+Pj4+IC0vKioKPj4+Pj4+PiDCoMKgwqAgKiBzdHJ1Y3QgZG1fY29tcHJlc3Nvcl9pbmZv
IC0gQnVmZmVyIGluZm8gdXNlZCBieSBmcmFtZSBidWZmZXIKPj4+Pj4+PiBjb21wcmVzc2lvbgo+
Pj4+Pj4+IMKgwqDCoCAqIEBjcHVfYWRkcjogTU1JTyBjcHUgYWRkcgo+Pj4+Pj4+IMKgwqDCoCAq
IEBib19wdHI6IFBvaW50ZXIgdG8gdGhlIGJ1ZmZlciBvYmplY3QKPj4+Pj4+PiBAQCAtMjcwLDcg
KzI1OCw3IEBAIHN0cnVjdCBhbWRncHVfZGlzcGxheV9tYW5hZ2VyIHsKPj4+Pj4+PiDCoMKgwqDC
oMKgwqDCoCAqIE5vdGUgdGhhdCBoYW5kbGVycyBhcmUgY2FsbGVkIGluIHRoZSBzYW1lIG9yZGVy
IGFzIHRoZXkgCj4+Pj4+Pj4gd2VyZQo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgICogcmVnaXN0ZXJl
ZCAoRklGTykuCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgKi8KPj4+Pj4+PiAtwqDCoMKgIHN0cnVj
dCBpcnFfbGlzdF9oZWFkCj4+Pj4+Pj4gaXJxX2hhbmRsZXJfbGlzdF9sb3dfdGFiW0RBTF9JUlFf
U09VUkNFU19OVU1CRVJdOwo+Pj4+Pj4+ICvCoMKgwqAgc3RydWN0IGxpc3RfaGVhZAo+Pj4+Pj4+
IGlycV9oYW5kbGVyX2xpc3RfbG93X3RhYltEQUxfSVJRX1NPVVJDRVNfTlVNQkVSXTsKPj4+Pj4+
PiDCoMKgIMKgwqDCoMKgwqAgLyoqCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgKiBAaXJxX2hhbmRs
ZXJfbGlzdF9oaWdoX3RhYjoKPj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faXJxLmMKPj4+Pj4+PiBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2lycS5jCj4+Pj4+Pj4gaW5kZXgg
MzU3Nzc4NS4uYWRhMzQ0YSAxMDA2NDQKPj4+Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9pcnEuYwo+Pj4+Pj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2lycS5jCj4+Pj4+Pj4gQEAg
LTgyLDYgKzgyLDcgQEAgc3RydWN0IGFtZGdwdV9kbV9pcnFfaGFuZGxlcl9kYXRhIHsKPj4+Pj4+
PiDCoMKgwqDCoMKgwqAgc3RydWN0IGFtZGdwdV9kaXNwbGF5X21hbmFnZXIgKmRtOwo+Pj4+Pj4+
IMKgwqDCoMKgwqDCoCAvKiBEQUwgaXJxIHNvdXJjZSB3aGljaCByZWdpc3RlcmVkIGZvciB0aGlz
IGludGVycnVwdC4gKi8KPj4+Pj4+PiDCoMKgwqDCoMKgwqAgZW51bSBkY19pcnFfc291cmNlIGly
cV9zb3VyY2U7Cj4+Pj4+Pj4gK8KgwqDCoCBzdHJ1Y3Qgd29ya19zdHJ1Y3Qgd29yazsKPj4+Pj4+
PiDCoMKgIH07Cj4+Pj4+Pj4gwqDCoCDCoCAjZGVmaW5lIERNX0lSUV9UQUJMRV9MT0NLKGFkZXYs
IGZsYWdzKSBcCj4+Pj4+Pj4gQEAgLTExMSwyMCArMTEyLDEwIEBAIHN0YXRpYyB2b2lkIGluaXRf
aGFuZGxlcl9jb21tb25fZGF0YShzdHJ1Y3QKPj4+Pj4+PiBhbWRncHVfZG1faXJxX2hhbmRsZXJf
ZGF0YSAqaGNkLAo+Pj4+Pj4+IMKgwqDCoCAqLwo+Pj4+Pj4+IMKgwqAgc3RhdGljIHZvaWQgZG1f
aXJxX3dvcmtfZnVuYyhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCj4+Pj4+Pj4gwqDCoCB7Cj4+
Pj4+Pj4gLcKgwqDCoCBzdHJ1Y3QgaXJxX2xpc3RfaGVhZCAqaXJxX2xpc3RfaGVhZCA9Cj4+Pj4+
Pj4gLcKgwqDCoMKgwqDCoMKgIGNvbnRhaW5lcl9vZih3b3JrLCBzdHJ1Y3QgaXJxX2xpc3RfaGVh
ZCwgd29yayk7Cj4+Pj4+Pj4gLcKgwqDCoCBzdHJ1Y3QgbGlzdF9oZWFkICpoYW5kbGVyX2xpc3Qg
PSAmaXJxX2xpc3RfaGVhZC0+aGVhZDsKPj4+Pj4+PiAtwqDCoMKgIHN0cnVjdCBhbWRncHVfZG1f
aXJxX2hhbmRsZXJfZGF0YSAqaGFuZGxlcl9kYXRhOwo+Pj4+Pj4+IC0KPj4+Pj4+PiAtwqDCoMKg
IGxpc3RfZm9yX2VhY2hfZW50cnkoaGFuZGxlcl9kYXRhLCBoYW5kbGVyX2xpc3QsIGxpc3QpIHsK
Pj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgRFJNX0RFQlVHX0tNUygiRE1fSVJROiB3b3JrX2Z1bmM6
IGZvciBkYWxfc3JjPSVkXG4iLAo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgaGFuZGxlcl9kYXRhLT5pcnFfc291cmNlKTsKPj4+Pj4+PiArwqDCoMKgIHN0cnVjdCBhbWRn
cHVfZG1faXJxX2hhbmRsZXJfZGF0YSAqaGFuZGxlcl9kYXRhID0KPj4+Pj4+PiArwqDCoMKgwqAg
Y29udGFpbmVyX29mKHdvcmssIHN0cnVjdCBhbWRncHVfZG1faXJxX2hhbmRsZXJfZGF0YSwgd29y
ayk7Cj4+Pj4+Pj4gwqDCoCAtwqDCoMKgwqDCoMKgwqAgRFJNX0RFQlVHX0tNUygiRE1fSVJROiBz
Y2hlZHVsZV93b3JrOiBmb3IgZGFsX3NyYz0lZFxuIiwKPj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBoYW5kbGVyX2RhdGEtPmlycV9zb3VyY2UpOwo+Pj4+Pj4+IC0KPj4+Pj4+PiAtIGhh
bmRsZXJfZGF0YS0+aGFuZGxlcihoYW5kbGVyX2RhdGEtPmhhbmRsZXJfYXJnKTsKPj4+Pj4+PiAt
wqDCoMKgIH0KPj4+Pj4+PiArwqDCoMKgIGhhbmRsZXJfZGF0YS0+aGFuZGxlcihoYW5kbGVyX2Rh
dGEtPmhhbmRsZXJfYXJnKTsKPj4+Pj4+PiDCoMKgIMKgwqDCoMKgwqAgLyogQ2FsbCBhIERBTCBz
dWJjb21wb25lbnQgd2hpY2ggcmVnaXN0ZXJlZCBmb3IgaW50ZXJydXB0Cj4+Pj4+Pj4gbm90aWZp
Y2F0aW9uCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgKiBhdCBJTlRFUlJVUFRfTE9XX0lSUV9DT05U
RVhULgo+Pj4+Pj4+IEBAIC0xNTYsNyArMTQ3LDcgQEAgc3RhdGljIHN0cnVjdCBsaXN0X2hlYWQK
Pj4+Pj4+PiAqcmVtb3ZlX2lycV9oYW5kbGVyKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+
Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+Pj4+Pj4+IMKgwqDCoMKgwqDCoCBj
YXNlIElOVEVSUlVQVF9MT1dfSVJRX0NPTlRFWFQ6Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIGRlZmF1
bHQ6Cj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGhuZF9saXN0ID0KPj4+Pj4+PiAmYWRldi0+ZG0u
aXJxX2hhbmRsZXJfbGlzdF9sb3dfdGFiW2lycV9zb3VyY2VdLmhlYWQ7Cj4+Pj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIGhuZF9saXN0ID0gJmFkZXYtPmRtLmlycV9oYW5kbGVyX2xpc3RfbG93X3RhYltp
cnFfc291cmNlXTsKPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4+Pj4+PiDC
oMKgwqDCoMKgwqAgfQo+Pj4+Pj4+IMKgwqAgQEAgLTI4Nyw3ICsyNzgsOCBAQCB2b2lkICphbWRn
cHVfZG1faXJxX3JlZ2lzdGVyX2ludGVycnVwdChzdHJ1Y3QKPj4+Pj4+PiBhbWRncHVfZGV2aWNl
ICphZGV2LAo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+Pj4+Pj4+IMKgwqDC
oMKgwqDCoCBjYXNlIElOVEVSUlVQVF9MT1dfSVJRX0NPTlRFWFQ6Cj4+Pj4+Pj4gwqDCoMKgwqDC
oMKgIGRlZmF1bHQ6Cj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGhuZF9saXN0ID0KPj4+Pj4+PiAm
YWRldi0+ZG0uaXJxX2hhbmRsZXJfbGlzdF9sb3dfdGFiW2lycV9zb3VyY2VdLmhlYWQ7Cj4+Pj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIGhuZF9saXN0ID0gJmFkZXYtPmRtLmlycV9oYW5kbGVyX2xpc3Rf
bG93X3RhYltpcnFfc291cmNlXTsKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgSU5JVF9XT1JLKCZo
YW5kbGVyX2RhdGEtPndvcmssIGRtX2lycV93b3JrX2Z1bmMpOwo+Pj4+Pj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGJyZWFrOwo+Pj4+Pj4+IMKgwqDCoMKgwqDCoCB9Cj4+Pj4+Pj4gwqDCoCBAQCAt
MzY5LDcgKzM2MSw3IEBAIHZvaWQKPj4+Pj4+PiBhbWRncHVfZG1faXJxX3VucmVnaXN0ZXJfaW50
ZXJydXB0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+Pj4+Pj4+IMKgwqAgaW50IGFtZGdw
dV9kbV9pcnFfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPj4+Pj4+PiDCoMKgIHsK
Pj4+Pj4+PiDCoMKgwqDCoMKgwqAgaW50IHNyYzsKPj4+Pj4+PiAtwqDCoMKgIHN0cnVjdCBpcnFf
bGlzdF9oZWFkICpsaDsKPj4+Pj4+PiArwqDCoMKgIHN0cnVjdCBsaXN0X2hlYWQgKmxoOwo+Pj4+
Pj4+IMKgwqAgwqDCoMKgwqDCoCBEUk1fREVCVUdfS01TKCJETV9JUlFcbiIpOwo+Pj4+Pj4+IMKg
wqAgQEAgLTM3OCw5ICszNzAsNyBAQCBpbnQgYW1kZ3B1X2RtX2lycV9pbml0KHN0cnVjdCBhbWRn
cHVfZGV2aWNlCj4+Pj4+Pj4gKmFkZXYpCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIGZvciAoc3JjID0g
MDsgc3JjIDwgREFMX0lSUV9TT1VSQ0VTX05VTUJFUjsgc3JjKyspIHsKPj4+Pj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAvKiBsb3cgY29udGV4dCBoYW5kbGVyIGxpc3QgaW5pdCAqLwo+Pj4+Pj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxoID0gJmFkZXYtPmRtLmlycV9oYW5kbGVyX2xpc3RfbG93
X3RhYltzcmNdOwo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBJTklUX0xJU1RfSEVBRCgmbGgtPmhl
YWQpOwo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBJTklUX1dPUksoJmxoLT53b3JrLCBkbV9pcnFf
d29ya19mdW5jKTsKPj4+Pj4+PiAtCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIElOSVRfTElTVF9I
RUFEKGxoKTsKPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBoaWdoIGNvbnRleHQgaGFu
ZGxlciBpbml0ICovCj4+Pj4+Pj4gSU5JVF9MSVNUX0hFQUQoJmFkZXYtPmRtLmlycV9oYW5kbGVy
X2xpc3RfaGlnaF90YWJbc3JjXSk7Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIH0KPj4+Pj4+PiBAQCAt
Mzk3LDggKzM4NywxMSBAQCBpbnQgYW1kZ3B1X2RtX2lycV9pbml0KHN0cnVjdCBhbWRncHVfZGV2
aWNlCj4+Pj4+Pj4gKmFkZXYpCj4+Pj4+Pj4gwqDCoCB2b2lkIGFtZGdwdV9kbV9pcnFfZmluaShz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPj4+Pj4+PiDCoMKgIHsKPj4+Pj4+PiDCoMKgwqDC
oMKgwqAgaW50IHNyYzsKPj4+Pj4+PiAtwqDCoMKgIHN0cnVjdCBpcnFfbGlzdF9oZWFkICpsaDsK
Pj4+Pj4+PiArwqDCoMKgIHN0cnVjdCBsaXN0X2hlYWQgKmxoOwo+Pj4+Pj4+ICvCoMKgwqAgc3Ry
dWN0IGxpc3RfaGVhZCAqZW50cnksICp0bXA7Cj4+Pj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgYW1kZ3B1
X2RtX2lycV9oYW5kbGVyX2RhdGEgKmhhbmRsZXI7Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIHVuc2ln
bmVkIGxvbmcgaXJxX3RhYmxlX2ZsYWdzOwo+Pj4+Pj4+ICsKPj4+Pj4+PiDCoMKgwqDCoMKgwqAg
RFJNX0RFQlVHX0tNUygiRE1fSVJROiByZWxlYXNpbmcgcmVzb3VyY2VzLlxuIik7Cj4+Pj4+Pj4g
wqDCoMKgwqDCoMKgIGZvciAoc3JjID0gMDsgc3JjIDwgREFMX0lSUV9TT1VSQ0VTX05VTUJFUjsg
c3JjKyspIHsKPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBETV9JUlFfVEFCTEVfTE9DSyhh
ZGV2LCBpcnFfdGFibGVfZmxhZ3MpOwo+Pj4+Pj4+IEBAIC00MDcsNyArNDAwLDE1IEBAIHZvaWQg
YW1kZ3B1X2RtX2lycV9maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlCj4+Pj4+Pj4gKmFkZXYpCj4+
Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIChiZWNhdXNlIG5vIGNvZGUgY2FuIHNjaGVk
dWxlIGEgbmV3IG9uZSkuICovCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGggPSAmYWRl
di0+ZG0uaXJxX2hhbmRsZXJfbGlzdF9sb3dfdGFiW3NyY107Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqAgRE1fSVJRX1RBQkxFX1VOTE9DSyhhZGV2LCBpcnFfdGFibGVfZmxhZ3MpOwo+Pj4+
Pj4+IC3CoMKgwqDCoMKgwqDCoCBmbHVzaF93b3JrKCZsaC0+d29yayk7Cj4+Pj4+Pj4gKwo+Pj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIWxpc3RfZW1wdHkobGgpKSB7Cj4+Pj4+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgbGlzdF9mb3JfZWFjaF9zYWZlKGVudHJ5LCB0bXAsIGxoKSB7Cj4+
Pj4+Pj4gKwoKRXh0cmEgbmV3bGluZSBub3QgbmVjZXNzYXJ5LgoKPj4+Pj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhhbmRsZXIgPSBsaXN0X2VudHJ5KGVudHJ5LCBzdHJ1Y3QK
Pj4+Pj4+PiBhbWRncHVfZG1faXJxX2hhbmRsZXJfZGF0YSwKPj4+Pj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGxpc3QpOwo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmx1c2hf
d29yaygmaGFuZGxlci0+d29yayk7Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+
Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIH0KPj4+Pj4+PiDC
oMKgIH0KPj4+Pj4+PiDCoMKgIEBAIC00MTcsNiArNDE4LDggQEAgaW50IGFtZGdwdV9kbV9pcnFf
c3VzcGVuZChzdHJ1Y3QKPj4+Pj4+PiBhbWRncHVfZGV2aWNlICphZGV2KQo+Pj4+Pj4+IMKgwqDC
oMKgwqDCoCBzdHJ1Y3QgbGlzdF9oZWFkICpobmRfbGlzdF9oOwo+Pj4+Pj4+IMKgwqDCoMKgwqDC
oCBzdHJ1Y3QgbGlzdF9oZWFkICpobmRfbGlzdF9sOwo+Pj4+Pj4+IMKgwqDCoMKgwqDCoCB1bnNp
Z25lZCBsb25nIGlycV90YWJsZV9mbGFnczsKPj4+Pj4+PiArwqDCoMKgIHN0cnVjdCBsaXN0X2hl
YWQgKmVudHJ5LCAqdG1wOwo+Pj4+Pj4+ICvCoMKgwqAgc3RydWN0IGFtZGdwdV9kbV9pcnFfaGFu
ZGxlcl9kYXRhICpoYW5kbGVyOwo+Pj4+Pj4+IMKgwqAgwqDCoMKgwqDCoCBETV9JUlFfVEFCTEVf
TE9DSyhhZGV2LCBpcnFfdGFibGVfZmxhZ3MpOwo+Pj4+Pj4+IMKgwqAgQEAgLTQyNywxNCArNDMw
LDIyIEBAIGludCBhbWRncHVfZG1faXJxX3N1c3BlbmQoc3RydWN0Cj4+Pj4+Pj4gYW1kZ3B1X2Rl
dmljZSAqYWRldikKPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCAqIHdpbGwgYmUgZGlzYWJsZWQgZnJv
bSBtYW5hZ2VfZG1faW50ZXJydXB0cyBvbiBkaXNhYmxlIAo+Pj4+Pj4+IENSVEMuCj4+Pj4+Pj4g
wqDCoMKgwqDCoMKgwqAgKi8KPj4+Pj4+PiDCoMKgwqDCoMKgwqAgZm9yIChzcmMgPSBEQ19JUlFf
U09VUkNFX0hQRDE7IHNyYyA8PSBEQ19JUlFfU09VUkNFX0hQRDZSWDsKPj4+Pj4+PiBzcmMrKykg
ewo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBobmRfbGlzdF9sID0gJmFkZXYtPmRtLmlycV9oYW5k
bGVyX2xpc3RfbG93X3RhYltzcmNdLmhlYWQ7Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGhuZF9s
aXN0X2wgPSAmYWRldi0+ZG0uaXJxX2hhbmRsZXJfbGlzdF9sb3dfdGFiW3NyY107Cj4+Pj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaG5kX2xpc3RfaCA9ICZhZGV2LT5kbS5pcnFfaGFuZGxlcl9s
aXN0X2hpZ2hfdGFiW3NyY107Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFsaXN0
X2VtcHR5KGhuZF9saXN0X2wpIHx8ICFsaXN0X2VtcHR5KGhuZF9saXN0X2gpKQo+Pj4+Pj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGNfaW50ZXJydXB0X3NldChhZGV2LT5kbS5kYywg
c3JjLCBmYWxzZSk7Cj4+Pj4+Pj4gwqDCoCDCoMKgwqDCoMKgwqDCoMKgwqAgRE1fSVJRX1RBQkxF
X1VOTE9DSyhhZGV2LCBpcnFfdGFibGVfZmxhZ3MpOwo+Pj4+Pj4+IC0gZmx1c2hfd29yaygmYWRl
di0+ZG0uaXJxX2hhbmRsZXJfbGlzdF9sb3dfdGFiW3NyY10ud29yayk7Cj4+Pj4+Pj4gwqDCoCAr
wqDCoMKgwqDCoMKgwqAgaWYgKCFsaXN0X2VtcHR5KGhuZF9saXN0X2wpKSB7Cj4+Pj4+Pj4gKwoK
RXh0cmEgbmV3bGluZQoKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsaXN0X2Zvcl9l
YWNoX3NhZmUoZW50cnksIHRtcCwgaG5kX2xpc3RfbCkgewo+Pj4+Pj4+ICsKPj4+Pj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhhbmRsZXIgPSBsaXN0X2VudHJ5KGVudHJ5LCBz
dHJ1Y3QKPj4+Pj4+PiBhbWRncHVfZG1faXJxX2hhbmRsZXJfZGF0YSwKPj4+Pj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGxpc3QpOwo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Zmx1c2hfd29yaygmaGFuZGxlci0+d29yayk7Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfQo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqAgRE1fSVJRX1RBQkxFX0xPQ0soYWRldiwgaXJxX3RhYmxlX2ZsYWdzKTsKPj4+Pj4+PiDCoMKg
wqDCoMKgwqAgfQo+Pj4+Pj4+IMKgwqAgQEAgLTQ1NCw3ICs0NjUsNyBAQCBpbnQgYW1kZ3B1X2Rt
X2lycV9yZXN1bWVfZWFybHkoc3RydWN0Cj4+Pj4+Pj4gYW1kZ3B1X2RldmljZSAqYWRldikKPj4+
Pj4+PiDCoMKgIMKgwqDCoMKgwqAgLyogcmUtZW5hYmxlIHNob3J0IHB1bHNlIGludGVycnVwdHMg
SFcgaW50ZXJydXB0ICovCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIGZvciAoc3JjID0gRENfSVJRX1NP
VVJDRV9IUEQxUlg7IHNyYyA8PSBEQ19JUlFfU09VUkNFX0hQRDZSWDsKPj4+Pj4+PiBzcmMrKykg
ewo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBobmRfbGlzdF9sID0gJmFkZXYtPmRtLmlycV9oYW5k
bGVyX2xpc3RfbG93X3RhYltzcmNdLmhlYWQ7Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGhuZF9s
aXN0X2wgPSAmYWRldi0+ZG0uaXJxX2hhbmRsZXJfbGlzdF9sb3dfdGFiW3NyY107Cj4+Pj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaG5kX2xpc3RfaCA9ICZhZGV2LT5kbS5pcnFfaGFuZGxlcl9s
aXN0X2hpZ2hfdGFiW3NyY107Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFsaXN0
X2VtcHR5KGhuZF9saXN0X2wpIHx8ICFsaXN0X2VtcHR5KGhuZF9saXN0X2gpKQo+Pj4+Pj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGNfaW50ZXJydXB0X3NldChhZGV2LT5kbS5kYywg
c3JjLCB0cnVlKTsKPj4+Pj4+PiBAQCAtNDgwLDcgKzQ5MSw3IEBAIGludCBhbWRncHVfZG1faXJx
X3Jlc3VtZV9sYXRlKHN0cnVjdAo+Pj4+Pj4+IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4+Pj4+Pj4g
wqDCoMKgwqDCoMKgwqAgKiB3aWxsIGJlIGVuYWJsZWQgZnJvbSBtYW5hZ2VfZG1faW50ZXJydXB0
cyBvbiBlbmFibGUgQ1JUQy4KPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCAqLwo+Pj4+Pj4+IMKgwqDC
oMKgwqDCoCBmb3IgKHNyYyA9IERDX0lSUV9TT1VSQ0VfSFBEMTsgc3JjIDw9IERDX0lSUV9TT1VS
Q0VfSFBENjsKPj4+Pj4+PiBzcmMrKykgewo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBobmRfbGlz
dF9sID0gJmFkZXYtPmRtLmlycV9oYW5kbGVyX2xpc3RfbG93X3RhYltzcmNdLmhlYWQ7Cj4+Pj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIGhuZF9saXN0X2wgPSAmYWRldi0+ZG0uaXJxX2hhbmRsZXJfbGlz
dF9sb3dfdGFiW3NyY107Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgaG5kX2xpc3RfaCA9
ICZhZGV2LT5kbS5pcnFfaGFuZGxlcl9saXN0X2hpZ2hfdGFiW3NyY107Cj4+Pj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqAgaWYgKCFsaXN0X2VtcHR5KGhuZF9saXN0X2wpIHx8ICFsaXN0X2VtcHR5
KGhuZF9saXN0X2gpKQo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGNfaW50
ZXJydXB0X3NldChhZGV2LT5kbS5kYywgc3JjLCB0cnVlKTsKPj4+Pj4+PiBAQCAtNDk3LDIwICs1
MDgsNTMgQEAgaW50IGFtZGdwdV9kbV9pcnFfcmVzdW1lX2xhdGUoc3RydWN0Cj4+Pj4+Pj4gYW1k
Z3B1X2RldmljZSAqYWRldikKPj4+Pj4+PiDCoMKgIHN0YXRpYyB2b2lkIGFtZGdwdV9kbV9pcnFf
c2NoZWR1bGVfd29yayhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAKPj4+Pj4+PiAqYWRldiwKPj4+Pj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbnVtIGRjX2ly
cV9zb3VyY2UgaXJxX3NvdXJjZSkKPj4+Pj4+PiDCoMKgIHsKPj4+Pj4+PiAtwqDCoMKgIHVuc2ln
bmVkIGxvbmcgaXJxX3RhYmxlX2ZsYWdzOwo+Pj4+Pj4+IC3CoMKgwqAgc3RydWN0IHdvcmtfc3Ry
dWN0ICp3b3JrID0gTlVMTDsKPj4+Pj4+PiDCoMKgIC3CoMKgwqAgRE1fSVJRX1RBQkxFX0xPQ0so
YWRldiwgaXJxX3RhYmxlX2ZsYWdzKTsKPj4+Pj4+PiArwqDCoMKgIHN0cnVjdMKgIGxpc3RfaGVh
ZCAqaGFuZGxlcl9saXN0ID0KPj4+Pj4+PiAmYWRldi0+ZG0uaXJxX2hhbmRsZXJfbGlzdF9sb3df
dGFiW2lycV9zb3VyY2VdOwo+Pj4+Pj4+ICvCoMKgwqAgc3RydWN0wqAgYW1kZ3B1X2RtX2lycV9o
YW5kbGVyX2RhdGEgKmhhbmRsZXJfZGF0YTsKPj4+Pj4+PiArwqDCoMKgIGJvb2zCoMKgwqAgd29y
a19xdWV1ZWQgPSBmYWxzZTsKPj4+Pj4+PiDCoMKgIC3CoMKgwqAgaWYKPj4+Pj4+PiAoIWxpc3Rf
ZW1wdHkoJmFkZXYtPmRtLmlycV9oYW5kbGVyX2xpc3RfbG93X3RhYltpcnFfc291cmNlXS5oZWFk
KSkKPj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgd29yayA9ICZhZGV2LT5kbS5pcnFfaGFuZGxlcl9s
aXN0X2xvd190YWJbaXJxX3NvdXJjZV0ud29yazsKPj4+Pj4+PiArwqDCoMKgIGlmIChsaXN0X2Vt
cHR5KGhhbmRsZXJfbGlzdCkpCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybjsKPj4+Pj4+
PiDCoMKgIC3CoMKgwqAgRE1fSVJRX1RBQkxFX1VOTE9DSyhhZGV2LCBpcnFfdGFibGVfZmxhZ3Mp
Owo+Pj4+Pj4+ICvCoMKgwqAgbGlzdF9mb3JfZWFjaF9lbnRyeShoYW5kbGVyX2RhdGEsIGhhbmRs
ZXJfbGlzdCwgbGlzdCkgewo+Pj4+Pj4+ICsKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCFx
dWV1ZV93b3JrKHN5c3RlbV9oaWdocHJpX3dxLCAmaGFuZGxlcl9kYXRhLT53b3JrKSkgewo+Pj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+Pj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoCB9IGVsc2Ugewo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHdvcmtfcXVldWVk
ID0gdHJ1ZTsKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4+Pj4+PiAr
wqDCoMKgwqDCoMKgwqAgfQo+Pj4+Pj4+ICvCoMKgwqAgfQo+Pj4+Pj4+ICsKPj4+Pj4+PiArwqDC
oMKgIGlmICghd29ya19xdWV1ZWQpIHsKPj4+Pj4+PiArCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKg
IHN0cnVjdMKgIGFtZGdwdV9kbV9pcnFfaGFuZGxlcl9kYXRhICpoYW5kbGVyX2RhdGFfYWRkOwo+
Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAvKmdldCB0aGUgYW1kZ3B1X2RtX2lycV9oYW5kbGVyX2Rh
dGEgb2YgZmlyc3QgaXRlbSBwb2ludGVkCj4+Pj4+Pj4gYnkgaGFuZGxlcl9saXN0Ki8KPj4+Pj4+
PiArwqDCoMKgwqDCoMKgwqAgaGFuZGxlcl9kYXRhID0gY29udGFpbmVyX29mKGhhbmRsZXJfbGlz
dC0+bmV4dCwgc3RydWN0Cj4+Pj4+Pj4gYW1kZ3B1X2RtX2lycV9oYW5kbGVyX2RhdGEsIGxpc3Qp
Owo+Pj4+Pj4+ICsKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgLyphbGxvY2F0ZSBhIG5ldyBhbWRn
cHVfZG1faXJxX2hhbmRsZXJfZGF0YSovCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGhhbmRsZXJf
ZGF0YV9hZGQgPSBremFsbG9jKHNpemVvZigqaGFuZGxlcl9kYXRhKSwKPj4+Pj4+PiBHRlBfS0VS
TkVMKTsKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCFoYW5kbGVyX2RhdGFfYWRkKSB7Cj4+
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRFJNX0VSUk9SKCJETV9JUlE6IGZhaWxlZCB0
byBhbGxvY2F0ZSBpcnEgaGFuZGxlciFcbiIpOwo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybjsKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgfQo+Pj4+Pj4+ICsKPj4+Pj4+PiAr
wqDCoMKgwqDCoMKgwqAgLypjb3B5IG5ldyBhbWRncHVfZG1faXJxX2hhbmRsZXJfZGF0YSBtZW1i
ZXJzIGZyb20KPj4+Pj4+PiBoYW5kbGVyX2RhdGEqLwo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBo
YW5kbGVyX2RhdGFfYWRkLT5oYW5kbGVywqDCoMKgwqDCoMKgID0gaGFuZGxlcl9kYXRhLT5oYW5k
bGVyOwo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBoYW5kbGVyX2RhdGFfYWRkLT5oYW5kbGVyX2Fy
Z8KgwqAgPSAKPj4+Pj4+PiBoYW5kbGVyX2RhdGEtPmhhbmRsZXJfYXJnOwo+Pj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoCBoYW5kbGVyX2RhdGFfYWRkLT5kbcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPSBo
YW5kbGVyX2RhdGEtPmRtOwo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBoYW5kbGVyX2RhdGFfYWRk
LT5pcnFfc291cmNlwqDCoMKgID0gaXJxX3NvdXJjZTsKPj4+Pj4+PiArCj4+Pj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIGxpc3RfYWRkX3RhaWwoJmhhbmRsZXJfZGF0YV9hZGQtPmxpc3QsIGhhbmRsZXJf
bGlzdCk7Cj4+Pj4+Pgo+Pj4+Pj4gQXQgd2hhdCBwbGFjZSBhcmUgeW91IGRlbGV0aW5nIGNvbXBs
ZXRlZCB3b3JrIGl0ZW1zIGZyb20gdGhlCj4+Pj4+PiBoYW5kbGVyX2xpc3QgPwo+Pj4+Pj4KPj4+
Pj4+IEFuZHJleQo+Pj4+Pj4KPj4+Pj4gVGhlIG5ldyBhbGxvY2F0ZWQgd29yayBpdGVtIGhhbmRs
ZXJfZGF0YV9hZGQgaXMgcHV0IGF0IGVuZCBvZiBzaW5nbGUKPj4+Pj4gbGlzdCBoYW5kbGVyX2xp
c3QuIEl0IGlzIG5vdCBkZWxldGVkLCBidXQgcHV0IGludG8gdGhpcyBsaXN0LiBJbiB0aGUKPj4+
Pj4gZnV0dXJlIGZvciBzYW1lIGludGVycnVwdCBzb3VyY2UgaGFuZGxpbmcgdGhlIHByZXZpb3Vz
IGFsbG9jYXRlZCB3b3JrCj4+Pj4+IGl0ZW1zIGNhbiBiZSByZXVzZWQuwqAgU28gd2UgZG8gbm90
IGhhdmUgdG8gcmVhbGxvY2F0ZSBuZXcgd29yayBpdGVtcwo+Pj4+PiBpZiBwcmV2aW91cyBpbnRl
cnJ1cHRzIGhhdmUgbm90IGJlZW4gaGFuZGxlZCBieSBjcHUuIE9uIG90aGVyIHNpZGUKPj4+Pj4g
c3lzdGVtIHdpbGwga2VlcCBhbGwgdGhlIGFsbG9jYXRlZCB3b3JrIGl0ZW1zIGF0IHJ1biB0aW1l
LiBOb3RlLCB0aGUKPj4+Pj4gbmV3IHdvcmsgaXRlbSBhbGxvY2F0aW9uIG9ubHkgaGFwcGVucyB3
aGVuIGNwdSBoYXMgbm90IGhhbmRsZWQKPj4+Pj4gcHJldmlvdXMgaW50ZXJydXB0cyB5ZXQsIGFu
ZCBuZXcgc2FtZSB0eXBlIGludGVycnVwdHMgaGF2ZSBjYW1lLgo+Pj4+Pgo+Pj4+PiBUaGFua3MK
Pj4+Pj4KPj4+Pj4gWGlhb2dhbmcKPj4+Pj4KPj4+PiBJIGFtIHN0aWxsIGNvbmZ1c2VkLCBob3cg
eW91IGF2b2lkIGV4ZWN1dGluZyBhIHNlY29uZCB0aW1lIGEgaGFuZGxlcgo+Pj4+IHlvdSBwcmV2
aW91c2x5IGFsbG9jYXRlZCBiZWNhdXNlIGZpcnN0IHF1ZXVlX3dvcmsgZmFpbGVkLAo+Pj4+IHlv
dSBhbHdheXMgc3RhcnQgaXRlcmF0aW9uIGZyb20gYmVnaW5uaW5nIG9mIHRoZSBsaXN0IGFuZCB5
b3UgbmV2ZXIKPj4+PiByZW1vdmUgYWxyZWFkeSBzdWNjZXNzZnVsbHkgZXhlY3V0ZWQgaGFuZGxl
cnMuCj4+Pj4KPj4+PiBBbmRyZXkKPj4+Pgo+Pj4+Cj4+PiBOb3Qgc3VyZSBpZiB1bmRlcnN0YW5k
IHlvdXIgcXVlc3Rpb24uIElmIHRoZSBmaXJzdCB0aW1lIHF1ZXVpbmcgd29yawo+Pj4gaXRlbSBz
dWNjZXNzIHRoZXJlIGlzIG5vIHNlY29uZCB0aW1lIHF1ZXVpbmcgdGhlIHNhbWUgd29yayBpdGVt
LiBUaGUKPj4+IHNlY29uZCB3b3JrIGl0ZW0gaXMgYSBkaWZmZXJlbnQgb25lIGFsdGhvdWdoIHRo
ZXkgdXNlIHNhbWUKPj4+IGhhbmRsZV9ocGRfcnhfaXJxLiBUaGUgcXVldWVkIHdvcmsgaXRlbXMg
YXJlIG1hbmFnZWQgYnkgd29yawo+Pj4gcXVldWUocXVldWVfd29yaykuIFdvcmsgcXVldWUga25v
d3MgZWFjaCBxdWV1ZWQgd29yayBpdGVtIHN0YXR1czogc3RpbGwKPj4+IG9uIHF1ZXVlLCBydW5u
aW5nLCBvciBleGlzdC4gSSBsb29rIGZyb20gYWxyZWFkeSBhbGxvY2F0ZWQgd29yayBpdGVtcyB0
bwo+Pj4gc2VlIGlmIHdvcmsgcXVldWUgYWxsb3dzIG1lIHRvIHF1ZXVlLCB1bnRpbCBmaW5kIG9u
ZS4gSWYgYWxsIGFsbG9jYXRlZAo+Pj4gd29yayBpdGVtcyBjYW5ub3QgYmUgcXVldWVkLCBhbGxv
Y2F0ZSBhIG5ldyB3b3JrIGl0ZW0gYW5kIHB1dCBpdCBhdCB0aGUKPj4+IGxpc3Qgb2YgYWxsb2Nh
dGVkIHdvcmsgaXRlbXMuCj4+Pgo+Pj4gVGhhbmtzCj4+Pgo+Pj4gWGlhb2dhbmcKPj4+Cj4+Pgo+
Pj4KPj4+Pj4+PiArCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIElOSVRfV09SSygmaGFuZGxlcl9k
YXRhX2FkZC0+d29yaywgZG1faXJxX3dvcmtfZnVuYyk7Cj4+Pj4+Pj4gwqDCoCAtwqDCoMKgIGlm
ICh3b3JrKSB7Cj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGlmICghc2NoZWR1bGVfd29yayh3b3Jr
KSkKPj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBEUk1fSU5GTygiYW1kZ3B1X2RtX2ly
cV9zY2hlZHVsZV93b3JrIEZBSUxFRCBzcmMgJWRcbiIsCj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaXJxX3NvdXJjZSk7Cj4+Pj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIGlmIChxdWV1ZV93b3JrKHN5c3RlbV9oaWdocHJpX3dxLCAmaGFuZGxlcl9k
YXRhX2FkZC0+d29yaykpCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRFJNX0RFQlVH
KCJfX2Z1bmNfXzogYSB3b3JrX3N0cnVjdCBpcyBhbGxvY2F0ZWQgYW5kCj4+Pj4+Pj4gcXVldWVk
LCAiCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgInNy
YyAlZFxuIiwgaXJxX3NvdXJjZSk7Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGVsc2UKPj4+Pj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBEUk1fRVJST1IoIl9fZnVuY19fOiBhIG5ldyB3b3Jr
X3N0cnVjdCBjYW5ub3QgYmUKPj4+Pj4+PiBxdWV1ZWQsICIKPj4+Pj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJzb21ldGhpbmcgaXMgd3JvbmcsIHNyYyAl
ZFxuIiwgaXJxX3NvdXJjZSk7CgpBIGJldHRlciBlcnJvciBtZXNzYWdlIHRoYXQgcG9pbnRzIHRv
IHRoZSBmYWlsdXJlIHdvdWxkIGJlIG5pY2UsIApzb21ldGhpbmcgYWxvbmcgdGhlIGxpbmVzIG9m
ICAiRmFpbGVkIHRvIHF1ZXVlIHdvcmsgZm9yIGhhbmRsaW5nIAppbnRlcnJ1cHQgcmVxdWVzdCBm
cm9tIGRpc3BsYXkiCgpXaXRoIHRoZSBjb21tZW50cyBhZGRyZXNzZWQsIHRoaXMgc2VyaWVzIGlz
OgoKUmV2aWV3ZWQtYnk6IEF1cmFiaW5kbyBQaWxsYWkgPGF1cmFiaW5kby5waWxsYWkgYXQgYW1k
LmNvbT4KCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIH0KPj4+Pj4+PiDCoMKgIMKgIH0KPj4+Pj4KPiAK
PiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFt
ZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKPiAKCi0t
IApSZWdhcmRzLApBdXJhYmluZG8gUGlsbGFpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeAo=
