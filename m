Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 122B9A1156
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 08:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EFAB89F6D;
	Thu, 29 Aug 2019 06:05:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780051.outbound.protection.outlook.com [40.107.78.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90B589C8D;
 Thu, 29 Aug 2019 06:05:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YAEKhY3VRVJD2U4x32HCSPEB0jWu4quk5Yvnp7yNBQ093Ud4golmYG6HpDZXm0hmjEEb0xb/WrHe5Gog2tWnQMRoNBoIpS156XBX2itgrltSdsKrPUpwHSPTokVkGgulaeEKP+8NX2jmsBKrHvN5KvHYcf+lIrsys2zlJFExQqIaPB6AkhkpdE9nFBnPswOJ/5VnO625EpZi1MS7yfda+PCOF0IALSMbU9ZWpUSOs5SGtbcN7YlhNyqYwIe253EfddECfS3Y/EodAIlQHnURcPesv3jmpSLqk+Yszo/7Pmy3OrOoubnvtBPNoqcxYRp53u2p+5GZUm368e9Xxt2+iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSNgEF85IeOcqJFrAbHc5u9NbE1ewkRRWykeVKtI1w0=;
 b=bbcNT6zmxX4RNZvPDCae8lFTpm7a9Stgn8Us9KjfznMH5GlQC20EWVZG4fh0v22BgGzlKe/uWmeXCRKU1EAbcFjbDWuHi/S+LgMTG2VTTMfWqKjBnVp7Wt0pvO4wExm+Atk3wQw3KNcHduiEvPtSqdyuF4XHJ0bW3vys/6YntS+f2giCLLO2GV48Lf25zJMT5gFolM4vGJAC+saOsf/PfxHjYzWuNGUZsGOXIQ8RLnzFzVZ8hghimLLd3FzkQNj49sQt2Mt/GTjYhOFgZkSglDZMx6cgN5bZ6EkbzLJyY+nn4/e6vy2Q8QsXze32BlN6Jw+A7+pXBvVvdx5KNZ1kgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=cray.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0015.namprd12.prod.outlook.com (2603:10b6:610:57::25)
 by BN6PR12MB1265.namprd12.prod.outlook.com (2603:10b6:404:1d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.19; Thu, 29 Aug
 2019 06:05:42 +0000
Received: from CO1NAM03FT045.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::202) by CH2PR12CA0015.outlook.office365.com
 (2603:10b6:610:57::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.18 via Frontend
 Transport; Thu, 29 Aug 2019 06:05:42 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT045.mail.protection.outlook.com (10.152.81.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Thu, 29 Aug 2019 06:05:41 +0000
Received: from kho-5039A.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 29 Aug 2019
 01:05:40 -0500
From: Kenny Ho <Kenny.Ho@amd.com>
To: <y2kenny@gmail.com>, <cgroups@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <tj@kernel.org>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <felix.kuehling@amd.com>, <joseph.greathouse@amd.com>, <jsparks@cray.com>,
 <lkaplan@cray.com>, <daniel@ffwll.ch>
Subject: [PATCH RFC v4 00/16] new cgroup controller for gpu/drm subsystem
Date: Thu, 29 Aug 2019 02:05:17 -0400
Message-ID: <20190829060533.32315-1-Kenny.Ho@amd.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(39860400002)(346002)(2980300002)(428003)(189003)(199004)(4326008)(126002)(5660300002)(336012)(81156014)(48376002)(81166006)(36756003)(305945005)(50466002)(8676002)(2616005)(110136005)(476003)(2870700001)(478600001)(47776003)(426003)(2906002)(86362001)(2201001)(26005)(7696005)(6306002)(966005)(50226002)(53936002)(356004)(6666004)(1076003)(486006)(53416004)(316002)(186003)(14444005)(8936002)(70586007)(70206006)(51416003)(921003)(83996005)(2101003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1265; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef6e4f53-a1dc-4478-2577-08d72c46ec3a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BN6PR12MB1265; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1265:
X-MS-Exchange-PUrlCount: 11
X-Microsoft-Antispam-PRVS: <BN6PR12MB1265227FCEA822948F4BA80883A20@BN6PR12MB1265.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0144B30E41
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: m94ctZ32wtyu66gtNnyjCNnacgZ3MkBdTTErLhtiAMl9Vvx5Gqu0ZcM8beGiA3wu/Rn1Hi34pfsUCbuoFoIr4gSIsQX5NITvgYnW82MkgqwLL06yzuCv26R7/yp9+0JSqRJ4LZFLCWY7+1e10coddUVkyXVvbzZIrXaNLJWnXnlzmql/F6wZuzavFo7eEI6VW8bEvMyhtCshfMh41JVdh8UP6CrMjC7K/nVfeG/tC99f30ygSVDblMNXASLlazy11XidGcxnmxCHHf5wvpFXrbR9+KG/R5U68vQt+opSXy0owphqiewqmxHB0AeI9lJkavevYa0a0yv8PZblcOT4VgbV+J2a72gBHu1dlHzbkAzgkr6ytWcicb3kRqHpO9TgW6EPNwJW4i1IrD4FyafYTTxTayoAdXQzkj+skaddksM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2019 06:05:41.3146 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef6e4f53-a1dc-4478-2577-08d72c46ec3a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1265
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSNgEF85IeOcqJFrAbHc5u9NbE1ewkRRWykeVKtI1w0=;
 b=SBH1lU4s+VBhtUxURvXXe25xqmne+sLHaPeo5R67M1jU/NS1oKwTczeBTgxhbDCKBX+fPhQ6rC/w7FXDoZvYmH+XY/U2cYXOm7BedKrMibrnapXI9vdNiBmnPON6TGSG3aowv5ffqgVIZbeGP4gjjfx16h8poGsjKHZWzCulSqM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; cray.com; dkim=none (message not signed)
 header.d=none;cray.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: Kenny Ho <Kenny.Ho@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBpcyBhIGZvbGxvdyB1cCB0byB0aGUgUkZDIEkgbWFkZSBwcmV2aW91c2x5IHRvIGludHJv
ZHVjZSBhIGNncm91cApjb250cm9sbGVyIGZvciB0aGUgR1BVL0RSTSBzdWJzeXN0ZW0gW3YxLHYy
LHYzXS4gIFRoZSBnb2FsIGlzIHRvIGJlIGFibGUgdG8KcHJvdmlkZSByZXNvdXJjZSBtYW5hZ2Vt
ZW50IHRvIEdQVSByZXNvdXJjZXMgdXNpbmcgdGhpbmdzIGxpa2UgY29udGFpbmVyLiAgCgpXaXRo
IHRoaXMgUkZDIHY0LCBJIGFtIGhvcGluZyB0byBoYXZlIHNvbWUgY29uc2Vuc3VzIG9uIGEgbWVy
Z2UgcGxhbi4gIEkgYmVsaWV2ZQp0aGUgR0VNIHJlbGF0ZWQgcmVzb3VyY2VzIChkcm0uYnVmZmVy
LiopIGludHJvZHVjZWQgaW4gcHJldmlvdXMgUkZDIGFuZCwKaG9wZWZ1bGx5LCB0aGUgbG9naWNh
bCBHUFUgY29uY2VwdCAoZHJtLmxncHUuKikgaW50cm9kdWNlZCBpbiB0aGlzIFJGQyBhcmUKdW5j
b250cm92ZXJzaWFsIGFuZCByZWFkeSB0byBtb3ZlIG91dCBvZiBSRkMgYW5kIGludG8gYSBtb3Jl
IGZvcm1hbCByZXZpZXcuICBJCndpbGwgY29udGludWUgdG8gd29yayBvbiB0aGUgbWVtb3J5IGJh
Y2tlbmQgcmVzb3VyY2VzIChkcm0ubWVtb3J5LiopLgoKVGhlIGNvdmVyIGxldHRlciBmcm9tIHYx
IGlzIGNvcGllZCBiZWxvdyBmb3IgcmVmZXJlbmNlLgoKW3YxXTogaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRldmVsLzIwMTgtTm92ZW1iZXIvMTk3MTA2Lmh0bWwK
W3YyXTogaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvY2dyb3Vwcy9tc2cyMjA3NC5odG1s
Clt2M106IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2FtZC1nZngvMjAx
OS1KdW5lLzAzNjAyNi5odG1sCgp2NDoKVW5jaGFuZ2VkIChubyByZXZpZXcgbmVlZGVkKQoqIGRy
bS5tZW1vcnkuKi90dG0gcmVzb3VyY2VzIChQYXRjaCA5LTEzLCBJIGFtIHN0aWxsIHdvcmtpbmcg
b24gbWVtb3J5IGJhbmR3aWR0aAphbmQgc2hyaW5rZXIpCkJhc2Ugb24gZmVlZGJhY2tzIG9uIHYz
OgoqIHVwZGF0ZSBub21pbmNsYXR1cmUgdG8gZHJtY2cKKiBlbWJlZCBwZXIgZGV2aWNlIGRybWNn
IHByb3BlcnRpZXMgaW50byBkcm1fZGV2aWNlCiogc3BsaXQgR0VNIGJ1ZmZlciByZWxhdGVkIGNv
bW1pdHMgaW50byBzdGF0cyBhbmQgbGltaXQKKiByZW5hbWUgZnVuY3Rpb24gbmFtZSB0byBhbGln
biB3aXRoIGNvbnZlbnRpb24KKiBjb21iaW5lZCBidWZmZXIgYWNjb3VudGluZyBhbmQgY2hlY2sg
aW50byBhIHRyeV9jaGFyZ2UgZnVuY3Rpb24KKiBzdXBwb3J0IGJ1ZmZlciBzdGF0cyB3aXRob3V0
IGxpbWl0IGVuZm9yY2VtZW50CiogcmVtb3ZlZCBHRU0gYnVmZmVyIHNoYXJpbmcgbGltaXRhdGlv
bgoqIHVwZGF0ZWQgZG9jdW1lbnRhdGlvbnMKTmV3IGZlYXR1cmVzOgoqIGludHJvZHVjaW5nIGxv
Z2ljYWwgR1BVIGNvbmNlcHQKKiBleGFtcGxlIGltcGxlbWVudGF0aW9uIHdpdGggQU1EIEtGRAoK
djM6CkJhc2Ugb24gZmVlZGJhY2tzIG9uIHYyOgoqIHJlbW92ZWQgLmhlbHAgdHlwZSBmaWxlIGZy
b20gdjIKKiBjb25mb3JtIHRvIGNncm91cCBjb252ZW50aW9uIGZvciBkZWZhdWx0IGFuZCBtYXgg
aGFuZGxpbmcKKiBjb25mb3JtIHRvIGNncm91cCBjb252ZW50aW9uIGZvciBhZGRyZXNzaW5nIGRl
dmljZSBzcGVjaWZpYyBsaW1pdHMgKHdpdGggbWFqb3I6bWlub3IpCk5ldyBmdW5jdGlvbjoKKiBh
ZG9wdGVkIG1lbXBhcnNlIGZvciBtZW1vcnkgc2l6ZSByZWxhdGVkIGF0dHJpYnV0ZXMKKiBhZGRl
ZCBtYWNybyB0byBtYXJzaGFsbCBkcm1jZ3JwIGNmdHlwZSBwcml2YXRlICAoRFJNQ0dfQ1RGX1BS
SVYsIGV0Yy4pCiogYWRkZWQgdHRtIGJ1ZmZlciB1c2FnZSBzdGF0cyAocGVyIGNncm91cCwgZm9y
IHN5c3RlbSwgdHQsIHZyYW0uKQoqIGFkZGVkIHR0bSBidWZmZXIgdXNhZ2UgbGltaXQgKHBlciBj
Z3JvdXAsIGZvciB2cmFtLikKKiBhZGRlZCBwZXIgY2dyb3VwIGJhbmR3aWR0aCBzdGF0cyBhbmQg
bGltaXRpbmcgKGJ1cnN0IGFuZCBhdmVyYWdlIGJhbmR3aWR0aCkKCnYyOgoqIFJlbW92ZWQgdGhl
IHZlbmRvcmluZyBjb25jZXB0cwoqIEFkZCBsaW1pdCB0byB0b3RhbCBidWZmZXIgYWxsb2NhdGlv
bgoqIEFkZCBsaW1pdCB0byB0aGUgbWF4aW11bSBzaXplIG9mIGEgYnVmZmVyIGFsbG9jYXRpb24K
CnYxOiBjb3ZlciBsZXR0ZXIKClRoZSBwdXJwb3NlIG9mIHRoaXMgcGF0Y2ggc2VyaWVzIGlzIHRv
IHN0YXJ0IGEgZGlzY3Vzc2lvbiBmb3IgYSBnZW5lcmljIGNncm91cApjb250cm9sbGVyIGZvciB0
aGUgZHJtIHN1YnN5c3RlbS4gIFRoZSBkZXNpZ24gcHJvcG9zZWQgaGVyZSBpcyBhIHZlcnkgZWFy
bHkgb25lLgpXZSBhcmUgaG9waW5nIHRvIGVuZ2FnZSB0aGUgY29tbXVuaXR5IGFzIHdlIGRldmVs
b3AgdGhlIGlkZWEuCgoKQmFja2dyb3VuZHMKPT09PT09PT09PQpDb250cm9sIEdyb3Vwcy9jZ3Jv
dXAgcHJvdmlkZSBhIG1lY2hhbmlzbSBmb3IgYWdncmVnYXRpbmcvcGFydGl0aW9uaW5nIHNldHMg
b2YKdGFza3MsIGFuZCBhbGwgdGhlaXIgZnV0dXJlIGNoaWxkcmVuLCBpbnRvIGhpZXJhcmNoaWNh
bCBncm91cHMgd2l0aCBzcGVjaWFsaXplZApiZWhhdmlvdXIsIHN1Y2ggYXMgYWNjb3VudGluZy9s
aW1pdGluZyB0aGUgcmVzb3VyY2VzIHdoaWNoIHByb2Nlc3NlcyBpbiBhIGNncm91cApjYW4gYWNj
ZXNzWzFdLiAgV2VpZ2h0cywgbGltaXRzLCBwcm90ZWN0aW9ucywgYWxsb2NhdGlvbnMgYXJlIHRo
ZSBtYWluIHJlc291cmNlCmRpc3RyaWJ1dGlvbiBtb2RlbHMuICBFeGlzdGluZyBjZ3JvdXAgY29u
dHJvbGxlcnMgaW5jbHVkZXMgY3B1LCBtZW1vcnksIGlvLApyZG1hLCBhbmQgbW9yZS4gIGNncm91
cCBpcyBvbmUgb2YgdGhlIGZvdW5kYXRpb25hbCB0ZWNobm9sb2dpZXMgdGhhdCBlbmFibGVzIHRo
ZQpwb3B1bGFyIGNvbnRhaW5lciBhcHBsaWNhdGlvbiBkZXBsb3ltZW50IGFuZCBtYW5hZ2VtZW50
IG1ldGhvZC4KCkRpcmVjdCBSZW5kZXJpbmcgTWFuYWdlci9kcm0gY29udGFpbnMgY29kZSBpbnRl
bmRlZCB0byBzdXBwb3J0IHRoZSBuZWVkcyBvZgpjb21wbGV4IGdyYXBoaWNzIGRldmljZXMuIEdy
YXBoaWNzIGRyaXZlcnMgaW4gdGhlIGtlcm5lbCBtYXkgbWFrZSB1c2Ugb2YgRFJNCmZ1bmN0aW9u
cyB0byBtYWtlIHRhc2tzIGxpa2UgbWVtb3J5IG1hbmFnZW1lbnQsIGludGVycnVwdCBoYW5kbGlu
ZyBhbmQgRE1BCmVhc2llciwgYW5kIHByb3ZpZGUgYSB1bmlmb3JtIGludGVyZmFjZSB0byBhcHBs
aWNhdGlvbnMuICBUaGUgRFJNIGhhcyBhbHNvCmRldmVsb3BlZCBiZXlvbmQgdHJhZGl0aW9uYWwg
Z3JhcGhpY3MgYXBwbGljYXRpb25zIHRvIHN1cHBvcnQgY29tcHV0ZS9HUEdQVQphcHBsaWNhdGlv
bnMuCgoKTW90aXZhdGlvbnMKPT09PT09PT09CkFzIEdQVSBncm93IGJleW9uZCB0aGUgcmVhbG0g
b2YgZGVza3RvcC93b3Jrc3RhdGlvbiBncmFwaGljcyBpbnRvIGFyZWFzIGxpa2UKZGF0YSBjZW50
ZXIgY2x1c3RlcnMgYW5kIElvVCwgdGhlcmUgYXJlIGluY3JlYXNpbmcgbmVlZHMgdG8gbW9uaXRv
ciBhbmQgcmVndWxhdGUKR1BVIGFzIGEgcmVzb3VyY2UgbGlrZSBjcHUsIG1lbW9yeSBhbmQgaW8u
CgpNYXR0IFJvcGVyIGZyb20gSW50ZWwgYmVnYW4gd29ya2luZyBvbiBzaW1pbGFyIGlkZWEgaW4g
ZWFybHkgMjAxOCBbMl0gZm9yIHRoZQpwdXJwb3NlIG9mIG1hbmFnaW5nIEdQVSBwcmlvcml0eSB1
c2luZyB0aGUgY2dyb3VwIGhpZXJhcmNoeS4gIFdoaWxlIHRoYXQKcGFydGljdWxhciB1c2UgY2Fz
ZSBtYXkgbm90IHdhcnJhbnQgYSBzdGFuZGFsb25lIGRybSBjZ3JvdXAgY29udHJvbGxlciwgdGhl
cmUKYXJlIG90aGVyIHVzZSBjYXNlcyB3aGVyZSBoYXZpbmcgb25lIGNhbiBiZSB1c2VmdWwgWzNd
LiAgTW9uaXRvcmluZyBHUFUKcmVzb3VyY2VzIHN1Y2ggYXMgVlJBTSBhbmQgYnVmZmVycywgQ1Ug
KGNvbXB1dGUgdW5pdCBbQU1EJ3Mgbm9tZW5jbGF0dXJlXSkvRVUKKGV4ZWN1dGlvbiB1bml0IFtJ
bnRlbCdzIG5vbWVuY2xhdHVyZV0pLCBHUFUgam9iIHNjaGVkdWxpbmcgWzRdIGNhbiBoZWxwCnN5
c2FkbWlucyBnZXQgYSBiZXR0ZXIgdW5kZXJzdGFuZGluZyBvZiB0aGUgYXBwbGljYXRpb25zIHVz
YWdlIHByb2ZpbGUuICBGdXJ0aGVyCnVzYWdlIHJlZ3VsYXRpb25zIG9mIHRoZSBhZm9yZW1lbnRp
b25lZCByZXNvdXJjZXMgY2FuIGFsc28gaGVscCBzeXNhZG1pbnMKb3B0aW1pemUgd29ya2xvYWQg
ZGVwbG95bWVudCBvbiBsaW1pdGVkIEdQVSByZXNvdXJjZXMuCgpXaXRoIHRoZSBpbmNyZWFzZWQg
aW1wb3J0YW5jZSBvZiBtYWNoaW5lIGxlYXJuaW5nLCBkYXRhIHNjaWVuY2UgYW5kIG90aGVyCmNs
b3VkLWJhc2VkIGFwcGxpY2F0aW9ucywgR1BVcyBhcmUgYWxyZWFkeSBpbiBwcm9kdWN0aW9uIHVz
ZSBpbiBkYXRhIGNlbnRlcnMKdG9kYXkgWzUsNiw3XS4gIEV4aXN0aW5nIEdQVSByZXNvdXJjZSBt
YW5hZ2VtZW50IGlzIHZlcnkgY291cnNlIGdyYWluLCBob3dldmVyLAphcyBzeXNhZG1pbnMgYXJl
IG9ubHkgYWJsZSB0byBkaXN0cmlidXRlIHdvcmtsb2FkIG9uIGEgcGVyLUdQVSBiYXNpcyBbOF0u
ICBBbgphbHRlcm5hdGl2ZSBpcyB0byB1c2UgR1BVIHZpcnR1YWxpemF0aW9uICh3aXRoIG9yIHdp
dGhvdXQgU1JJT1YpIGJ1dCBpdApnZW5lcmFsbHkgYWN0cyBvbiB0aGUgZW50aXJlIEdQVSBpbnN0
ZWFkIG9mIHRoZSBzcGVjaWZpYyByZXNvdXJjZXMgaW4gYSBHUFUuCldpdGggYSBkcm0gY2dyb3Vw
IGNvbnRyb2xsZXIsIHdlIGNhbiBlbmFibGUgYWx0ZXJuYXRlLCBmaW5lLWdyYWluLCBzdWItR1BV
CnJlc291cmNlIG1hbmFnZW1lbnQgKGluIGFkZGl0aW9uIHRvIHdoYXQgbWF5IGJlIGF2YWlsYWJs
ZSB2aWEgR1BVCnZpcnR1YWxpemF0aW9uLikKCkluIGFkZGl0aW9uIHRvIHByb2R1Y3Rpb24gdXNl
LCB0aGUgRFJNIGNncm91cCBjYW4gYWxzbyBoZWxwIHdpdGggdGVzdGluZwpncmFwaGljcyBhcHBs
aWNhdGlvbiByb2J1c3RuZXNzIGJ5IHByb3ZpZGluZyBhIG1lYW4gdG8gYXJ0aWZpY2lhbGx5IGxp
bWl0IERSTQpyZXNvdXJjZXMgYXZhaWxibGUgdG8gdGhlIGFwcGxpY2F0aW9ucy4KCgpDaGFsbGVu
Z2VzCj09PT09PT09CldoaWxlIHRoZXJlIGFyZSBjb21tb24gaW5mcmFzdHJ1Y3R1cmUgaW4gRFJN
IHRoYXQgaXMgc2hhcmVkIGFjcm9zcyBtYW55IHZlbmRvcnMKKHRoZSBzY2hlZHVsZXIgWzRdIGZv
ciBleGFtcGxlKSwgdGhlcmUgYXJlIGFsc28gYXNwZWN0cyBvZiBEUk0gdGhhdCBhcmUgdmVuZG9y
CnNwZWNpZmljLiAgVG8gYWNjb21tb2RhdGUgdGhpcywgd2UgYm9ycm93ZWQgdGhlIG1lY2hhbmlz
bSB1c2VkIGJ5IHRoZSBjZ3JvdXAgdG8KaGFuZGxlIGRpZmZlcmVudCBraW5kcyBvZiBjZ3JvdXAg
Y29udHJvbGxlci4KClJlc291cmNlcyBmb3IgRFJNIGFyZSBhbHNvIG9mdGVuIGRldmljZSAoR1BV
KSBzcGVjaWZpYyBpbnN0ZWFkIG9mIHN5c3RlbQpzcGVjaWZpYyBhbmQgYSBzeXN0ZW0gbWF5IGNv
bnRhaW4gbW9yZSB0aGFuIG9uZSBHUFUuICBGb3IgdGhpcywgd2UgYm9ycm93ZWQgc29tZQpvZiB0
aGUgaWRlYXMgZnJvbSBSRE1BIGNncm91cCBjb250cm9sbGVyLgoKQXBwcm9hY2gKPT09PT09PQpU
byBleHBlcmltZW50IHdpdGggdGhlIGlkZWEgb2YgYSBEUk0gY2dyb3VwLCB3ZSB3b3VsZCBsaWtl
IHRvIHN0YXJ0IHdpdGggYmFzaWMKYWNjb3VudGluZyBhbmQgc3RhdGlzdGljcywgdGhlbiBjb250
aW51ZSB0byBpdGVyYXRlIGFuZCBhZGQgcmVndWxhdGluZwptZWNoYW5pc21zIGludG8gdGhlIGRy
aXZlci4KClsxXSBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9Eb2N1bWVudGF0aW9uL2Nncm91
cC12MS9jZ3JvdXBzLnR4dApbMl0gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2
ZXMvaW50ZWwtZ2Z4LzIwMTgtSmFudWFyeS8xNTMxNTYuaHRtbApbM10gaHR0cHM6Ly93d3cuc3Bp
bmljcy5uZXQvbGlzdHMvY2dyb3Vwcy9tc2cyMDcyMC5odG1sCls0XSBodHRwczovL2VsaXhpci5i
b290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIK
WzVdIGh0dHBzOi8va3ViZXJuZXRlcy5pby9kb2NzL3Rhc2tzL21hbmFnZS1ncHVzL3NjaGVkdWxp
bmctZ3B1cy8KWzZdIGh0dHBzOi8vYmxvZy5vcGVuc2hpZnQuY29tL2dwdS1hY2NlbGVyYXRlZC1z
cWwtcXVlcmllcy13aXRoLXBvc3RncmVzcWwtcGctc3Ryb20taW4tb3BlbnNoaWZ0LTMtMTAvCls3
XSBodHRwczovL2dpdGh1Yi5jb20vUmFkZW9uT3BlbkNvbXB1dGUvazhzLWRldmljZS1wbHVnaW4K
WzhdIGh0dHBzOi8vZ2l0aHViLmNvbS9rdWJlcm5ldGVzL2t1YmVybmV0ZXMvaXNzdWVzLzUyNzU3
CgpLZW5ueSBIbyAoMTYpOgogIGRybTogQWRkIGRybV9taW5vcl9mb3JfZWFjaAogIGNncm91cDog
SW50cm9kdWNlIGNncm91cCBmb3IgZHJtIHN1YnN5c3RlbQogIGRybSwgY2dyb3VwOiBJbml0aWFs
aXplIGRybWNnIHByb3BlcnRpZXMKICBkcm0sIGNncm91cDogQWRkIHRvdGFsIEdFTSBidWZmZXIg
YWxsb2NhdGlvbiBzdGF0cwogIGRybSwgY2dyb3VwOiBBZGQgcGVhayBHRU0gYnVmZmVyIGFsbG9j
YXRpb24gc3RhdHMKICBkcm0sIGNncm91cDogQWRkIEdFTSBidWZmZXIgYWxsb2NhdGlvbiBjb3Vu
dCBzdGF0cwogIGRybSwgY2dyb3VwOiBBZGQgdG90YWwgR0VNIGJ1ZmZlciBhbGxvY2F0aW9uIGxp
bWl0CiAgZHJtLCBjZ3JvdXA6IEFkZCBwZWFrIEdFTSBidWZmZXIgYWxsb2NhdGlvbiBsaW1pdAog
IGRybSwgY2dyb3VwOiBBZGQgVFRNIGJ1ZmZlciBhbGxvY2F0aW9uIHN0YXRzCiAgZHJtLCBjZ3Jv
dXA6IEFkZCBUVE0gYnVmZmVyIHBlYWsgdXNhZ2Ugc3RhdHMKICBkcm0sIGNncm91cDogQWRkIHBl
ciBjZ3JvdXAgYncgbWVhc3VyZSBhbmQgY29udHJvbAogIGRybSwgY2dyb3VwOiBBZGQgc29mdCBW
UkFNIGxpbWl0CiAgZHJtLCBjZ3JvdXA6IEFsbG93IG1vcmUgYWdncmVzc2l2ZSBtZW1vcnkgcmVj
bGFpbQogIGRybSwgY2dyb3VwOiBJbnRyb2R1Y2UgbGdwdSBhcyBEUk0gY2dyb3VwIHJlc291cmNl
CiAgZHJtLCBjZ3JvdXA6IGFkZCB1cGRhdGUgdHJpZ2dlciBhZnRlciBsaW1pdCBjaGFuZ2UKICBk
cm0vYW1kZ3B1OiBJbnRlZ3JhdGUgd2l0aCBEUk0gY2dyb3VwCgogRG9jdW1lbnRhdGlvbi9hZG1p
bi1ndWlkZS9jZ3JvdXAtdjIucnN0ICAgICAgIHwgIDE2MyArLQogRG9jdW1lbnRhdGlvbi9jZ3Jv
dXAtdjEvZHJtLnJzdCAgICAgICAgICAgICAgIHwgICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfYW1ka2ZkLmggICAgfCAgICA0ICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kcnYuYyAgICAgICB8ICAgMjkgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X29iamVjdC5jICAgIHwgICAgNiArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3R0bS5jICAgICAgIHwgICAgMyArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX2NoYXJkZXYuYyAgICAgIHwgICAgNiArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfcHJpdi5oICAgICAgICAgfCAgICAzICsKIC4uLi9hbWQvYW1ka2ZkL2tmZF9wcm9j
ZXNzX3F1ZXVlX21hbmFnZXIuYyAgICB8ICAxNDAgKysKIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2
LmMgICAgICAgICAgICAgICAgICAgICB8ICAgMjYgKwogZHJpdmVycy9ncHUvZHJtL2RybV9nZW0u
YyAgICAgICAgICAgICAgICAgICAgIHwgICAxNiArLQogZHJpdmVycy9ncHUvZHJtL2RybV9pbnRl
cm5hbC5oICAgICAgICAgICAgICAgIHwgICAgNCAtCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9i
by5jICAgICAgICAgICAgICAgICAgfCAgIDkzICsrCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9i
b191dGlsLmMgICAgICAgICAgICAgfCAgICA0ICsKIGluY2x1ZGUvZHJtL2RybV9jZ3JvdXAuaCAg
ICAgICAgICAgICAgICAgICAgICB8ICAxMjIgKysKIGluY2x1ZGUvZHJtL2RybV9kZXZpY2UuaCAg
ICAgICAgICAgICAgICAgICAgICB8ICAgIDcgKwogaW5jbHVkZS9kcm0vZHJtX2Rydi5oICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgICAyMyArCiBpbmNsdWRlL2RybS9kcm1fZ2VtLmggICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDEzICstCiBpbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5o
ICAgICAgICAgICAgICAgICAgfCAgICAyICsKIGluY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVy
LmggICAgICAgICAgICAgICB8ICAgMTAgKwogaW5jbHVkZS9saW51eC9jZ3JvdXBfZHJtLmggICAg
ICAgICAgICAgICAgICAgIHwgIDE1MSArKwogaW5jbHVkZS9saW51eC9jZ3JvdXBfc3Vic3lzLmgg
ICAgICAgICAgICAgICAgIHwgICAgNCArCiBpbml0L0tjb25maWcgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgICA1ICsKIGtlcm5lbC9jZ3JvdXAvTWFrZWZpbGUgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgIDEgKwoga2VybmVsL2Nncm91cC9kcm0uYyAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgMTM2NyArKysrKysrKysrKysrKysrKwogMjUgZmlsZXMgY2hhbmdlZCwg
MjE5MyBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL2Nncm91cC12MS9kcm0ucnN0CiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVk
ZS9kcm0vZHJtX2Nncm91cC5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9jZ3Jv
dXBfZHJtLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBrZXJuZWwvY2dyb3VwL2RybS5jCgotLSAKMi4y
Mi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
