Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF7525CB7A
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Sep 2020 22:48:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B6F6E92A;
	Thu,  3 Sep 2020 20:48:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2081.outbound.protection.outlook.com [40.107.236.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 738E26E92A;
 Thu,  3 Sep 2020 20:48:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c0bEEwlVSVvYgpQwOpCagwxsgupx4zrzxshEGs/mlFhUwgJJquEN5Q32iZDAtoYmFTLLNOGgK/VojaMf/vCv2f/251rMC9kgw5E+kNTuJmld8MqmUfuvG/GOHqpw0Ch4MEMDgU1WYT0egExH4xSb0YxkN49u9yAsn9clLjuCS3IDydVZ9KO+4uAhyAluYoIj3GqD4BNp0mvzjin5QuLzGuWA35WLz5RiRBZ4BFw05rqaphnX2zg4p9LWdXFDux/2Re7bLzt9MOB13cSr0poYb1WfzFr6t4nRiv4E8AXx3Hy68zKy/YieJSPdWmhCKA76wT92YZUaWqcEdXb3Cp4/+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzLjD5j+sZoAFyDM06+Jv3wlFN/ORVgD6ReMbrGB8cM=;
 b=GgMU1j76Ime/0/h4YXj12dRTCd1nxkAvXe2OzDM8TDFQAjiDLRE578IhKfECVLfkvZiitKo+qNtXrApiWaijQx9Sh1vjWYcCfEkiUAzjMg87kOkdcZuIz13Oa/je6FKfvNoZ0S0ABbvCOoNINlYa7bjTtsvJqsU3twuT/ndZa5k1dsSVwo1yeK4BMwB0FmxdCLHKMrEGWqtVaEa2nlgtgv/8znP6ZVFe4clk+/iIofWGKOY5yNWzoP8gGT5lbBusIccAqe8uVrWqRY3RkJSW+XLA2hCgQwnkBbFD7RBa3bu4unBruLDt4leZ3/+ZdttmaNMKLlfcR5B+buuFQQ+nYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzLjD5j+sZoAFyDM06+Jv3wlFN/ORVgD6ReMbrGB8cM=;
 b=ml2VvZ/eHOKZJCfk4w19ZKERrGuwDEZdWCzQFUwQT4DX7hjG7pQRTe6BWNy3wegd2KbzvLaO95uwnP6DMYqns+Geu86/kwrvR7yusHGYX9gjBJlKyuMQiMkUUjJ4zolY9xwLc1Gu0nE9IAKU6BuPPIHsR3YfPQ161jzGhGQ8224=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM6PR12MB3274.namprd12.prod.outlook.com (2603:10b6:5:182::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.22; Thu, 3 Sep
 2020 20:48:45 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e%6]) with mapi id 15.20.3348.016; Thu, 3 Sep 2020
 20:48:45 +0000
Subject: Re: [PATCH] drm/managed: Cleanup of unused functions and polishing
 docs
To: Daniel Vetter <daniel@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200902072627.3617301-1-daniel.vetter@ffwll.ch>
 <20200903142641.GL2352366@phenom.ffwll.local>
