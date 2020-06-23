Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5417E2048FA
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jun 2020 07:11:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 852B76E93D;
	Tue, 23 Jun 2020 05:11:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE8F6E93B;
 Tue, 23 Jun 2020 05:11:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OHruGxGLD9EVZzahk9dc5WZfRblaItWmRskscFSPMGaBjjwSqz8AffLOYi+5WwAWpRU1g23/w+NxRckxPlgfbDxwr/L+W254I7R5x4yhpF56YVgdp6yVn2eVZ/ikdBN3QW9ziRFi63BrDCu5Xv4QgMAMZEeuGMOcnyQvFSvB4Fjv/zXBFmG+9X3bmFiBUoMm9gQAAZWYhnViGTMflBe6Mfm5Y/5UbVQuCk00ZxF5F1/O3B3V/x+n8U8PKGQTF2m10rFu+wlrxa7yl5LosbcFo4+NqDRU2oPH4j8IYW9f5fsNpqvoAWnxVamMmYpJhVTi9Rw/MEQzOpKNKo8rYtXRKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8J9MfT0IOBxJNYQb9MZU2VlahA4NcXo48ZTvqLwwGI=;
 b=XgyyGeJlFIH3kiAQxWWZ/BP+yM5TaqUK8X0jAYb9WaA1MUkEREjHES+IuZjup6BzFiODABNQYdDizTIREQ3/xuQM+X4Z5PpQOpoRJ+QbyzzI182tRZPD4fjQnE/zdpYfEGAZZtJIjKiUGVkOE8sfcc6zOETBzRSvFwssqdxBOwbgI+Oi+aTweqq9DPSzWshpG+MD7upLlV5vy52imLzRWaGf81tPjEvwIhZu7dIxPz2jkoAXi6gVrrII8Syl7qsFbQXhggzmyOam16MVYWAHrGg0QYUYAAxNh0LjbNjm51lB8jGL80G9ud3bYz3WrcUFVoNlgY7QIPnI7T6vUU/myw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8J9MfT0IOBxJNYQb9MZU2VlahA4NcXo48ZTvqLwwGI=;
 b=Tjl8N65Wf1p9QWkzyidmQgBqcgg1lTV8KSub7uuS06SlUVx+C/73HaJRgUNJg9pdlpztzVRvFSjXtv7LgTBLZbeymmEsHBbEh6tSNQC6NtYwCSdg9/kPe4lIi3tfUao+zUATTyx+7DW4ghE8e5C9tTv8/qnR5My1YQtLE4Tzc70=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB3596.namprd12.prod.outlook.com (2603:10b6:5:3e::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.23; Tue, 23 Jun 2020 05:11:47 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::f5e6:e937:2eac:18cf]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::f5e6:e937:2eac:18cf%3]) with mapi id 15.20.3109.027; Tue, 23 Jun 2020
 05:11:47 +0000
Subject: Re: [PATCH v2 7/8] drm/amdgpu: Fix sdma code crash post device unplug
To: christian.koenig@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-8-git-send-email-andrey.grodzovsky@amd.com>
 <8b27df86-c4c9-8e98-e525-993a3e00ee00@gmail.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <98e99191-e69a-2e94-bfb7-4a18290c1580@amd.com>
Date: Tue, 23 Jun 2020 01:11:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <8b27df86-c4c9-8e98-e525-993a3e00ee00@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0121.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::30) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:6818:fffb:5b06:bef1]
 (2607:fea8:3edf:49b0:6818:fffb:5b06:bef1) by
 YT1PR01CA0121.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Tue, 23 Jun 2020 05:11:46 +0000
