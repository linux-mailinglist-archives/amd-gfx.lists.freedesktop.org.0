Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B1910EE63
	for <lists+amd-gfx@lfdr.de>; Mon,  2 Dec 2019 18:35:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF0626E296;
	Mon,  2 Dec 2019 17:35:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680070.outbound.protection.outlook.com [40.107.68.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF3896E296
 for <amd-gfx@lists.freedesktop.org>; Mon,  2 Dec 2019 17:35:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IeUNc5cJreX6bfytKeXR4CX6GrtHpDPGroGInm4Prf/PXkdBGjLpFO3SYWMm+xapCMfNOkYG7EO9tS0cNVhwOtLReEHBtP5YVCVJofUhfnKhwHaUrjVAY0NUHritQ+Jt4ooq5uimUAP9DW/D8GioEZmSEle++F33hlFS0Umz95oKZaG+cfCBhLH15/zmnjWoA1OX/wPMTr6ogWVH0HfhUjBlyFFH7cGc61BJumWuTZ8vKuSmIE0Mywj2MJQi2Q2V18ZiAbR4li2MdQZAf7ZMXyYyjrefco1vW206O8HRE/AgMLyxZsTRUiijGUyyFB/qJzBMgd+EVqNYCe8lP8QwZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYWsd+4fipRywJ0S6WZSyV8NMkqnFRQrBEvr6oLTe50=;
 b=Los62aiyg3hnF2n5DOy9efQ6teBYUiG7eWvsCN9CnRJC1DrIiacfZkj5VnKvEETLWj8vXrr/VK1YJtCTeARclGjqlPvDk0aajMSH84gLuAEnPfV7HB1BXWVVXxys+9HEqYesVTwoCACpMwDNG4T4AJ276diUTa7o47PcXmn9nbRNOOA1M0YewaA5v9yWaVIO13lojWfotSAzxKg68Va/uPOxYBBrP1WLR9svD8xJdfjQ7Q05Ym8Oeu6mHxay9F1sLVlwFjIknrCw5qkbRHH4erHtj0dQE77uKxu5jvMsOc5gnGrzLL7rhxRw8U5cX8R2UgsJky00dGXXuXPRrxzlQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN7PR12MB2593.namprd12.prod.outlook.com (20.176.27.87) by
 BN7PR12MB2610.namprd12.prod.outlook.com (20.176.26.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.22; Mon, 2 Dec 2019 17:35:47 +0000
Received: from BN7PR12MB2593.namprd12.prod.outlook.com
 ([fe80::2070:7583:3718:d019]) by BN7PR12MB2593.namprd12.prod.outlook.com
 ([fe80::2070:7583:3718:d019%3]) with mapi id 15.20.2495.014; Mon, 2 Dec 2019
 17:35:46 +0000
From: sunpeng.li@amd.com
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 33/51] drm/amd/display: Remove flag check in mpcc update
Date: Mon,  2 Dec 2019 12:33:47 -0500
Message-Id: <20191202173405.31582-34-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191202173405.31582-1-sunpeng.li@amd.com>
References: <20191202173405.31582-1-sunpeng.li@amd.com>
X-ClientProxiedBy: YTBPR01CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::42) To BN7PR12MB2593.namprd12.prod.outlook.com
 (2603:10b6:408:25::23)