From: Luben Tuikov <luben.tuikov@amd.com>
Message-ID: <165961bb-3b5b-cedc-2fc0-838b7999d2e3@amd.com>
Date: Thu, 3 Sep 2020 16:48:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.1
In-Reply-To: <20200903142641.GL2352366@phenom.ffwll.local>
Content-Language: en-GB
X-ClientProxiedBy: YT1PR01CA0109.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::18) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 YT1PR01CA0109.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.15 via Frontend Transport; Thu, 3 Sep 2020 20:48:45 +0000
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c55bcd66-5f75-473a-f50d-08d8504ac006
X-MS-TrafficTypeDiagnostic: DM6PR12MB3274:
X-Microsoft-Antispam-PRVS: <DM6PR12MB327444E11BC2D12035691A6F992C0@DM6PR12MB3274.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0k8QKvtPlIEg5Bt+RBz4/BW2G6lLAVsdO7njLrsEYTFeyO1yWEYhuYvW82fD8Qgqh+cjVDJyjoZXnAu9XzQloaBFQDE0iJzPn9+D1ZuVkB2Q5bEeDUM3yQ7bDc5D1ex7wSgnQw2y7Tk9OgYHDwbLTFoOj2e31ygkh8CIPpVb1mA6OTS3JlefnSLRdNRbFS8m4OEo8/LYvg0Xedit3/vNCuoBchV0GRLAWqm0AxlS70h7ZHdcu0SJJBOB5oPKOid24z5fu/2jWBU0eIhqZYdGOlssIwSRrgVYFRSEtUXzhhmZDW47koffDNGFVDHy3rpytRhd6aSMivaX7LGt6+LinqWvjsy6n4nL0YNepzmImK3Pv1M/ZMHqkGcjiN44XBEB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(396003)(376002)(366004)(66946007)(31696002)(478600001)(5660300002)(66556008)(30864003)(26005)(8676002)(52116002)(31686004)(8936002)(2906002)(66476007)(4326008)(53546011)(186003)(956004)(2616005)(6486002)(86362001)(44832011)(110136005)(16576012)(66574015)(36756003)(83380400001)(316002)(54906003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: UJwtr/hD7f3tc8kZkr3q8mqKtyWM6COn0cMDRk2lX+PXM30DRDFKa4XJRUSXvXWIDNuSdj2y1htKBfmMpxuU+9wQWdivsn8UtjOYARVXeWdM4T+E6z6oPC61X/9yIgJ25BGnYvoJLvvLWT4mKU5zPWcqUtdUvQ3auVWVuMfraP1a9ouCMSIcvLh1vKvH7o7ckSVl1v/OGptm0FFOOBSzsiBuNn4xYBe9a8FzvzaKQXLzKPrlPk9uqyg4cyQj6uOPWQNucDepxB4YCjR6uLjQppXHbtT3R/NbVkfEEewkKSR4riccLbV4uEF5B7+jw2NpxZRJ6I94z954pz7wLfyjYTqpyjuPkkEjlcxhxXGH2FlhE3zeR8z+S69K75FKluEVcSEp1CcTXF38kpn4JBUEhqF/TrkUUvs8LPwv1JInh1PgHzvGXEiwZFl0V3KGi9qcj0brnlKVfwnWlb4z4YLglX9RhFzH/nD+5XvTPdda423ZoS57ns6/fn3agKnZJ0kxK+hmgdfXXs4j9b52seDwd/jT5I0Y27fqxJafk+kLw2Hmr3sUeBdRxh0TtGHpxZFHfcp+OQZ8NkAoPo+xPu8Zrp0A3RgzCRUyqQg+lpIRnj+UncOAP5M0TVLjpNpHUIhV07blxe9COI/ZU2HAe/fEUw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c55bcd66-5f75-473a-f50d-08d8504ac006
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2020 20:48:45.4427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u8dJKVAf0FypC3WN72UU9qBqfoscDPd5kg4Zl81OQ9j2+dBLUxM7bJbFEsJgziAk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3274
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAyMC0wOS0wMyAxMDoyNiBhLm0uLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IE9uIFdlZCwg
U2VwIDAyLCAyMDIwIGF0IDA5OjI2OjI3QU0gKzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+
IEZvbGxvd2luZyBmdW5jdGlvbnMgYXJlIG9ubHkgdXNlZCBpbnRlcm5hbGx5LCBub3QgYnkgZHJp
dmVyczoKPj4gLSBkZXZtX2RybV9kZXZfaW5pdAo+Pgo+PiBBbHNvLCBub3cgdGhhdCB3ZSBoYXZl
IGEgdmVyeSBzbGljayBhbmQgcG9saXNoZWQgd2F5IHRvIGFsbG9jYXRlIGEKPj4gZHJtX2Rldmlj
ZSB3aXRoIGRldm1fZHJtX2Rldl9hbGxvYywgdXBkYXRlIGFsbCB0aGUgZG9jcyB0byByZWZsZWN0
IHRoZQo+PiBuZXcgcmVhbGl0eS4gTW9zdGx5IHRoaXMgY29uc2lzdHMgb2YgZGVsZXRpbmcgb2xk
IGFuZCBtaXNsZWFkaW5nCj4+IGhpbnRzLiBUd28gbWFpbiBvbmVzOgo+Pgo+PiAtIGl0IGlzIG5v
IGxvbmdlciByZXF1aXJlZCB0aGF0IHRoZSBkcm1fZGV2aWNlIGJhc2UgY2xhc3MgaXMgZmlyc3Qg
aW4KPj4gICB0aGUgc3RydWN0dXJlLiBkZXZtX2RybV9kZXZfYWxsb2MgY2FuIGNvcGUgd2l0aCBp
dCBiZWluZyBhbnl3aGVyZQo+Pgo+PiAtIG9idmlvdXNseSBlbWJlZGRlZCBub3cgc3Ryb25nbHkg
cmVjb21tZW5kcyB1c2luZyBkZXZtX2RybV9kZXZfYWxsb2MKPj4KPj4gdjI6IEZpeCB0eXBvcyAo
Tm9yYWxmKQo+Pgo+PiB2MzogU3BsaXQgb3V0IHRoZSByZW1vdmFsIG9mIGRybV9kZXZfaW5pdCwg
dGhhdCdzIGJsb2NrZWQgb24gc29tZQo+PiBkaXNjdXNzaW9ucyBvbiBob3cgdG8gY29udmVydCB2
Z2VtL3ZrbXMvaTkxNS1zZWxmdGVzdHMuIEFkanVzdCBjb21taXQKPj4gbWVzc2FnZSB0byByZWZs
ZWN0IHRoYXQuCj4+Cj4+IENjOiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4K
Pj4gQWNrZWQtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPiAodjIpCj4+
IEFja2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4+IENjOiBMdWJlbiBU
dWlrb3YgPGx1YmVuLnR1aWtvdkBhbWQuY29tPgo+PiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBp
bnRlbC5jb20+Cj4gCj4gT2sgcHVzaGVkIHRoYXQgbm93IHRvIGRybS1taXNjLW5leHQuIEknbSBh
bHNvIHdvcmtpbmcgb24gZ2V0dGluZyB0aGUKPiByZW1haW5pbmcgYml0cyBvZiB0aGUgYmFzaWMg
ZHJtIG1hbmFnZWQgY29udmVyc2lvbiByZXN1Ym1pdHRlZC4gVGhhdCB3YXMKPiB1bmZvcnR1bmF0
ZWx5IG1hc3NpdmVseSBzaWRlbGluZWQgZm9yIHRoZSBkbWEtZmVuY2UgZGlzY3Vzc2lvbnMuCj4g
Cj4gUXVpY2sgaGVhZHMtdXA6Cj4gZHJtbV9hZGRfZmluYWxfa2ZyZWUgYW5kIGRybV9kZXZfaW5p
dCB3aWxsIGJvdGggZGlzYXBwZWFyLCBwbGVhc2UgdXNlCj4gZGV2bV9kcm1fZGV2X2FsbG9jLgoK
SGkgRGFuaWVsLAoKSW4gZHJtX2Rydi5jLCBpbiB0aGUgIkRPQzogZHJpdmVyIGluc3RhbmNlIG92
ZXJ2aWV3IiBzZWN0aW9uLAppdCB3b3VsZCBoZWxwIGEgbG90LCBpZiB5b3UgY291bGQgYWRkL3N1
bW1hcml6ZS9jbGFyaWZ5LApzdWNjaW5jdGx5LCB0aGUgdHdvIHBhdGhzLCBkZXZpY2UgaW5zdGFu
dGlhdGlvbjoKCglkZXZtX2RybV9kZXZfYWxsb2MoKTsgLi4uCglkcm1fZGV2X2luaXQoKTsgLi4u
Cglkcm1fZGV2X3JlZ2lzdGVyKCk7IC4uLgoKQW5kLCBkZXZpY2UgZGVzdHJ1Y3Rpb24sIGFuZCB3
aGVyZS9ob3cgdGhlICJyZWxlYXNlIgptZXRob2Qgb2YgZHJtX2RyaXZlciBwbGF5cyBvdXQuCgpU
aGUgYWxsb2NhdGlvbiBwYXJ0IGlzIG1vc3RseSB0aGVyZSwgdGhhdCdzIGdvb2QsCmJ1dCB0aGUg
cmVsZWFzZS9kZXN0cnVjdGlvbiBwYXJ0IGlzIG5vdC4gVGhhdCBpcywKdGhlIHBsYXRmb3JtIGRy
aXZlciBjYWxsYmFja3MgYXJlIHRoZXJlLCBidXQgbm90CnRoZSBEUk0gZHJpdmVyIHBhcnQuIElu
IHRoaXMgcGF0Y2gsIHRoZXJlIGlzIG5vCm1lbnRpb24gb2YgZHJtX2Rldl9pbml0KCksIGFuZCB0
aGUgZG9jdW1lbnRhdGlvbgp1cGRhdGUgb2YgdGhpcyBwYXRjaCBkb2Vzbid0IG1lbnRpb24gaXQs
IHdoaWxlCml0IGlzIGJlaW5nIHVzZWQgYnkgYXQgbGVhc3Qgb25lIGRyaXZlci4KCklmLCBvbiB0
aGUgb3RoZXIgaGFuZCwgeW91J3JlIHRoaW5raW5nIG9mIHJlbW92aW5nCnRoZSAicmVsZWFzZSIg
Y2FsbGJhY2ssIGEgbHVjaWQgZXhwbGFuYXRpb24gb24Ka3JlZiByZWFjaGluZyAwLS13aGF0IHNo
b3VsZCBiZSBkb25lIGJ5IERSTQphbmQgd2hhdCBzaG91bGQgYmUgZG9uZSBieSBkcml2ZXJzLCB3
b3VsZCBiZSB2ZXJ5IG5pY2UKYW5kIGhlbHBmdWwgdG8gbG93LWxldmVsIERSTSBkZXZpY2UgZHJp
dmVyIG1haW50YWluZXJzL3dyaXRlcnMuCgpBbHNvLCBjb25zaWRlciByZW5hbWluZyAiZHJtX2Fk
ZF9hY3Rpb24oKSIgdG8gc29tZXRoaW5nCnF1YWxpZnlpbmcgdGhlIGFjdGlvbjogZWl0aGVyIGEg
Yml0bWFzayBhcyBhbiBhcmd1bWVudCwKb3IgcmlnaHQgaW4gdGhlIG5hbWUsICJkcm1fYWRkX2Fj
dGlvbl9yZWxlYXNlKCkiLCBlbHNlCm9uZSBiZWdzIHRoZSBxdWVzdGlvbiAiV2hhdCBhY3Rpb24/
IgoKSXQgd291bGQgYmUgaGVscGZ1bCwgdG8gZGVzY3JpYmUgdGhlIG9yZGVyIG9mICJyZWxlYXNl
IgphY3Rpb25zIG9uIGtyZWYgcmVhY2hpbmcgMCwgYW5kIHdoYXQgaXMgZXhwZWN0ZWQgb2YKRFJN
IGFuZCB3aGF0IG9mIGRyaXZlcnMsIGluIHRoZSBvcmRlciBvZiB0aGUgZXhwZWN0ZWQKY2FsbGJh
Y2tzLgoKUmVnYXJkcywKTHViZW4KCgo+IAo+IENoZWVycywgRGFuaWVsCj4gCj4+IC0tLQo+PiAg
Li4uL2RyaXZlci1hcGkvZHJpdmVyLW1vZGVsL2RldnJlcy5yc3QgICAgICAgIHwgIDIgKy0KPj4g
IGRyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMgICAgICAgICAgICAgICAgICAgICB8IDc4ICsrKysr
LS0tLS0tLS0tLS0tLS0KPj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fbWFuYWdlZC5jICAgICAgICAg
ICAgICAgICB8ICAyICstCj4+ICBpbmNsdWRlL2RybS9kcm1fZGV2aWNlLmggICAgICAgICAgICAg
ICAgICAgICAgfCAgMiArLQo+PiAgaW5jbHVkZS9kcm0vZHJtX2Rydi5oICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgMTYgKystLQo+PiAgNSBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCsp
LCA3MCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZHJpdmVy
LWFwaS9kcml2ZXItbW9kZWwvZGV2cmVzLnJzdCBiL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9k
cml2ZXItbW9kZWwvZGV2cmVzLnJzdAo+PiBpbmRleCBlYWFhYWZjMjExMzQuLmFhNGQyNDIwZjc5
ZSAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2RyaXZlci1tb2RlbC9k
ZXZyZXMucnN0Cj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9kcml2ZXItbW9kZWwv
ZGV2cmVzLnJzdAo+PiBAQCAtMjYzLDcgKzI2Myw3IEBAIERNQQo+PiAgICBkbWFtX3Bvb2xfZGVz
dHJveSgpCj4+ICAKPj4gIERSTQo+PiAtICBkZXZtX2RybV9kZXZfaW5pdCgpCj4+ICsgIGRldm1f
ZHJtX2Rldl9hbGxvYygpCj4+ICAKPj4gIEdQSU8KPj4gICAgZGV2bV9ncGlvZF9nZXQoKQo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZHJ2LmMKPj4gaW5kZXggZDQ1MDZmN2EyMzRlLi43YzE2ODk4NDJlYzAgMTAwNjQ0Cj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9kcnYuYwo+PiBAQCAtMjQwLDEzICsyNDAsMTMgQEAgdm9pZCBkcm1fbWlub3JfcmVsZWFzZShz
dHJ1Y3QgZHJtX21pbm9yICptaW5vcikKPj4gICAqIERPQzogZHJpdmVyIGluc3RhbmNlIG92ZXJ2
aWV3Cj4+ICAgKgo+PiAgICogQSBkZXZpY2UgaW5zdGFuY2UgZm9yIGEgZHJtIGRyaXZlciBpcyBy
ZXByZXNlbnRlZCBieSAmc3RydWN0IGRybV9kZXZpY2UuIFRoaXMKPj4gLSAqIGlzIGluaXRpYWxp
emVkIHdpdGggZHJtX2Rldl9pbml0KCksIHVzdWFsbHkgZnJvbSBidXMtc3BlY2lmaWMgLT5wcm9i
ZSgpCj4+IC0gKiBjYWxsYmFja3MgaW1wbGVtZW50ZWQgYnkgdGhlIGRyaXZlci4gVGhlIGRyaXZl
ciB0aGVuIG5lZWRzIHRvIGluaXRpYWxpemUgYWxsCj4+IC0gKiB0aGUgdmFyaW91cyBzdWJzeXN0
ZW1zIGZvciB0aGUgZHJtIGRldmljZSBsaWtlIG1lbW9yeSBtYW5hZ2VtZW50LCB2YmxhbmsKPj4g
LSAqIGhhbmRsaW5nLCBtb2Rlc2V0dGluZyBzdXBwb3J0IGFuZCBpbnRpYWwgb3V0cHV0IGNvbmZp
Z3VyYXRpb24gcGx1cyBvYnZpb3VzbHkKPj4gLSAqIGluaXRpYWxpemUgYWxsIHRoZSBjb3JyZXNw
b25kaW5nIGhhcmR3YXJlIGJpdHMuIEZpbmFsbHkgd2hlbiBldmVyeXRoaW5nIGlzIHVwCj4+IC0g
KiBhbmQgcnVubmluZyBhbmQgcmVhZHkgZm9yIHVzZXJzcGFjZSB0aGUgZGV2aWNlIGluc3RhbmNl
IGNhbiBiZSBwdWJsaXNoZWQKPj4gLSAqIHVzaW5nIGRybV9kZXZfcmVnaXN0ZXIoKS4KPj4gKyAq
IGlzIGFsbG9jYXRlZCBhbmQgaW5pdGlhbGl6ZWQgd2l0aCBkZXZtX2RybV9kZXZfYWxsb2MoKSwg
dXN1YWxseSBmcm9tCj4+ICsgKiBidXMtc3BlY2lmaWMgLT5wcm9iZSgpIGNhbGxiYWNrcyBpbXBs
ZW1lbnRlZCBieSB0aGUgZHJpdmVyLiBUaGUgZHJpdmVyIHRoZW4KPj4gKyAqIG5lZWRzIHRvIGlu
aXRpYWxpemUgYWxsIHRoZSB2YXJpb3VzIHN1YnN5c3RlbXMgZm9yIHRoZSBkcm0gZGV2aWNlIGxp
a2UgbWVtb3J5Cj4+ICsgKiBtYW5hZ2VtZW50LCB2YmxhbmsgaGFuZGxpbmcsIG1vZGVzZXR0aW5n
IHN1cHBvcnQgYW5kIGluaXRpYWwgb3V0cHV0Cj4+ICsgKiBjb25maWd1cmF0aW9uIHBsdXMgb2J2
aW91c2x5IGluaXRpYWxpemUgYWxsIHRoZSBjb3JyZXNwb25kaW5nIGhhcmR3YXJlIGJpdHMuCj4+
ICsgKiBGaW5hbGx5IHdoZW4gZXZlcnl0aGluZyBpcyB1cCBhbmQgcnVubmluZyBhbmQgcmVhZHkg
Zm9yIHVzZXJzcGFjZSB0aGUgZGV2aWNlCj4+ICsgKiBpbnN0YW5jZSBjYW4gYmUgcHVibGlzaGVk
IHVzaW5nIGRybV9kZXZfcmVnaXN0ZXIoKS4KPj4gICAqCj4+ICAgKiBUaGVyZSBpcyBhbHNvIGRl
cHJlY2F0ZWQgc3VwcG9ydCBmb3IgaW5pdGFsaXppbmcgZGV2aWNlIGluc3RhbmNlcyB1c2luZwo+
PiAgICogYnVzLXNwZWNpZmljIGhlbHBlcnMgYW5kIHRoZSAmZHJtX2RyaXZlci5sb2FkIGNhbGxi
YWNrLiBCdXQgZHVlIHRvCj4+IEBAIC0yNzQsNyArMjc0LDcgQEAgdm9pZCBkcm1fbWlub3JfcmVs
ZWFzZShzdHJ1Y3QgZHJtX21pbm9yICptaW5vcikKPj4gICAqCj4+ICAgKiBUaGUgZm9sbG93aW5n
IGV4YW1wbGUgc2hvd3MgYSB0eXBpY2FsIHN0cnVjdHVyZSBvZiBhIERSTSBkaXNwbGF5IGRyaXZl
ci4KPj4gICAqIFRoZSBleGFtcGxlIGZvY3VzIG9uIHRoZSBwcm9iZSgpIGZ1bmN0aW9uIGFuZCB0
aGUgb3RoZXIgZnVuY3Rpb25zIHRoYXQgaXMKPj4gLSAqIGFsbW9zdCBhbHdheXMgcHJlc2VudCBh
bmQgc2VydmVzIGFzIGEgZGVtb25zdHJhdGlvbiBvZiBkZXZtX2RybV9kZXZfaW5pdCgpLgo+PiAr
ICogYWxtb3N0IGFsd2F5cyBwcmVzZW50IGFuZCBzZXJ2ZXMgYXMgYSBkZW1vbnN0cmF0aW9uIG9m
IGRldm1fZHJtX2Rldl9hbGxvYygpLgo+PiAgICoKPj4gICAqIC4uIGNvZGUtYmxvY2s6OiBjCj4+
ICAgKgo+PiBAQCAtMjk0LDIyICsyOTQsMTIgQEAgdm9pZCBkcm1fbWlub3JfcmVsZWFzZShzdHJ1
Y3QgZHJtX21pbm9yICptaW5vcikKPj4gICAqCQlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtOwo+PiAg
ICoJCWludCByZXQ7Cj4+ICAgKgo+PiAtICoJCS8vIGRldm1fa3phbGxvYygpIGNhbid0IGJlIHVz
ZWQgaGVyZSBiZWNhdXNlIHRoZSBkcm1fZGV2aWNlICcKPj4gLSAqCQkvLyBsaWZldGltZSBjYW4g
ZXhjZWVkIHRoZSBkZXZpY2UgbGlmZXRpbWUgaWYgZHJpdmVyIHVuYmluZAo+PiAtICoJCS8vIGhh
cHBlbnMgd2hlbiB1c2Vyc3BhY2Ugc3RpbGwgaGFzIG9wZW4gZmlsZSBkZXNjcmlwdG9ycy4KPj4g
LSAqCQlwcml2ID0ga3phbGxvYyhzaXplb2YoKnByaXYpLCBHRlBfS0VSTkVMKTsKPj4gLSAqCQlp
ZiAoIXByaXYpCj4+IC0gKgkJCXJldHVybiAtRU5PTUVNOwo+PiAtICoKPj4gKyAqCQlwcml2ID0g
ZGV2bV9kcm1fZGV2X2FsbG9jKCZwZGV2LT5kZXYsICZkcml2ZXJfZHJtX2RyaXZlciwKPj4gKyAq
CQkJCQkgIHN0cnVjdCBkcml2ZXJfZGV2aWNlLCBkcm0pOwo+PiArICoJCWlmIChJU19FUlIocHJp
dikpCj4+ICsgKgkJCXJldHVybiBQVFJfRVJSKHByaXYpOwo+PiAgICoJCWRybSA9ICZwcml2LT5k
cm07Cj4+ICAgKgo+PiAtICoJCXJldCA9IGRldm1fZHJtX2Rldl9pbml0KCZwZGV2LT5kZXYsIGRy
bSwgJmRyaXZlcl9kcm1fZHJpdmVyKTsKPj4gLSAqCQlpZiAocmV0KSB7Cj4+IC0gKgkJCWtmcmVl
KHByaXYpOwo+PiAtICoJCQlyZXR1cm4gcmV0Owo+PiAtICoJCX0KPj4gLSAqCQlkcm1tX2FkZF9m
aW5hbF9rZnJlZShkcm0sIHByaXYpOwo+PiAtICoKPj4gICAqCQlyZXQgPSBkcm1tX21vZGVfY29u
ZmlnX2luaXQoZHJtKTsKPj4gICAqCQlpZiAocmV0KQo+PiAgICoJCQlyZXR1cm4gcmV0Owo+PiBA
QCAtNTUwLDkgKzU0MCw5IEBAIHN0YXRpYyB2b2lkIGRybV9mc19pbm9kZV9mcmVlKHN0cnVjdCBp
bm9kZSAqaW5vZGUpCj4+ICAgKiBmb2xsb3dpbmcgZ3VpZGVsaW5lcyBhcHBseToKPj4gICAqCj4+
ICAgKiAgLSBUaGUgZW50aXJlIGRldmljZSBpbml0aWFsaXphdGlvbiBwcm9jZWR1cmUgc2hvdWxk
IGJlIHJ1biBmcm9tIHRoZQo+PiAtICogICAgJmNvbXBvbmVudF9tYXN0ZXJfb3BzLm1hc3Rlcl9i
aW5kIGNhbGxiYWNrLCBzdGFydGluZyB3aXRoIGRybV9kZXZfaW5pdCgpLAo+PiAtICogICAgdGhl
biBiaW5kaW5nIGFsbCBjb21wb25lbnRzIHdpdGggY29tcG9uZW50X2JpbmRfYWxsKCkgYW5kIGZp
bmlzaGluZyB3aXRoCj4+IC0gKiAgICBkcm1fZGV2X3JlZ2lzdGVyKCkuCj4+ICsgKiAgICAmY29t
cG9uZW50X21hc3Rlcl9vcHMubWFzdGVyX2JpbmQgY2FsbGJhY2ssIHN0YXJ0aW5nIHdpdGgKPj4g
KyAqICAgIGRldm1fZHJtX2Rldl9hbGxvYygpLCB0aGVuIGJpbmRpbmcgYWxsIGNvbXBvbmVudHMg
d2l0aAo+PiArICogICAgY29tcG9uZW50X2JpbmRfYWxsKCkgYW5kIGZpbmlzaGluZyB3aXRoIGRy
bV9kZXZfcmVnaXN0ZXIoKS4KPj4gICAqCj4+ICAgKiAgLSBUaGUgb3BhcXVlIHBvaW50ZXIgcGFz
c2VkIHRvIGFsbCBjb21wb25lbnRzIHRocm91Z2ggY29tcG9uZW50X2JpbmRfYWxsKCkKPj4gICAq
ICAgIHNob3VsZCBwb2ludCBhdCAmc3RydWN0IGRybV9kZXZpY2Ugb2YgdGhlIGRldmljZSBpbnN0
YW5jZSwgbm90IHNvbWUgZHJpdmVyCj4+IEBAIC03MDYsMjQgKzY5Niw5IEBAIHN0YXRpYyB2b2lk
IGRldm1fZHJtX2Rldl9pbml0X3JlbGVhc2Uodm9pZCAqZGF0YSkKPj4gIAlkcm1fZGV2X3B1dChk
YXRhKTsKPj4gIH0KPj4gIAo+PiAtLyoqCj4+IC0gKiBkZXZtX2RybV9kZXZfaW5pdCAtIFJlc291
cmNlIG1hbmFnZWQgZHJtX2Rldl9pbml0KCkKPj4gLSAqIEBwYXJlbnQ6IFBhcmVudCBkZXZpY2Ug
b2JqZWN0Cj4+IC0gKiBAZGV2OiBEUk0gZGV2aWNlCj4+IC0gKiBAZHJpdmVyOiBEUk0gZHJpdmVy
Cj4+IC0gKgo+PiAtICogTWFuYWdlZCBkcm1fZGV2X2luaXQoKS4gVGhlIERSTSBkZXZpY2UgaW5p
dGlhbGl6ZWQgd2l0aCB0aGlzIGZ1bmN0aW9uIGlzCj4+IC0gKiBhdXRvbWF0aWNhbGx5IHB1dCBv
biBkcml2ZXIgZGV0YWNoIHVzaW5nIGRybV9kZXZfcHV0KCkuCj4+IC0gKgo+PiAtICogTm90ZSB0
aGF0IGRyaXZlcnMgbXVzdCBjYWxsIGRybW1fYWRkX2ZpbmFsX2tmcmVlKCkgYWZ0ZXIgdGhpcyBm
dW5jdGlvbiBoYXMKPj4gLSAqIGNvbXBsZXRlZCBzdWNjZXNzZnVsbHkuCj4+IC0gKgo+PiAtICog
UkVUVVJOUzoKPj4gLSAqIDAgb24gc3VjY2Vzcywgb3IgZXJyb3IgY29kZSBvbiBmYWlsdXJlLgo+
PiAtICovCj4+IC1pbnQgZGV2bV9kcm1fZGV2X2luaXQoc3RydWN0IGRldmljZSAqcGFyZW50LAo+
PiAtCQkgICAgICBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+PiAtCQkgICAgICBzdHJ1Y3QgZHJt
X2RyaXZlciAqZHJpdmVyKQo+PiArc3RhdGljIGludCBkZXZtX2RybV9kZXZfaW5pdChzdHJ1Y3Qg
ZGV2aWNlICpwYXJlbnQsCj4+ICsJCQkgICAgIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4+ICsJ
CQkgICAgIHN0cnVjdCBkcm1fZHJpdmVyICpkcml2ZXIpCj4+ICB7Cj4+ICAJaW50IHJldDsKPj4g
IAo+PiBAQCAtNzM3LDcgKzcxMiw2IEBAIGludCBkZXZtX2RybV9kZXZfaW5pdChzdHJ1Y3QgZGV2
aWNlICpwYXJlbnQsCj4+ICAKPj4gIAlyZXR1cm4gcmV0Owo+PiAgfQo+PiAtRVhQT1JUX1NZTUJP
TChkZXZtX2RybV9kZXZfaW5pdCk7Cj4+ICAKPj4gIHZvaWQgKl9fZGV2bV9kcm1fZGV2X2FsbG9j
KHN0cnVjdCBkZXZpY2UgKnBhcmVudCwgc3RydWN0IGRybV9kcml2ZXIgKmRyaXZlciwKPj4gIAkJ
CSAgIHNpemVfdCBzaXplLCBzaXplX3Qgb2Zmc2V0KQo+PiBAQCAtNzY3LDE5ICs3NDEsOSBAQCBF
WFBPUlRfU1lNQk9MKF9fZGV2bV9kcm1fZGV2X2FsbG9jKTsKPj4gICAqIEBkcml2ZXI6IERSTSBk
cml2ZXIgdG8gYWxsb2NhdGUgZGV2aWNlIGZvcgo+PiAgICogQHBhcmVudDogUGFyZW50IGRldmlj
ZSBvYmplY3QKPj4gICAqCj4+IC0gKiBBbGxvY2F0ZSBhbmQgaW5pdGlhbGl6ZSBhIG5ldyBEUk0g
ZGV2aWNlLiBObyBkZXZpY2UgcmVnaXN0cmF0aW9uIGlzIGRvbmUuCj4+IC0gKiBDYWxsIGRybV9k
ZXZfcmVnaXN0ZXIoKSB0byBhZHZlcnRpY2UgdGhlIGRldmljZSB0byB1c2VyIHNwYWNlIGFuZCBy
ZWdpc3RlciBpdAo+PiAtICogd2l0aCBvdGhlciBjb3JlIHN1YnN5c3RlbXMuIFRoaXMgc2hvdWxk
IGJlIGRvbmUgbGFzdCBpbiB0aGUgZGV2aWNlCj4+IC0gKiBpbml0aWFsaXphdGlvbiBzZXF1ZW5j
ZSB0byBtYWtlIHN1cmUgdXNlcnNwYWNlIGNhbid0IGFjY2VzcyBhbiBpbmNvbnNpc3RlbnQKPj4g
LSAqIHN0YXRlLgo+PiAtICoKPj4gLSAqIFRoZSBpbml0aWFsIHJlZi1jb3VudCBvZiB0aGUgb2Jq
ZWN0IGlzIDEuIFVzZSBkcm1fZGV2X2dldCgpIGFuZAo+PiAtICogZHJtX2Rldl9wdXQoKSB0byB0
YWtlIGFuZCBkcm9wIGZ1cnRoZXIgcmVmLWNvdW50cy4KPj4gLSAqCj4+IC0gKiBOb3RlIHRoYXQg
Zm9yIHB1cmVseSB2aXJ0dWFsIGRldmljZXMgQHBhcmVudCBjYW4gYmUgTlVMTC4KPj4gLSAqCj4+
IC0gKiBEcml2ZXJzIHRoYXQgd2lzaCB0byBzdWJjbGFzcyBvciBlbWJlZCAmc3RydWN0IGRybV9k
ZXZpY2UgaW50byB0aGVpcgo+PiAtICogb3duIHN0cnVjdCBzaG91bGQgbG9vayBhdCB1c2luZyBk
cm1fZGV2X2luaXQoKSBpbnN0ZWFkLgo+PiArICogVGhpcyBpcyB0aGUgZGVwcmVjYXRlZCB2ZXJz
aW9uIG9mIGRldm1fZHJtX2Rldl9hbGxvYygpLCB3aGljaCBkb2VzIG5vdCBzdXBwb3J0Cj4+ICsg
KiBzdWJjbGFzc2luZyB0aHJvdWdoIGVtYmVkZGluZyB0aGUgc3RydWN0ICZkcm1fZGV2aWNlIGlu
IGEgZHJpdmVyIHByaXZhdGUKPj4gKyAqIHN0cnVjdHVyZSwgYW5kIHdoaWNoIGRvZXMgbm90IHN1
cHBvcnQgYXV0b21hdGljIGNsZWFudXAgdGhyb3VnaCBkZXZyZXMuCj4+ICAgKgo+PiAgICogUkVU
VVJOUzoKPj4gICAqIFBvaW50ZXIgdG8gbmV3IERSTSBkZXZpY2UsIG9yIEVSUl9QVFIgb24gZmFp
bHVyZS4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbWFuYWdlZC5jIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9tYW5hZ2VkLmMKPj4gaW5kZXggMWUxMzU2NTYwYzJlLi5jMzZlM2Q5
OGZkNzEgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbWFuYWdlZC5jCj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbWFuYWdlZC5jCj4+IEBAIC0yNyw3ICsyNyw3IEBACj4+
ICAgKiBiZSBkb25lIGRpcmVjdGx5IHdpdGggZHJtbV9rbWFsbG9jKCkgYW5kIHRoZSByZWxhdGVk
IGZ1bmN0aW9ucy4gRXZlcnl0aGluZwo+PiAgICogd2lsbCBiZSByZWxlYXNlZCBvbiB0aGUgZmlu
YWwgZHJtX2Rldl9wdXQoKSBpbiByZXZlcnNlIG9yZGVyIG9mIGhvdyB0aGUKPj4gICAqIHJlbGVh
c2UgYWN0aW9ucyBoYXZlIGJlZW4gYWRkZWQgYW5kIG1lbW9yeSBoYXMgYmVlbiBhbGxvY2F0ZWQg
c2luY2UgZHJpdmVyCj4+IC0gKiBsb2FkaW5nIHN0YXJ0ZWQgd2l0aCBkcm1fZGV2X2luaXQoKS4K
Pj4gKyAqIGxvYWRpbmcgc3RhcnRlZCB3aXRoIGRldm1fZHJtX2Rldl9hbGxvYygpLgo+PiAgICoK
Pj4gICAqIE5vdGUgdGhhdCByZWxlYXNlIGFjdGlvbnMgYW5kIG1hbmFnZWQgbWVtb3J5IGNhbiBh
bHNvIGJlIGFkZGVkIGFuZCByZW1vdmVkCj4+ICAgKiBkdXJpbmcgdGhlIGxpZmV0aW1lIG9mIHRo
ZSBkcml2ZXIsIGFsbCB0aGUgZnVuY3Rpb25zIGFyZSBmdWxseSBjb25jdXJyZW50Cj4+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZGV2aWNlLmggYi9pbmNsdWRlL2RybS9kcm1fZGV2aWNl
LmgKPj4gaW5kZXggMDk4ODM1MWQ3NDNjLi5mNGY2OGU3YTkxNDkgMTAwNjQ0Cj4+IC0tLSBhL2lu
Y2x1ZGUvZHJtL2RybV9kZXZpY2UuaAo+PiArKysgYi9pbmNsdWRlL2RybS9kcm1fZGV2aWNlLmgK
Pj4gQEAgLTkyLDcgKzkyLDcgQEAgc3RydWN0IGRybV9kZXZpY2Ugewo+PiAgCSAqIE5VTEwuCj4+
ICAJICoKPj4gIAkgKiBJbnN0ZWFkIG9mIHVzaW5nIHRoaXMgcG9pbnRlciBpdCBpcyByZWNvbW1l
bmRlZCB0aGF0IGRyaXZlcnMgdXNlCj4+IC0JICogZHJtX2Rldl9pbml0KCkgYW5kIGVtYmVkIHN0
cnVjdCAmZHJtX2RldmljZSBpbiB0aGVpciBsYXJnZXIKPj4gKwkgKiBkZXZtX2RybV9kZXZfYWxs
b2MoKSBhbmQgZW1iZWQgc3RydWN0ICZkcm1fZGV2aWNlIGluIHRoZWlyIGxhcmdlcgo+PiAgCSAq
IHBlci1kZXZpY2Ugc3RydWN0dXJlLgo+PiAgCSAqLwo+PiAgCXZvaWQgKmRldl9wcml2YXRlOwo+
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2Rydi5oIGIvaW5jbHVkZS9kcm0vZHJtX2Ry
di5oCj4+IGluZGV4IDZiYTdkZDExMzg0ZC4uNTMzYzZlMWE1YTk1IDEwMDY0NAo+PiAtLS0gYS9p
bmNsdWRlL2RybS9kcm1fZHJ2LmgKPj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2Rydi5oCj4+IEBA
IC0xNjMsMTMgKzE2MywxMiBAQCBzdHJ1Y3QgZHJtX2RyaXZlciB7Cj4+ICAJLyoqCj4+ICAJICog
QGxvYWQ6Cj4+ICAJICoKPj4gLQkgKiBCYWNrd2FyZC1jb21wYXRpYmxlIGRyaXZlciBjYWxsYmFj
ayB0byBjb21wbGV0ZQo+PiAtCSAqIGluaXRpYWxpemF0aW9uIHN0ZXBzIGFmdGVyIHRoZSBkcml2
ZXIgaXMgcmVnaXN0ZXJlZC4gIEZvcgo+PiAtCSAqIHRoaXMgcmVhc29uLCBtYXkgc3VmZmVyIGZy
b20gcmFjZSBjb25kaXRpb25zIGFuZCBpdHMgdXNlIGlzCj4+IC0JICogZGVwcmVjYXRlZCBmb3Ig
bmV3IGRyaXZlcnMuICBJdCBpcyB0aGVyZWZvcmUgb25seSBzdXBwb3J0ZWQKPj4gLQkgKiBmb3Ig
ZXhpc3RpbmcgZHJpdmVycyBub3QgeWV0IGNvbnZlcnRlZCB0byB0aGUgbmV3IHNjaGVtZS4KPj4g
LQkgKiBTZWUgZHJtX2Rldl9pbml0KCkgYW5kIGRybV9kZXZfcmVnaXN0ZXIoKSBmb3IgcHJvcGVy
IGFuZAo+PiAtCSAqIHJhY2UtZnJlZSB3YXkgdG8gc2V0IHVwIGEgJnN0cnVjdCBkcm1fZGV2aWNl
Lgo+PiArCSAqIEJhY2t3YXJkLWNvbXBhdGlibGUgZHJpdmVyIGNhbGxiYWNrIHRvIGNvbXBsZXRl
IGluaXRpYWxpemF0aW9uIHN0ZXBzCj4+ICsJICogYWZ0ZXIgdGhlIGRyaXZlciBpcyByZWdpc3Rl
cmVkLiAgRm9yIHRoaXMgcmVhc29uLCBtYXkgc3VmZmVyIGZyb20KPj4gKwkgKiByYWNlIGNvbmRp
dGlvbnMgYW5kIGl0cyB1c2UgaXMgZGVwcmVjYXRlZCBmb3IgbmV3IGRyaXZlcnMuICBJdCBpcwo+
PiArCSAqIHRoZXJlZm9yZSBvbmx5IHN1cHBvcnRlZCBmb3IgZXhpc3RpbmcgZHJpdmVycyBub3Qg
eWV0IGNvbnZlcnRlZCB0bwo+PiArCSAqIHRoZSBuZXcgc2NoZW1lLiAgU2VlIGRldm1fZHJtX2Rl
dl9hbGxvYygpIGFuZCBkcm1fZGV2X3JlZ2lzdGVyKCkgZm9yCj4+ICsJICogcHJvcGVyIGFuZCBy
YWNlLWZyZWUgd2F5IHRvIHNldCB1cCBhICZzdHJ1Y3QgZHJtX2RldmljZS4KPj4gIAkgKgo+PiAg
CSAqIFRoaXMgaXMgZGVwcmVjYXRlZCwgZG8gbm90IHVzZSEKPj4gIAkgKgo+PiBAQCAtNTk1LDkg
KzU5NCw2IEBAIHN0cnVjdCBkcm1fZHJpdmVyIHsKPj4gIGludCBkcm1fZGV2X2luaXQoc3RydWN0
IGRybV9kZXZpY2UgKmRldiwKPj4gIAkJIHN0cnVjdCBkcm1fZHJpdmVyICpkcml2ZXIsCj4+ICAJ
CSBzdHJ1Y3QgZGV2aWNlICpwYXJlbnQpOwo+PiAtaW50IGRldm1fZHJtX2Rldl9pbml0KHN0cnVj
dCBkZXZpY2UgKnBhcmVudCwKPj4gLQkJICAgICAgc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPj4g
LQkJICAgICAgc3RydWN0IGRybV9kcml2ZXIgKmRyaXZlcik7Cj4+ICAKPj4gIHZvaWQgKl9fZGV2
bV9kcm1fZGV2X2FsbG9jKHN0cnVjdCBkZXZpY2UgKnBhcmVudCwgc3RydWN0IGRybV9kcml2ZXIg
KmRyaXZlciwKPj4gIAkJCSAgIHNpemVfdCBzaXplLCBzaXplX3Qgb2Zmc2V0KTsKPj4gLS0gCj4+
IDIuMjguMAo+Pgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