X-Originating-IP: [2607:fea8:3edf:49b0:6818:fffb:5b06:bef1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a1dc2395-f9f9-41c2-0af6-08d81733edc1
X-MS-TrafficTypeDiagnostic: DM6PR12MB3596:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3596A74D980448512FBE7D34EA940@DM6PR12MB3596.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-Forefront-PRVS: 04433051BF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qADTbSX4w4d8rH1XOWPeqfJPJEDJynFx3cbVNwr2jfLR9C6NFc5/gA3wbX9/vsjX3Vy1Nsvedj5fqtLDFy244eA9Lr9xJVO7gnnm/VR7IfNo+yv8gF87lMGVdOCTfxC++mqCaOJRNIsuoZPSBMlyyrYG3uUykWenD1XyZH/sIavmAVEndRlpLHxy6TfJ/9BOOA+0fE7QqNIuOFZ0IZVU7wfeBN6g5GldQh0ACWDG4eCCAHWWZBLlDez/TZoc3xDTAvuL9Pgwdr834868UxjQ3LCGf4x/F1jcbD8/Tvc8KXOIHlmyZSfBq1SHL30YQmaLGdD7iDIiFHOkZPQvJ2LCTREt0MhaGXrU9UEkOoV4+UJCMqRn4GxJmrz5BvXrN9ln
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(136003)(366004)(346002)(396003)(39860400002)(66574015)(16526019)(66946007)(52116002)(186003)(8676002)(4326008)(53546011)(2616005)(8936002)(31696002)(86362001)(5660300002)(83380400001)(6486002)(31686004)(2906002)(66556008)(66476007)(478600001)(36756003)(316002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: CURL8gQxoQVZt6hvTs9RIsfpd+RF4XF+cF25ZL2DIcJZ2asPJS4dd+pPSylWEayeLChVP6gQMAxOWz2k+GON4r0CXL8WQD5AsiEBARQ/6Cz1gVC2VdoUPPGB8hltT50LsgPGjbboWGVSoE0aJLY7N2ZY4r8zfi2GygSKXHmDtx10Y9boYMRfLieTYJM24HTJW86lTjRmM659Ln91VEAbIReLYjRFU/amEeB5F9vbn6yTNzeh5bxF4POD6sDU+rcz33MfFXrPsuOqnJhMoztlMiwa67qeFbvw+RP6JSIiJk2am1U2D2LuqGpdjh8JPfBxTDsY+1DuKkzI+OfAB0naTs/oFY2qhQpjhh7tF3f9pJjVWEBHalJ3rP6AWR1FQ3+zS05xd/CTi0921fxUXTgrcxOxjIwnaAdc4n2uJCsdaTDcHQnHR/fv88D8C1wNF6rGuW4biCCtzFOJFP9HG3y4dcTERV3SLEw9x9qp1NOimHPWBp++AZAsrykmn355z3pS9Ou8USExKRar2Bic6zlrZE8nWHXmpPU/AO1If1XOZUsFLH83TEncXB9gbRArWRxB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1dc2395-f9f9-41c2-0af6-08d81733edc1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2020 05:11:47.3861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VIi0npS+B5NqGLS13mh1RBla999IoyunuLT+nDYbtTRRHl6ZfCk2ZflzVpj2Lqxip7erBN6zwP2D4Rcn4vPnrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3596
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
Cc: alexdeucher@gmail.com, daniel.vetter@ffwll.ch, michel@daenzer.net,
 ppaalanen@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Ck9uIDYvMjIvMjAgMzo0MCBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBbSAyMS4wNi4y
MCB1bSAwODowMyBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+PiBlbnRpdHktPnJxIGJlY29t
ZXMgbnVsbCBhZnRyZSBkZXZpY2UgdW5wbHVnZ2VkIHNvIGp1c3QgcmV0dXJuIGVhcmx5Cj4+IGlu
IHRoYXQgY2FzZS4KPgo+IE1obSwgZG8geW91IGhhdmUgYSBiYWNrdHJhY2UgZm9yIHRoaXM/Cj4K
PiBUaGlzIHNob3VsZCBvbmx5IGJlIGNhbGxlZCBieSBhbiBJT0NUTCBhbmQgSU9DVExzIHNob3Vs
ZCBhbHJlYWR5IGNhbGwgCj4gZHJtX2Rldl9lbnRlcigpL2V4aXQoKSBvbiB0aGVpciBvd24uLi4K
Pgo+IENocmlzdGlhbi4KCgpTZWUgYmVsbG93LCBpdCdzIG5vdCBkdXJpbmcgSU9DVEwgYnV0IGR1
cmluZyBhbGwgR0VNIG9iamVjdHMgcmVsZWFzZSB3aGVuIApyZWxlYXNpbmcgdGhlIGRldmljZS4g
ZW50aXR5LT5ycSBiZWNvbWVzIG51bGwgYmVjYXVzZSBhbGwgdGhlIGdwdSBzY2hlZHVsZXJzIGFy
ZSAKbWFya2VkIGFzIG5vdCByZWFkeSBkdXJpbmcgdGhlIGVhcmx5IHBjaSByZW1vdmUgc3RhZ2Ug
YW5kIHNvIHRoZSBuZXh0IHRpbWUgc2RtYSAKam9iIHRyaWVzIHRvIHBpY2sgYSBzY2hlZHVsZXIg
dG8gcnVuIG5vdGhpbmcgaXMgYXZhaWxhYmxlIGFuZCBpdCdzIHNldCB0byBudWxsLgoKSnVuwqAg
OCAxMToxNDo1NiB1YnVudHUtMTYwNC10ZXN0IGtlcm5lbDogW8KgwqAgNDQuMzgyNjQ4XSBCVUc6
IGtlcm5lbCBOVUxMIHBvaW50ZXIgCmRlcmVmZXJlbmNlLCBhZGRyZXNzOiAwMDAwMDAwMDAwMDAw
MDM4Ckp1bsKgIDggMTE6MTQ6NTYgdWJ1bnR1LTE2MDQtdGVzdCBrZXJuZWw6IFvCoMKgIDQ0LjM4
MjY1MV0gI1BGOiBzdXBlcnZpc29yIHJlYWQgCmFjY2VzcyBpbiBrZXJuZWwgbW9kZQpKdW7CoCA4
IDExOjE0OjU2IHVidW50dS0xNjA0LXRlc3Qga2VybmVsOiBbwqDCoCA0NC4zODI2NTJdICNQRjog
ZXJyb3JfY29kZSgweDAwMDApIAotIG5vdC1wcmVzZW50IHBhZ2UKSnVuwqAgOCAxMToxNDo1NiB1
YnVudHUtMTYwNC10ZXN0IGtlcm5lbDogW8KgwqAgNDQuMzgyNjUzXSBQR0QgMCBQNEQgMApKdW7C
oCA4IDExOjE0OjU2IHVidW50dS0xNjA0LXRlc3Qga2VybmVsOiBbwqDCoCA0NC4zODI2NTZdIE9v
cHM6IDAwMDAgWyMxXSBTTVAgUFRJCkp1bsKgIDggMTE6MTQ6NTYgdWJ1bnR1LTE2MDQtdGVzdCBr
ZXJuZWw6IFvCoMKgIDQ0LjM4MjY1OF0gQ1BVOiA2IFBJRDogMjU5OCBDb21tOiAKbGx2bXBpcGUt
NiBUYWludGVkOiBHwqDCoMKgwqDCoMKgwqDCoMKgwqAgT0XCoMKgwqDCoCA1LjYuMC1kZXYrICM1
MQpKdW7CoCA4IDExOjE0OjU2IHVidW50dS0xNjA0LXRlc3Qga2VybmVsOiBbwqDCoCA0NC4zODI2
NTldIEhhcmR3YXJlIG5hbWU6IFN5c3RlbSAKbWFudWZhY3R1cmVyIFN5c3RlbSBQcm9kdWN0IE5h
bWUvUkFNUEFHRSBJViBGT1JNVUxBLCBCSU9TIDQ4MDQgMTIvMzAvMjAxMwpKdW7CoCA4IDExOjE0
OjU2IHVidW50dS0xNjA0LXRlc3Qga2VybmVsOiBbwqDCoCA0NC4zODI3MDBdIFJJUDogCjAwMTA6
YW1kZ3B1X3ZtX3NkbWFfY29tbWl0KzB4NmMvMHgyNzAgW2FtZGdwdV0KSnVuwqAgOCAxMToxNDo1
NiB1YnVudHUtMTYwNC10ZXN0IGtlcm5lbDogW8KgwqAgNDQuMzgyNzAyXSBDb2RlOiAwMSAwMCAw
MCA0OCA4OSBlZSAKNDggYzcgYzcgZWYgZDQgODUgYzAgZTggZmMgNWYgZTggZmYgNDggOGIgNzUg
MTAgNDggYzcgYzcgZmQgZDQgODUgYzAgZTggZWMgNWYgZTggCmZmIDQ4IDhiIDQ1IDEwIDQxIDhi
IDU1IDA4IDw0OD4gOGIgNDAgMzggODUgZDIgNDggOGQgYjggMzAgZmYgZmYgZmYgMGYgODQgOWIg
MDEgCjAwIDAwIDQ4IDhiIDgwCkp1bsKgIDggMTE6MTQ6NTYgdWJ1bnR1LTE2MDQtdGVzdCBrZXJu
ZWw6IFvCoMKgIDQ0LjM4MjcwNF0gUlNQOiAKMDAxODpmZmZmYTg4ZTQwZjU3OTUwIEVGTEFHUzog
MDAwMTAyODIKSnVuwqAgOCAxMToxNDo1NiB1YnVudHUtMTYwNC10ZXN0IGtlcm5lbDogW8KgwqAg
NDQuMzgyNzA1XSBSQVg6IDAwMDAwMDAwMDAwMDAwMDAgClJCWDogZmZmZmE4OGU0MGY1NzlhOCBS
Q1g6IDAwMDAwMDAwMDAwMDAwMDEKSnVuwqAgOCAxMToxNDo1NiB1YnVudHUtMTYwNC10ZXN0IGtl
cm5lbDogW8KgwqAgNDQuMzgyNzA3XSBSRFg6IDAwMDAwMDAwMDAwMDAwMTQgClJTSTogZmZmZjk0
ZDRkNjIzODhlMCBSREk6IGZmZmY5NGQ0ZGJkOThlMzAKSnVuwqAgOCAxMToxNDo1NiB1YnVudHUt
MTYwNC10ZXN0IGtlcm5lbDogW8KgwqAgNDQuMzgyNzA4XSBSQlA6IGZmZmY5NGQ0ZDJhZDMyODgg
ClIwODogMDAwMDAwMDAwMDAwMDAwMCBSMDk6IDAwMDAwMDAwMDAwMDAwMDEKSnVuwqAgOCAxMTox
NDo1NiB1YnVudHUtMTYwNC10ZXN0IGtlcm5lbDogW8KgwqAgNDQuMzgyNzA5XSBSMTA6IDAwMDAw
MDAwMDAwMDAwMWYgClIxMTogMDAwMDAwMDAwMDAwMDAwMCBSMTI6IGZmZmZhODhlNDBmNTdhNDgK
SnVuwqAgOCAxMToxNDo1NiB1YnVudHUtMTYwNC10ZXN0IGtlcm5lbDogW8KgwqAgNDQuMzgyNzEw
XSBSMTM6IGZmZmY5NGQ0ZDYyN2E1ZTggClIxNDogZmZmZjk0ZDRkNDI0ZDk3OCBSMTU6IDAwMDAw
MDA4MDAxMDAwMjAKSnVuwqAgOCAxMToxNDo1NiB1YnVudHUtMTYwNC10ZXN0IGtlcm5lbDogW8Kg
wqAgNDQuMzgyNzEyXSBGUzogCjAwMDA3ZjMwYWU2OTQ3MDAoMDAwMCkgR1M6ZmZmZjk0ZDRkYmQ4
MDAwMCgwMDAwKSBrbmxHUzowMDAwMDAwMDAwMDAwMDAwCkp1bsKgIDggMTE6MTQ6NTYgdWJ1bnR1
LTE2MDQtdGVzdCBrZXJuZWw6IFvCoMKgIDQ0LjM4MjcxM10gQ1M6wqAgMDAxMCBEUzogMDAwMCBF
UzogCjAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzCkp1bsKgIDggMTE6MTQ6NTYgdWJ1bnR1LTE2
MDQtdGVzdCBrZXJuZWw6IFvCoMKgIDQ0LjM4MjcxNF0gQ1IyOiAwMDAwMDAwMDAwMDAwMDM4IApD
UjM6IDAwMDAwMDAxMjE4MTAwMDYgQ1I0OiAwMDAwMDAwMDAwMDYwNmUwCkp1bsKgIDggMTE6MTQ6
NTYgdWJ1bnR1LTE2MDQtdGVzdCBrZXJuZWw6IFvCoMKgIDQ0LjM4MjcxNl0gQ2FsbCBUcmFjZToK
SnVuwqAgOCAxMToxNDo1NiB1YnVudHUtMTYwNC10ZXN0IGtlcm5lbDogW8KgwqAgNDQuMzgyNzU1
XSAKYW1kZ3B1X3ZtX2JvX3VwZGF0ZV9tYXBwaW5nLmNvbnN0cHJvcC4zMCsweDE2Yi8weDIzMCBb
YW1kZ3B1XQpKdW7CoCA4IDExOjE0OjU2IHVidW50dS0xNjA0LXRlc3Qga2VybmVsOiBbwqDCoCA0
NC4zODI3OTVdIAphbWRncHVfdm1fY2xlYXJfZnJlZWQrMHhkNy8weDIxMCBbYW1kZ3B1XQpKdW7C
oCA4IDExOjE0OjU2IHVidW50dS0xNjA0LXRlc3Qga2VybmVsOiBbwqDCoCA0NC4zODI4MzNdIAph
bWRncHVfZ2VtX29iamVjdF9jbG9zZSsweDIwMC8weDJiMCBbYW1kZ3B1XQpKdW7CoCA4IDExOjE0
OjU2IHVidW50dS0xNjA0LXRlc3Qga2VybmVsOiBbwqDCoCA0NC4zODI4NTZdwqAgPyAKZHJtX2dl
bV9vYmplY3RfaGFuZGxlX3B1dF91bmxvY2tlZCsweDkwLzB4OTAgW2RybV0KSnVuwqAgOCAxMTox
NDo1NiB1YnVudHUtMTYwNC10ZXN0IGtlcm5lbDogW8KgwqAgNDQuMzgyODY0XcKgID8gCmRybV9n
ZW1fb2JqZWN0X3JlbGVhc2VfaGFuZGxlKzB4MmMvMHg5MCBbZHJtXQpKdW7CoCA4IDExOjE0OjU2
IHVidW50dS0xNjA0LXRlc3Qga2VybmVsOiBbwqDCoCA0NC4zODI4NzJdIApkcm1fZ2VtX29iamVj
dF9yZWxlYXNlX2hhbmRsZSsweDJjLzB4OTAgW2RybV0KSnVuwqAgOCAxMToxNDo1NiB1YnVudHUt
MTYwNC10ZXN0IGtlcm5lbDogW8KgwqAgNDQuMzgyODc5XcKgID8gCmRybV9nZW1fb2JqZWN0X2hh
bmRsZV9wdXRfdW5sb2NrZWQrMHg5MC8weDkwIFtkcm1dCkp1bsKgIDggMTE6MTQ6NTYgdWJ1bnR1
LTE2MDQtdGVzdCBrZXJuZWw6IFvCoMKgIDQ0LjM4Mjg4Ml0gaWRyX2Zvcl9lYWNoKzB4NDgvMHhk
MApKdW7CoCA4IDExOjE0OjU2IHVidW50dS0xNjA0LXRlc3Qga2VybmVsOiBbwqDCoCA0NC4zODI4
ODVdwqAgPyAKX3Jhd19zcGluX3VubG9ja19pcnFyZXN0b3JlKzB4MmQvMHg1MApKdW7CoCA4IDEx
OjE0OjU2IHVidW50dS0xNjA0LXRlc3Qga2VybmVsOiBbwqDCoCA0NC4zODI4OTNdIApkcm1fZ2Vt
X3JlbGVhc2UrMHgxYy8weDMwIFtkcm1dCkp1bsKgIDggMTE6MTQ6NTYgdWJ1bnR1LTE2MDQtdGVz
dCBrZXJuZWw6IFvCoMKgIDQ0LjM4MjkwMV0gCmRybV9maWxlX2ZyZWUrMHgyMWQvMHgyNzAgW2Ry
bV0KSnVuwqAgOCAxMToxNDo1NiB1YnVudHUtMTYwNC10ZXN0IGtlcm5lbDogW8KgwqAgNDQuMzgy
OTA4XSBkcm1fcmVsZWFzZSsweDY3LzB4ZTAgW2RybV0KSnVuwqAgOCAxMToxNDo1NiB1YnVudHUt
MTYwNC10ZXN0IGtlcm5lbDogW8KgwqAgNDQuMzgyOTEyXSBfX2ZwdXQrMHhjNi8weDI2MApKdW7C
oCA4IDExOjE0OjU2IHVidW50dS0xNjA0LXRlc3Qga2VybmVsOiBbwqDCoCA0NC4zODI5MTZdIHRh
c2tfd29ya19ydW4rMHg3OS8weGIwCkp1bsKgIDggMTE6MTQ6NTYgdWJ1bnR1LTE2MDQtdGVzdCBr
ZXJuZWw6IFvCoMKgIDQ0LjM4MjkxOV0gZG9fZXhpdCsweDNkMC8weGM0MApKdW7CoCA4IDExOjE0
OjU2IHVidW50dS0xNjA0LXRlc3Qga2VybmVsOiBbwqDCoCA0NC4zODI5MjFdwqAgPyBnZXRfc2ln
bmFsKzB4MTNkLzB4YzMwCkp1bsKgIDggMTE6MTQ6NTYgdWJ1bnR1LTE2MDQtdGVzdCBrZXJuZWw6
IFvCoMKgIDQ0LjM4MjkyNF0gZG9fZ3JvdXBfZXhpdCsweDQ3LzB4YjAKSnVuwqAgOCAxMToxNDo1
NiB1YnVudHUtMTYwNC10ZXN0IGtlcm5lbDogW8KgwqAgNDQuMzgyOTI2XSBnZXRfc2lnbmFsKzB4
MThiLzB4YzMwCkp1bsKgIDggMTE6MTQ6NTYgdWJ1bnR1LTE2MDQtdGVzdCBrZXJuZWw6IFvCoMKg
IDQ0LjM4MjkyOV0gZG9fc2lnbmFsKzB4MzYvMHg2YTAKSnVuwqAgOCAxMToxNDo1NiB1YnVudHUt
MTYwNC10ZXN0IGtlcm5lbDogW8KgwqAgNDQuMzgyOTMxXcKgID8gCl9fc2V0X3Rhc2tfY29tbSsw
eDYyLzB4MTIwCkp1bsKgIDggMTE6MTQ6NTYgdWJ1bnR1LTE2MDQtdGVzdCBrZXJuZWw6IFvCoMKg
IDQ0LjM4MjkzNV3CoCA/IApfX3g2NF9zeXNfZnV0ZXgrMHg4OC8weDE4MApKdW7CoCA4IDExOjE0
OjU2IHVidW50dS0xNjA0LXRlc3Qga2VybmVsOiBbwqDCoCA0NC4zODI5MzhdIApleGl0X3RvX3Vz
ZXJtb2RlX2xvb3ArMHg2Zi8weGMwCkp1bsKgIDggMTE6MTQ6NTYgdWJ1bnR1LTE2MDQtdGVzdCBr
ZXJuZWw6IFvCoMKgIDQ0LjM4Mjk0MV0gZG9fc3lzY2FsbF82NCsweDE0OS8weDFjMApKdW7CoCA4
IDExOjE0OjU2IHVidW50dS0xNjA0LXRlc3Qga2VybmVsOiBbwqDCoCA0NC4zODI5NDNdIAplbnRy
eV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg0OS8weGJlCkp1bsKgIDggMTE6MTQ6NTYgdWJ1
bnR1LTE2MDQtdGVzdCBrZXJuZWw6IFvCoMKgIDQ0LjM4Mjk0NF0gUklQOiAwMDMzOjB4N2YzMGY3
ZjM1MzYwCkp1bsKgIDggMTE6MTQ6NTYgdWJ1bnR1LTE2MDQtdGVzdCBrZXJuZWw6IFvCoMKgIDQ0
LjM4Mjk0N10gQ29kZTogQmFkIFJJUCB2YWx1ZS4KCgpBbmRyZXkKCgo+Cj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgo+PiAt
LS0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtX3NkbWEuYyB8IDIx
ICsrKysrKysrKysrKysrKystLS0tLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9u
cygrKSwgNSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV92bV9zZG1hLmMgCj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3ZtX3NkbWEuYwo+PiBpbmRleCA4ZDljNmZlLi5kMjUyNDI3IDEwMDY0NAo+PiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm1fc2RtYS5jCj4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bV9zZG1hLmMKPj4gQEAgLTI0LDYg
KzI0LDcgQEAKPj4gwqAgI2luY2x1ZGUgImFtZGdwdV9qb2IuaCIKPj4gwqAgI2luY2x1ZGUgImFt
ZGdwdV9vYmplY3QuaCIKPj4gwqAgI2luY2x1ZGUgImFtZGdwdV90cmFjZS5oIgo+PiArI2luY2x1
ZGUgPGRybS9kcm1fZHJ2Lmg+Cj4+IMKgIMKgICNkZWZpbmUgQU1ER1BVX1ZNX1NETUFfTUlOX05V
TV9EV8KgwqDCoCAyNTZ1Cj4+IMKgICNkZWZpbmUgQU1ER1BVX1ZNX1NETUFfTUFYX05VTV9EV8Kg
wqDCoCAoMTZ1ICogMTAyNHUpCj4+IEBAIC05NCw3ICs5NSwxMiBAQCBzdGF0aWMgaW50IGFtZGdw
dV92bV9zZG1hX2NvbW1pdChzdHJ1Y3QgCj4+IGFtZGdwdV92bV91cGRhdGVfcGFyYW1zICpwLAo+
PiDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fc2NoZWRfZW50aXR5ICplbnRpdHk7Cj4+IMKgwqDCoMKg
wqAgc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nOwo+PiDCoMKgwqDCoMKgIHN0cnVjdCBkbWFfZmVu
Y2UgKmY7Cj4+IC3CoMKgwqAgaW50IHI7Cj4+ICvCoMKgwqAgaW50IHIsIGlkeDsKPj4gKwo+PiAr
wqDCoMKgIGlmICghZHJtX2Rldl9lbnRlcihwLT5hZGV2LT5kZGV2LCAmaWR4KSkgewo+PiArwqDC
oMKgwqDCoMKgwqAgciA9IC1FTk9ERVY7Cj4+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIG5vZGV2Owo+
PiArwqDCoMKgIH0KPj4gwqAgwqDCoMKgwqDCoCBlbnRpdHkgPSBwLT5pbW1lZGlhdGUgPyAmcC0+
dm0tPmltbWVkaWF0ZSA6ICZwLT52bS0+ZGVsYXllZDsKPj4gwqDCoMKgwqDCoCByaW5nID0gY29u
dGFpbmVyX29mKGVudGl0eS0+cnEtPnNjaGVkLCBzdHJ1Y3QgYW1kZ3B1X3JpbmcsIHNjaGVkKTsK
Pj4gQEAgLTEwNCw3ICsxMTAsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV92bV9zZG1hX2NvbW1pdChz
dHJ1Y3QgCj4+IGFtZGdwdV92bV91cGRhdGVfcGFyYW1zICpwLAo+PiDCoMKgwqDCoMKgIFdBUk5f
T04oaWItPmxlbmd0aF9kdyA+IHAtPm51bV9kd19sZWZ0KTsKPj4gwqDCoMKgwqDCoCByID0gYW1k
Z3B1X2pvYl9zdWJtaXQocC0+am9iLCBlbnRpdHksIEFNREdQVV9GRU5DRV9PV05FUl9WTSwgJmYp
Owo+PiDCoMKgwqDCoMKgIGlmIChyKQo+PiAtwqDCoMKgwqDCoMKgwqAgZ290byBlcnJvcjsKPj4g
K8KgwqDCoMKgwqDCoMKgIGdvdG8gam9iX2ZhaWw7Cj4+IMKgIMKgwqDCoMKgwqAgaWYgKHAtPnVu
bG9ja2VkKSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZG1hX2ZlbmNlICp0bXAgPSBk
bWFfZmVuY2VfZ2V0KGYpOwo+PiBAQCAtMTE4LDEwICsxMjQsMTUgQEAgc3RhdGljIGludCBhbWRn
cHVfdm1fc2RtYV9jb21taXQoc3RydWN0IAo+PiBhbWRncHVfdm1fdXBkYXRlX3BhcmFtcyAqcCwK
Pj4gwqDCoMKgwqDCoCBpZiAoZmVuY2UgJiYgIXAtPmltbWVkaWF0ZSkKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgIHN3YXAoKmZlbmNlLCBmKTsKPj4gwqDCoMKgwqDCoCBkbWFfZmVuY2VfcHV0KGYpOwo+
PiAtwqDCoMKgIHJldHVybiAwOwo+PiDCoCAtZXJyb3I6Cj4+IC3CoMKgwqAgYW1kZ3B1X2pvYl9m
cmVlKHAtPmpvYik7Cj4+ICvCoMKgwqAgciA9IDA7Cj4+ICsKPj4gK2pvYl9mYWlsOgo+PiArwqDC
oMKgIGRybV9kZXZfZXhpdChpZHgpOwo+PiArbm9kZXY6Cj4+ICvCoMKgwqAgaWYgKHIpCj4+ICvC
oMKgwqDCoMKgwqDCoCBhbWRncHVfam9iX2ZyZWUocC0+am9iKTsKPj4gKwo+PiDCoMKgwqDCoMKg
IHJldHVybiByOwo+PiDCoCB9Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4Cg==