MIME-Version: 1.0
X-Mailer: git-send-email 2.24.0
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ecd78d4e-0619-4838-36f3-08d7774dff51
X-MS-TrafficTypeDiagnostic: BN7PR12MB2610:|BN7PR12MB2610:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN7PR12MB26105336224111C559A217ED82430@BN7PR12MB2610.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0239D46DB6
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(396003)(39860400002)(346002)(136003)(189003)(199004)(76176011)(51416003)(52116002)(6512007)(66476007)(66556008)(15650500001)(316002)(50226002)(5660300002)(6916009)(81166006)(26005)(2616005)(99286004)(386003)(6506007)(1076003)(8936002)(11346002)(305945005)(446003)(81156014)(186003)(9686003)(6436002)(4326008)(8676002)(6486002)(7736002)(66946007)(54906003)(14444005)(48376002)(50466002)(86362001)(6116002)(2351001)(3846002)(2906002)(25786009)(36756003)(66066001)(2870700001)(2361001)(14454004)(478600001)(47776003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2610;
 H:BN7PR12MB2593.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 56isLlq2YbllD+ThpninPxokXFsJRc7BrVAU/mpOh02/+oDQxWNFui3Z7CVO2UlyammuJl/qPWi+pRCSMculWhkwRgIQm6n8M5cALxzmLT9EPO2JcB3XAT0TeQ35ZL7c5s7EeGDSIn6hVLubVOmv4x9Bx+dK8pF8P9RCACwnd9EE15aJ9+zdrEfCEYW5pq7UQmgBP4J/ijclxelC88l8WLDOa5/yxdY+9tl1nhrT40OCgWrcsyAmTGjeGDIxCiV4b2YG0ptIdq4f3LCSGykRF2glz/r1aZ43gKOk6E4HWqWE+kDBTlLq/RJtmiqD3Y2x+jtWDwQED5e+jHbB5oPNZ9O8GdDgX7dmhLv9xgzl/BYE1Zl6kCcSh/pyCleD0/964nEQ9pZcls/yNl7i8hNZ9GJTuIJIJQeFncz67rm0I9tl5ovL/gSOlUW6ROdRw09o
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecd78d4e-0619-4838-36f3-08d7774dff51
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2019 17:35:17.8682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ixS7g/QKD8SWEOmQyUeGN97vwQ0+2sUohu1fJWejB90lj1TUMKPSITD4pHgNqa/4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2610
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYWsd+4fipRywJ0S6WZSyV8NMkqnFRQrBEvr6oLTe50=;
 b=cdwKVxmVeIHd0ryvR9T8r2G/TSyVjRfigAh9TABPWP9TVvQsXKFhRJujp0HYNOcs57/nXA4Xtm4GbO+PiVbVVDO8itK/pjszWKl/WlwycphOtydF5Ah0FOfBnvU9EqKbcKtplbFtU0j4m8UCkU0YAhfIacYXEywUQgbCkmiqvv4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Sunpeng.Li@amd.com; 
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Leo Li <sunpeng.li@amd.com>, harry.wentland@amd.com,
 rodrigo.siqueira@amd.com, Noah Abradjian <noah.abradjian@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>, bhawanpreet.lakha@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTm9haCBBYnJhZGppYW4gPG5vYWguYWJyYWRqaWFuQGFtZC5jb20+CgpbV2h5XQpNUEND
IHByb2dyYW1taW5nIHdhcyBiZWluZyBtaXNzZWQgZHVyaW5nIGNlcnRhaW4gc3BsaXQgcGlwZSBl
bmFibGVzIGR1ZQp0byBmdWxsX3VwZGF0ZSBmbGFnIG5vdCBiZWluZyB0cnVlLiBUaGlzIGNhdXNl
ZCBhIG1vbWVudGFyeSBmbGFzaCBvbgpoYWxmIHRoZSBzY3JlZW4uIEFmdGVyIGRpc2N1c3Npb24s
IGRldGVybWluZWQgd2Ugc2hvdWxkIG5vdCBoYXZlIHRoYXQKZmxhZyBjaGVjayB3aXRoaW4gdXBk
YXRlX21wY2MsIGFzIGl0IHNob3VsZCBhbHdheXMgcGVyZm9ybSBmdWxsCnByb2dyYW1taW5nIHdo
ZW4gY2FsbGVkLgoKW0hvd10KUmVtb3ZlIGZsYWcgY2hlY2suIFdlIGNhbGwgdXBkYXRlX2JsZW5k
aW5nIHdpdGhpbiBpbnNlcnRfcGxhbmUsIHNvIHdlCmRvIG5vdCBuZWVkIHRvIHJlcGxhY2UgaXRz
IGNhbGwgZnJvbSB0aGUgaWYgYmxvY2suCgpTaWduZWQtb2ZmLWJ5OiBOb2FoIEFicmFkamlhbiA8
bm9haC5hYnJhZGppYW5AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IERteXRybyBMYWt0eXVzaGtpbiA8
RG15dHJvLkxha3R5dXNoa2luQGFtZC5jb20+CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlA
YW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBf
aHdzZXEuYyB8IDYgLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jCmlu
ZGV4IGVjZTA4MTc3MDhmNS4uZmIyMzE0MmNmNTM1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYwpAQCAtMjEzOSwxMiArMjEzOSw2
IEBAIHZvaWQgZGNuMjBfdXBkYXRlX21wY2Moc3RydWN0IGRjICpkYywgc3RydWN0IHBpcGVfY3R4
ICpwaXBlX2N0eCkKIAkgKi8KIAltcGNjX2lkID0gaHVicC0+aW5zdDsKIAotCS8qIElmIHRoZXJl
IGlzIG5vIGZ1bGwgdXBkYXRlLCBkb24ndCBuZWVkIHRvIHRvdWNoIE1QQyB0cmVlKi8KLQlpZiAo
IXBpcGVfY3R4LT5wbGFuZV9zdGF0ZS0+dXBkYXRlX2ZsYWdzLmJpdHMuZnVsbF91cGRhdGUpIHsK
LQkJbXBjLT5mdW5jcy0+dXBkYXRlX2JsZW5kaW5nKG1wYywgJmJsbmRfY2ZnLCBtcGNjX2lkKTsK
LQkJcmV0dXJuOwotCX0KLQogCS8qIGNoZWNrIGlmIHRoaXMgTVBDQyBpcyBhbHJlYWR5IGJlaW5n
IHVzZWQgKi8KIAluZXdfbXBjYyA9IG1wYy0+ZnVuY3MtPmdldF9tcGNjX2Zvcl9kcHAobXBjX3Ry
ZWVfcGFyYW1zLCBtcGNjX2lkKTsKIAkvKiByZW1vdmUgTVBDQyBpZiBiZWluZyB1c2VkICovCi0t
IAoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
